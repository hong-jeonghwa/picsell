package com.picsell;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.join.CustomInfo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.util.DBCPConn;
import com.util.FileManager;
import com.util.MyUtil;

public class PicSellServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	static String t = "";

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doPost(req, resp);

	}

	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url)
			throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String cp = req.getContextPath();
		String uri = req.getRequestURI();
		String url = "";
		Connection conn = DBCPConn.getConnection();

		ImageUploadDAO up_dao = new ImageUploadDAO(conn);
		PicSellDAO main_dao = new PicSellDAO(conn);
		PicSellPaymentDAO paymentDAO = new PicSellPaymentDAO(DBCPConn.getConnection());
		PicsellUserDAO join_dao = new PicsellUserDAO(conn);
		PicsellImageDAO psImagedao = new PicsellImageDAO(DBCPConn.getConnection());

		MyUtil myUtil = new MyUtil();

		String root = getServletContext().getRealPath("/");
		String path = root + File.separator + "pds" + File.separator + "saveImageFile";

		File f = new File(path);

		if (!f.exists()) {
			f.mkdirs();
		}

		if (uri.indexOf("charge.do") != -1) {

			List<PicSellPaymentDTO> lists = paymentDAO.getChargeData();

			req.setAttribute("lists", lists);

			url = "/psPage/chargePage2.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("charge_ok.do") != -1) {

			int chargePoint = Integer.parseInt(req.getParameter("hdcp"));
			String loginUser = "";
			int userPoint = 0;

			HttpSession session = req.getSession();

			PicSellCustomInfo info = (PicSellCustomInfo) session.getAttribute("PicSellCustomInfo");

			userPoint = info.getChargePoint();
			loginUser = info.getUserId();

			paymentDAO.updateUploadUser(loginUser, chargePoint); // 업로드한사람 포인트 +업데이트

			PicsellUserDTO join_dto = join_dao.getReadData(loginUser);

			info.setUserId(join_dto.getUserId());
			info.setUserName(join_dto.getUserName());
			info.setChargePoint(join_dto.getChargePoint());

			session.setAttribute("PicSellCustomInfo", info);

			url = cp + "/picsell/charge.do";
			resp.sendRedirect(url);
			// forward(req, resp, url);

		} else if (uri.indexOf("basket_payment.do") != -1) {

			HttpSession session = req.getSession();

			PicSellCustomInfo info = (PicSellCustomInfo) session.getAttribute("PicSellCustomInfo");

			int userPoint = info.getChargePoint();
			String downloadUser = info.getUserId();
			List<PicBasketDTO> lists = psImagedao.getLists(info.getUserId());

			System.out.println("userPoint : " + userPoint);
			System.out.println("downloadUser : " + downloadUser);

			/*
			 * if (userPoint < sumPoint) { // 다운로드 코인이 유저가 보유한 코인보다 클 경우
			 * 
			 * // 충전하시겠습니까 메세지창 띄운 뒤 확인 누르면 넘어가게해야됨 req.setAttribute("message",
			 * "충전하시겠습니까?"); url = "/psPage/down_download.jsp"; forward(req, resp, url);
			 * 
			 * return;
			 * 
			 * }
			 */

			for (PicBasketDTO dto : lists) {

				System.out.println("lists.size() : " + lists.size());
				System.out.println("dto.getImageCode() : " + dto.getImageCode());

				String uploadUserID = dto.getUploadUser();
				int imagePoint = dto.getImagePoint();

				PicsellImageDTO imagedto = psImagedao.selectImage(dto.getImageCode());
				System.out.println("imagedto.getFileName() : " + imagedto.getFileName());
				System.out.println("imagedto.getOriginalName() : " + imagedto.getOriginalName());

				// 이미지 무료
				boolean flag = FileManager.doFileDownload(resp, imagedto.getFileName(), imagedto.getOriginalName(),
						path);
				System.out.println(flag);

				if (!flag) {

					resp.setContentType("text/html;charset=utf-8");

					PrintWriter out = resp.getWriter();

					out.print("<script type='text/javascript'>");
					out.print("alert('Download Error');");
					out.print("history back();");
					out.print("</script>");

				}

				userPoint -= imagePoint;

				paymentDAO.updateDownloadUser(downloadUser, userPoint); // 다운받은사람 포인트 -업데이트
				paymentDAO.updateUploadUser(uploadUserID, imagePoint); // 업로드한사람 포인트 +업데이트
				paymentDAO.clearBasket(downloadUser); // 장바구니에서 전부가 다운 받지 않을경우 추가해야됨

			}

			PicsellUserDTO join_dto = join_dao.getReadData(downloadUser);

			info.setUserId(join_dto.getUserId());
			info.setUserName(join_dto.getUserName());
			info.setChargePoint(join_dto.getChargePoint());

			System.out.println("join_dto.getUserId() : " + join_dto.getUserId());
			System.out.println("join_dto.getUserName() : " + join_dto.getUserName());
			System.out.println("join_dto.getChrgePoint() : " + join_dto.getChargePoint());

			session.setAttribute("PicSellCustomInfo", info);

			url = cp + "/picsell/main.do";
			forward(req, resp, url);
			// resp.sendRedirect(url);

		} else if (uri.indexOf("payment.do") != -1) {

			String downloadUser = "";
			String totalImagePoint = req.getParameter("imagePoint");
			String uploadUserID = req.getParameter("uploadUserID");
			int userPoint = 0;
			int downloadPoint = 0;

			int imageCode = Integer.parseInt(req.getParameter("imageCode"));

			HttpSession session = req.getSession();

			PicSellCustomInfo info = (PicSellCustomInfo) session.getAttribute("PicSellCustomInfo");

			downloadPoint = Integer.parseInt(totalImagePoint);
			userPoint = info.getChargePoint();
			downloadUser = info.getUserId();

			if (userPoint < downloadPoint) { // 다운로드 코인이 유저가 보유한 코인보다 클 경우

				// 충전하시겠습니까 메세지창 띄운 뒤 확인 누르면 넘어가게해야됨
				req.setAttribute("message", "충전하시겠습니까?");

				url = "/picsell/charge.do";
				forward(req, resp, url);

				return;

			}

			PicsellImageDTO imagedto = psImagedao.selectImage(imageCode);

			// 이미지 무료
			boolean flag = FileManager.doFileDownload(resp, imagedto.getFileName(), imagedto.getOriginalName(), path);
			System.out.println(flag);

			if (!flag) {

				resp.setContentType("text/html;charset=utf-8");

				PrintWriter out = resp.getWriter();

				out.print("<script type='text/javascript'>");
				out.print("alert('Download Error');");
				out.print("history back();");
				out.print("</script>");

			}

			userPoint -= downloadPoint;

			paymentDAO.updateDownloadUser(downloadUser, userPoint); // 다운받은사람 포인트 -업데이트
			paymentDAO.updateUploadUser(uploadUserID, downloadPoint); // 업로드한사람 포인트 +업데이트
			paymentDAO.clearBasket(downloadUser); // 장바구니에서 전부가 다운 받지 않을경우 추가해야됨

			PicsellUserDTO join_dto = join_dao.getReadData(downloadUser);

			info.setUserId(join_dto.getUserId());
			info.setUserName(join_dto.getUserName());
			info.setChargePoint(join_dto.getChargePoint());

			System.out.println("userPoint : " + join_dto.getChargePoint());

			session.setAttribute("PicSellCustomInfo", info);

			url = cp + "/picsell/down_imageClick.do?imageCode=" + imageCode;
			resp.sendRedirect(url);

		} else if (uri.indexOf("created.do") != -1) {

			url = "/psPage/created.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("created_ok.do") != -1) {

			PicsellUserDTO join_dto = new PicsellUserDTO();

			// PicsellUserDTO join_dto = join_dao.getReadData(req.getParameter("userId"));
			String userId = req.getParameter("userId");
			System.out.println(userId);
			boolean flag = join_dao.duplicateIdCheck(userId);
			if (flag == false) {
				join_dto.setUserId(req.getParameter("userId"));
				join_dto.setUserPwd(req.getParameter("userPwd"));
				join_dto.setUserName(req.getParameter("userName"));
				join_dto.setUserEmail(req.getParameter("userEmail"));
				join_dto.setUserTel(Integer.parseInt(req.getParameter("userTel")));
				join_dao.insertData(join_dto);
				url = cp + "/picsell/login.do";
				resp.sendRedirect(url);
				return;
			} else {
				req.setAttribute("message", "아이디 중복");
				url = "/picsell/created.do";
				forward(req, resp, url);
			}

		} else if (uri.indexOf("login.do") != -1) {

			url = "/psPage/login.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("login_ok.do") != -1) {
			String userId = req.getParameter("userId");
			String userPwd = req.getParameter("userPwd");
			System.out.println(userId + " + " + userPwd);

			PicsellUserDTO join_dto = join_dao.getReadData(userId);

			if (join_dto == null || !join_dto.getUserId().equals(userId) || !join_dto.getUserPwd().equals(userPwd)) {

				req.setAttribute("message", "아이디 또는 패스워드를 정확히 입력하세요");

				url = "/picsell/login.do";
				forward(req, resp, url);

				return;
			}

			HttpSession session = req.getSession();

			PicSellCustomInfo info = new PicSellCustomInfo();

			info.setUserId(join_dto.getUserId());
			info.setUserName(join_dto.getUserName());
			info.setChargePoint(join_dto.getChargePoint());

			session.setAttribute("PicSellCustomInfo", info);
			System.out.println(info.getChargePoint());
			url = cp + "/picsell/main.do";

			resp.sendRedirect(url);

		} else if (uri.indexOf("logout.do") != -1) {

			HttpSession session = req.getSession();
			session.removeAttribute("PicSellCustomInfo");
			session.invalidate();

			url = cp + "/picsell/main.do";
			resp.sendRedirect(url);

		}
		if (uri.indexOf("main.do") != -1) {
			// ---------------------------------------------------
			HttpSession session = req.getSession();
			PicSellCustomInfo info = (PicSellCustomInfo) session.getAttribute("PicSellCustomInfo");
			// ---------------------------------------------------
			String pageNum = req.getParameter("pageNum");
			int currentPage = 1;

			if (pageNum != null)
				currentPage = Integer.parseInt(pageNum);

			int dataCount = main_dao.getDataCount();

			int numPerPage = 9;
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);

			if (currentPage > totalPage)
				currentPage = totalPage;

			int start = (currentPage - 1) * numPerPage + 1;
			int end = currentPage * numPerPage;

			List<PicSellDTO> lists = main_dao.getLists(start, end);

			String listUrl = cp + "/picsell/list.do";

			String deletePath = cp + "/picsell/delete.do";
			String imagePath = cp + "/pds/saveImageFile";
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);

			req.setAttribute("imagePath", imagePath);
			req.setAttribute("lists", lists);
			req.setAttribute("deletePath", deletePath);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("pageNum", currentPage);
			req.setAttribute("totalPage", totalPage);

			url = "/psPage/main.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("list.do") != -1) {

			// ---------------------------------------------------
			HttpSession session = req.getSession();
			PicSellCustomInfo info = (PicSellCustomInfo) session.getAttribute("PicSellCustomInfo");
			// ---------------------------------------------------

			String pageNum = req.getParameter("pageNum");

			int currentPage = 1;

			if (pageNum != null)
				currentPage = Integer.parseInt(pageNum);

			String imageTag = req.getParameter("imageTag");

			System.out.println("imageTag : " + imageTag);

			if (imageTag != null) {

				if (req.getMethod().equalsIgnoreCase("POST")) {

					imageTag = URLDecoder.decode(imageTag, "UTF-8");

				} else {

					imageTag = "";

				}

			}

			int dataCount = main_dao.getDataCount();

			int numPerPage = 9;
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);

			if (currentPage > totalPage)
				currentPage = totalPage;

			int start = (currentPage - 1) * numPerPage + 1;
			int end = currentPage * numPerPage;

			System.out.println("imageTag : " + imageTag);

			List<PicSellDTO> lists = main_dao.getReadImage(imageTag);

			String listUrl = "list.jsp";
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
			String imagePath = cp + "/pds/saveImageFile";

			req.setAttribute("lists", lists);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("imageTag", imageTag);
			req.setAttribute("imagePath", imagePath);

			url = "/psPage/list.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("up_upload.do") != -1) {

			url = "/psPage/up_upload.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("up_logincheck.do") != -1) {

			HttpSession session = req.getSession();

			PicSellCustomInfo info = (PicSellCustomInfo) session.getAttribute("PicSellCustomInfo");

			if (info == null) {

				url = "/picsell/login.do"; // ★전체 사진 목록 화면★
				forward(req, resp, url);

			}

			url = "picsell/up_upload.do";
			forward(req, resp, url);

		} else if (uri.indexOf("up_upload_ok.do") != -1) {

			t ="";
			
			// 파일 업로드
			String encType = "UTF-8";
			int maxSize = 10 * 1024 * 1024;

			MultipartRequest mr = new MultipartRequest(req, path, maxSize, encType, new DefaultFileRenamePolicy());

			System.out.println(mr.getFile("upload"));

			HttpSession session1 = req.getSession();

			PicSellCustomInfo info1 = (PicSellCustomInfo) session1.getAttribute("PicSellCustomInfo");


			if(info1 == null) {
				
				int max = up_dao.getMaxNum();
				up_dao.deleteData(max);
				
				url = "/picsell/login.do";   // ★전체 사진 목록 화면★
				forward(req, resp, url);
				
			}
			
			
			String uploaduserid = info1.getUserId();

			// 파일 정보 DB에 입력
			if (mr.getFile("upload") != null) {

				ImageUploadDTO dto = new ImageUploadDTO();

				dto.setUploadUserId(uploaduserid);
				dto.setImagePoint(Integer.parseInt(mr.getParameter("imagepoint")));
				dto.setImageTitle(mr.getParameter("imagetitle"));
				dto.setImageCode(up_dao.getMaxNum() + 1);
				dto.setFileName(mr.getFilesystemName("upload"));
				dto.setOriginalName(mr.getOriginalFileName("upload"));
				dto.setImageTag(mr.getParameter("imagetag"));
				dto.setCategory(mr.getParameter("category"));
				
				up_dao.insertData(dto);

			}

			String imagePath = cp + "/pds/saveImageFile"; // 이미지 경로를 넘겨줘야한다.

			req.setAttribute("imagePath", imagePath);

			url = cp + "/picsell/up_imagecheck.do"; // ★전체 사진 목록 화면★
			resp.sendRedirect(url);

		}else if(uri.indexOf("up_tag.do")!=-1) {
			
			
			String check = req.getParameter("check");
			String chtag = req.getParameter("chtag");
			
			System.out.println(check);
			System.out.println(chtag);
			
			if(check.equals("yes")) {
				
				t = "";
				
			}else if(check.equals("no")) {
				
				t += chtag + ",";
				
			}
		
			//imageTag = URLDecoder.decode(imageTag, "UTF-8");
			
			req.setAttribute("t", t);
			
			url = "/picsell/up_upload.do?";
			forward(req, resp, url);

		} else if (uri.indexOf("up_imagecheck.do") != -1) {

			int max = up_dao.getMaxNum();

			String imagecheck = up_dao.getcheck(max); // 파일명 불러오기
			String imagePath = cp + "/pds/saveImageFile"; // 이미지 경로를 넘겨줘야한다.

			req.setAttribute("imagePath", imagePath);
			req.setAttribute("imagecheck", imagecheck);

			url = "/psPage/up_imagecheck.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("up_dbdelete.do") != -1) {

			int max = up_dao.getMaxNum();
			up_dao.deleteData(max);

			url = cp + "/picsell/up_upload.do";
			resp.sendRedirect(url);

		} else if (uri.indexOf("up_myupload.do") != -1) { // ★전체 사진 목록 화면★

			MyUtil myutil = new MyUtil();

			String pageNum = req.getParameter("pageNum");

			HttpSession session = req.getSession();

			PicSellCustomInfo info = (PicSellCustomInfo) session.getAttribute("PicSellCustomInfo");
			
			if(info == null) {
				
				url = "/picsell/login.do";   // ★전체 사진 목록 화면★
				forward(req, resp, url);
				
			}

			String uploaduserid = info.getUserId();

			int currentPage = 1; // 처음 실행하는 페이지

			if (pageNum != null)
				currentPage = Integer.parseInt(pageNum);

			// 전체 데이터 구하기
			int dataCount = up_dao.getDataCount();

			// 총 페이지 수 구하기
			int numPerPage = 9;
			int totalPage = myutil.getPageCount(numPerPage, dataCount);

			if (currentPage > totalPage)
				currentPage = totalPage;

			int start = (currentPage - 1) * numPerPage + 1;
			int end = currentPage * numPerPage;

			List<ImageUploadDTO> listss = up_dao.getReadData(uploaduserid);

			String listUrl = cp + "/picsell/up_myupload.do";

			String pageIndexList = myutil.pageIndexList(currentPage, totalPage, listUrl);

			String imagePath = cp + "/pds/saveImageFile"; // 이미지 경로를 넘겨줘야한다.
			String deletePath = cp + "/picsell/up_delete.do";

			req.setAttribute("imagePath", imagePath);
			req.setAttribute("listss", listss);
			req.setAttribute("deletePath", deletePath);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("currentPage", currentPage);

			url = "/psPage/up_myuploadlist.jsp";
			forward(req, resp, url);

		}else if(uri.indexOf("up_idupload.do")!=-1) { // ★전체 사진 목록 화면★
		
			
			MyUtil myutil = new MyUtil();
			
			String pageNum = req.getParameter("pageNum");
			
			String userid = req.getParameter("uploadUserId");

			int currentPage = 1; //처음 실행하는 페이지
			
			if(pageNum != null)
				currentPage = Integer.parseInt(pageNum);
			
			//전체 데이터 구하기
			int dataCount = up_dao.getDataCount();
			
			//총 페이지 수 구하기
			int numPerPage = 9;
			int totalPage = myutil.getPageCount(numPerPage, dataCount);
			
			if(currentPage>totalPage)
				currentPage = totalPage;  
			
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			
			List<ImageUploadDTO> listss = up_dao.getReadData(userid);
			
			String listUrl = cp +"/picsell/up_myupload.do";
			
			String pageIndexList = myutil.pageIndexList(currentPage, totalPage, listUrl);	
			
			String imagePath = cp +"/pds/saveImageFile"; // 이미지 경로를 넘겨줘야한다.
			String deletePath = cp + "/picsell/up_delete.do";
			
			req.setAttribute("imagePath", imagePath);
			req.setAttribute("listss", listss);
			req.setAttribute("deletePath", deletePath);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("pageIndexList",pageIndexList );
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("currentPage", currentPage);
			
			url = "/psPage/up_myuploadlist.jsp";
			forward(req, resp, url);
			
		} else if (uri.indexOf("up_delete.do") != -1) {

			// 삭제 버튼 클릭시 DB와 폴더에서 삭제

			int imageCode = Integer.parseInt(req.getParameter("imageCode"));

			String fn = up_dao.getDeleteData(imageCode);

			// 1.파일삭제
			// file download와 delete는 별도의 클래스로 만들어놓음(모듈화)
			// 모듈화 한것들을 모아둠 - 프레임워크 - 체계적으로 하게되면 전자정보 프레임워크
			FileManager.doFileDelete(fn, path);

			// 2.DB삭제
			up_dao.deleteData(imageCode);

			url = cp + "/picsell/up_myupload.do";
			resp.sendRedirect(url);

		} else if (uri.indexOf("down_imageClick.do") != -1) {
			int imageCode=Integer.parseInt(req.getParameter("imageCode"));
			//-------------------------------
			GuestDAO gDao = new GuestDAO(DBCPConn.getConnection());
			String content = req.getParameter("content");
			
			int currentPage = 1; // 처음 실행하는 페이지
			String pageNum = req.getParameter("pageNum");

			if (pageNum != null)
				currentPage = Integer.parseInt(pageNum);
			
			int dataCount = gDao.getDataCount();
			
			int numPerPage = 7;
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);

			if (currentPage > totalPage)
				currentPage = totalPage;

			int start = (currentPage - 1) * numPerPage + 1;
			int end = currentPage * numPerPage;	
			
			List<GuestDTO> guest_list = gDao.getList(start, end,imageCode);
			List<PicsellImageDTO> famous_list = psImagedao.famousList();
			//------------------------------------------------
			String downloadPath = cp + "/picsell/down_logincheck.do";
			String imagePath = cp + "/pds/saveImageFile";
			PicSellCustomInfo info = null;

			HttpSession session = req.getSession();

			if (session.getAttribute("PicSellCustomInfo") != null)
				info = (PicSellCustomInfo) session.getAttribute("PicSellCustomInfo");

			// 리스트에서 imageCode를 들고옴
			//int imageCode = Integer.parseInt(req.getParameter("imageCode"));
			PicsellImageDTO dto = psImagedao.selectImage(imageCode);
			int result = psImagedao.updateHitCount(imageCode);

			// int sum=psImagedao.getData(info.getUserId());
			List<String> tag = psImagedao.getTag(imageCode);

			req.setAttribute("downloadPath", downloadPath);
			req.setAttribute("imagePath", imagePath);
			req.setAttribute("dto", dto);
			req.setAttribute("info", info);
			// req.setAttribute("sum",sum);
			req.setAttribute("tag", tag);
			req.setAttribute("result", result);
			req.setAttribute("imageCode", imageCode);
			req.setAttribute("guest_list", guest_list);
			req.setAttribute("famous_list", famous_list);

			url = "/psPage/down_imageClick.jsp?imageCode=" + imageCode;
			forward(req, resp, url);

		} else if (uri.indexOf("down_logincheck.do") != -1) {

			// 다운로드 눌렀을 때 로그인이 안되있을 경우
			int imagePoint = Integer.parseInt(req.getParameter("imagePoint"));
			String uploadUserID = req.getParameter("uploadUserID");
			int imageCode = Integer.parseInt(req.getParameter("imageCode"));

			HttpSession session = req.getSession();

			if (session.getAttribute("PicSellCustomInfo") == null) {
				url = "picsell/join_login.do";
				resp.sendRedirect(url);
				return;
			}

			PicSellCustomInfo info = (PicSellCustomInfo) session.getAttribute("PicSellCustomInfo");

			// 로그인 되있을 경우 바로 다운로드
			// 이미지 유료

			req.setAttribute("uploadUserID", uploadUserID);
			req.setAttribute("imagePoint", imagePoint);
			req.setAttribute("imageCode", imageCode);

			url = "picsell/payment.do";
			forward(req, resp, url);

		} else if (uri.indexOf("down_download.do") != -1) {

			/*
			 * List<Integer> imageCodeList = new ArrayList<Integer>();
			 * 
			 * HttpSession session = req.getSession(); PicSellCustomInfo info =
			 * (PicSellCustomInfo) session.getAttribute("PicSellCustomInfo");
			 * 
			 * imageCodeList = psImagedao.getImageCodeList(info.getUserId());
			 * 
			 * if (imageCodeList.size() == 0) {
			 * 
			 * int imageCode = Integer.parseInt(req.getParameter("imageCode"));
			 * 
			 * System.out.println(imageCode);
			 * 
			 * PicsellImageDTO dto = psImagedao.selectImage(imageCode);
			 * 
			 * // 이미지 무료 boolean flag = FileManager.doFileDownload(resp, dto.getFileName(),
			 * dto.getOriginalName(), path);
			 * 
			 * System.out.println("sdff"); System.out.println(flag); if (!flag) {
			 * 
			 * resp.setContentType("text/html;charset=utf-8");
			 * 
			 * PrintWriter out = resp.getWriter();
			 * 
			 * out.print("<script type='text/javascript'>");
			 * out.print("alert('Download Error');"); out.print("history back();");
			 * out.print("</script>");
			 * 
			 * }
			 * 
			 * req.setAttribute("imageCode", imageCode);
			 * 
			 * url = "picsell/down_imageClick.do?imageCode=" + imageCode; forward(req, resp,
			 * url);
			 * 
			 * } else {
			 * 
			 * for (int i = 0; i < imageCodeList.size(); i++) {
			 * 
			 * int imageCode = imageCodeList.get(i);
			 * 
			 * System.out.println(imageCode);
			 * 
			 * PicsellImageDTO dto = psImagedao.selectImage(imageCode);
			 * 
			 * // 이미지 무료 boolean flag = FileManager.doFileDownload(resp, dto.getFileName(),
			 * dto.getOriginalName(), path);
			 * 
			 * if (!flag) {
			 * 
			 * resp.setContentType("text/html;charset=utf-8");
			 * 
			 * PrintWriter out = resp.getWriter();
			 * 
			 * out.print("<script type='text/javascript'>");
			 * out.print("alert('Download Error');"); out.print("history back();");
			 * out.print("</script>");
			 * 
			 * }
			 * 
			 * }
			 * 
			 * url = "picsell/main.do"; forward(req, resp, url);
			 * 
			 * }
			 */

			int imageCode = Integer.parseInt(req.getParameter("imageCode"));

			PicsellImageDTO dto = psImagedao.selectImage(imageCode);

			if (dto.getImagePoint() == 0) {

				// 이미지 무료
				boolean flag = FileManager.doFileDownload(resp, dto.getFileName(), dto.getOriginalName(), path);

				if (!flag) {

					resp.setContentType("text/html;charset=utf-8");

					PrintWriter out = resp.getWriter();

					out.print("<script type='text/javascript'>");
					out.print("alert('Download Error');");
					out.print("history back();");
					out.print("</script>");

				}

				req.setAttribute("imageCode", imageCode);
				url = "picsell/down_imageClick.do";
				forward(req, resp, url);

			} else {

				/*
				 * req.setAttribute("imagePoint", dto.getImagePoint());
				 * req.setAttribute("uploadUserID", dto.getUploadUserID());
				 */
				req.setAttribute("imageCode", dto.getImageCode());

				url = "picsell/down_logincheck.do?imagePoint=" + dto.getImagePoint() + "&uploadUserID="
						+ dto.getUploadUserID();
				forward(req, resp, url);
			}

		} else if (uri.indexOf("down_basket.do") != -1) {
			// 장바구니로 가기
			url = "/picsell/down_basket_ok.do";
			forward(req, resp, url);

		} else if (uri.indexOf("down_basket_ok.do") != -1) {

			String downloadPath = cp + "/picsell/down_download.do";
			String imagePath = cp + "/pds/saveImageFile";

			HttpSession session = req.getSession();

			if (session.getAttribute("PicSellCustomInfo") == null) {

				url = cp + "/picsell/login.do";
				resp.sendRedirect(url);
				return;

			}

			PicSellCustomInfo info = (PicSellCustomInfo) session.getAttribute("PicSellCustomInfo");

			String userId = info.getUserId();

			List<PicBasketDTO> Basket_list = psImagedao.getLists(userId); // 장바구니에 있는 모든 리스트가져옴
			int sumPoint = psImagedao.getSumPoint(userId); // 장바구니의 이미지 포인트 합

			// basket 페이지에 가져갈 것들
			req.setAttribute("Basket_list", Basket_list); // 리스트 출력하기 위함
			req.setAttribute("imagePath", imagePath); // 이미지 경로
			req.setAttribute("downloadPath", downloadPath); // ...?
			req.setAttribute("sumPoint", sumPoint); // 합

			// 장바구니 창으로 고고
			url = "/psPage/down_basket.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("down_addcart.do") != -1) {
			// 장바구니에 저장만하고 기존 페이지 머무르기
			int imageCode = Integer.parseInt(req.getParameter("imageCode"));

			HttpSession session = req.getSession();

			if (session.getAttribute("PicSellCustomInfo") == null) {

				url = cp + "/picsell/login.do";
				resp.sendRedirect(url);
				return;

			}

			PicSellCustomInfo info = (PicSellCustomInfo) session.getAttribute("PicSellCustomInfo");

			String userId = info.getUserId();

			int result = 0;

			PicsellImageDTO dto = psImagedao.selectImage(imageCode);

			PicBasketDTO bdto = new PicBasketDTO();
			bdto.setNum(psImagedao.getMaxNum(userId) + 1);
			bdto.setImageCode(dto.getImageCode());
			bdto.setImagePoint(dto.getImagePoint());
			bdto.setUploadUser(dto.getUploadUserID());
			bdto.setFileName(dto.getFileName());
			bdto.setDownloadUser(userId);

			result = psImagedao.insertData(bdto);

			if (result == 1) {
				// 결제잘됨
				System.out.println("저장했고, 계속 같은 페이지에 있을거임");
				url = "/picsell/down_imageClick.do?imageCode=" + imageCode;
				forward(req, resp, url);
			} else {
				// 결제안됨
				System.out.println("addcart.do Error//저장안됨");
				url = "/picsell/down_imageClick.do?imageCode=" + imageCode;
				forward(req, resp, url);
			}

		} else if (uri.indexOf("down_delete.do") != -1) {
			// 삭제하기
			int imageCode = Integer.parseInt(req.getParameter("imageCode"));

			int result = psImagedao.deleteData(imageCode);

			if (result == 1) {
				System.out.println("삭제 잘되었음");
				url = "/picsell/down_basket.do";
				forward(req, resp, url);
			} else {
				System.out.println("삭제안되었음");
				url = "/picsell/down_basket.do";
				forward(req, resp, url);
			}

		} else if (uri.indexOf("join_mypage.do") != -1) {

			HttpSession session = req.getSession();

			if (session.getAttribute("PicSellCustomInfo") == null) {

				url = cp + "/psPage/login.jsp";
				resp.sendRedirect(url);
				return;
			}

			PicSellCustomInfo info = (PicSellCustomInfo) session.getAttribute("PicSellCustomInfo");

			PicsellUserDTO join_dto = join_dao.getReadData(info.getUserId());

			req.setAttribute("join_dto", join_dto);

			url = "/psPage/mypage.jsp";

			forward(req, resp, url);
		} else if (uri.indexOf("join_updated.do") != -1) {

			HttpSession session = req.getSession();

			PicSellCustomInfo info = (PicSellCustomInfo) session.getAttribute("PicSellCustomInfo");

			PicsellUserDTO join_dto = join_dao.getReadData(info.getUserId());

			req.setAttribute("join_dto", join_dto);

			url = "/psPage/join_updated.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("join_updatedok.do") != -1) {
			String userId = req.getParameter("userId");

			PicsellUserDTO join_dto = new PicsellUserDTO();

			join_dto.setUserId(req.getParameter("userId"));
			join_dto.setUserName(req.getParameter("userName"));
			join_dto.setUserPwd(req.getParameter("userPwd"));
			join_dto.setUserEmail(req.getParameter("userEmail"));
			join_dto.setUserTel(Integer.parseInt(req.getParameter("userTel")));

			join_dao.updateData(join_dto);

			url = cp + "/picsell/join_mypage.do";
			resp.sendRedirect(url);
			
		}else if (uri.indexOf("list_video.do") != -1) {
			
			HttpSession session = req.getSession();
			PicSellCustomInfo info=(PicSellCustomInfo) session.getAttribute("PicSellCustomInfo");
			
			String pageNum = req.getParameter("pageNum");

			int currentPage = 1;

			if (pageNum != null)
				currentPage = Integer.parseInt(pageNum);

			String category = req.getParameter("category");

			if (category != null) {

				if (req.getMethod().equalsIgnoreCase("POST")) {

					category = URLDecoder.decode(category, "UTF-8");

				} else {

					category = "";

				}

			}
			
			if(category == null) {
				
				category = "";
				
			}
			
			int dataCount = main_dao.getDataCount();

			int numPerPage = 39;
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);

			if (currentPage > totalPage)
				currentPage = totalPage;

			int start = (currentPage - 1) * numPerPage + 1;
			int end = currentPage * numPerPage;
			
			List<PicSellDTO> lists = main_dao.getReadVideo(category);
			
			System.out.println(lists.size());

			String listUrl = "list.jsp";
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
			String imagePath = cp + "/pds/saveImageFile";

			req.setAttribute("lists", lists);
		
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("Category", category);
			req.setAttribute("imagePath", imagePath);

			url = "/psPage/main.jsp";
			forward(req, resp, url);
			
		}else if (uri.indexOf("list_illust.do") != -1) {
			
			HttpSession session = req.getSession();
			PicSellCustomInfo info=(PicSellCustomInfo) session.getAttribute("PicSellCustomInfo");
			
			String pageNum = req.getParameter("pageNum");

			int currentPage = 1;

			if (pageNum != null)
				currentPage = Integer.parseInt(pageNum);

			String category = req.getParameter("category");
			
			if (category != null) {

				if (req.getMethod().equalsIgnoreCase("POST")) {

					category = URLDecoder.decode(category, "UTF-8");

				} else {

					category = "";

				}

			}
			
			if(category == null) {
				
				category = "";
				
			}
			
			
			int dataCount = main_dao.getDataCount();

			int numPerPage = 39;
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);

			if (currentPage > totalPage)
				currentPage = totalPage;

			int start = (currentPage - 1) * numPerPage + 1;
			int end = currentPage * numPerPage;
			
			List<PicSellDTO> lists = main_dao.getReadIllust(category);
			
			System.out.println(lists.size());

			String listUrl = "list.jsp";
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
			String imagePath = cp + "/pds/saveImageFile";

			req.setAttribute("lists", lists);
		
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("Category", category);
			req.setAttribute("imagePath", imagePath);

			url = "/psPage/main.jsp";
			forward(req, resp, url);
			
		}else if (uri.indexOf("list_movie.do") != -1) {
			
			//---------------------------------------------------------------
			HttpSession session = req.getSession();
			PicSellCustomInfo info=(PicSellCustomInfo) session.getAttribute("PicSellCustomInfo");
			//---------------------------------------------------------------
			
			String pageNum = req.getParameter("pageNum");

			int currentPage = 1;

			if (pageNum != null)
				currentPage = Integer.parseInt(pageNum);

			String category = req.getParameter("category");

			if (category != null) {

				if (req.getMethod().equalsIgnoreCase("POST")) {

					category = URLDecoder.decode(category, "UTF-8");

				} else {

					category = "";

				}

			}
			
			if(category == null) {
				
				category = "";
				
			}
			
			int dataCount = main_dao.getDataCount();

			int numPerPage = 39;
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);

			if (currentPage > totalPage)
				currentPage = totalPage;

			int start = (currentPage - 1) * numPerPage + 1;
			int end = currentPage * numPerPage;
			
			List<PicSellDTO> lists = main_dao.getReadMovie(category);
			
			System.out.println(lists.size());

			String listUrl = "list.jsp";
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
			String imagePath = cp + "/pds/saveImageFile";

			req.setAttribute("lists", lists);
		
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("Category", category);
			req.setAttribute("imagePath", imagePath);

			url = "/psPage/main.jsp";
			forward(req, resp, url);
		
		}else if (uri.indexOf("down_guest.do") != -1) {
			
			HttpSession session = req.getSession();
			PicSellCustomInfo info = (PicSellCustomInfo) session.getAttribute("PicSellCustomInfo");
			
			if(info==null) {
				//url="picsell/login.do";
				url="/psPage/login.jsp";
				forward(req, resp, url);
			}

			//-----------------------------
			String pageNum = req.getParameter("pageNum");
			int imageCode = Integer.parseInt(req.getParameter("imageCode"));

			int currentPage = 1; // 처음 실행하는 페이지

			if (pageNum != null)
				currentPage = Integer.parseInt(pageNum);

			GuestDAO gDao = new GuestDAO(conn);

			int dataCount = gDao.getDataCount();
	
			GuestDTO gDto = new GuestDTO();
			
			gDto.setNum(gDao.getMaxNum()+1);
			gDto.setPsUserId(info.getUserId());
			gDto.setContent(req.getParameter("content"));
			gDto.setImageCode(imageCode);
				
			gDao.insertData(gDto);	

			int numPerPage = 7;
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);

			if (currentPage > totalPage)
				currentPage = totalPage;

			int start = (currentPage - 1) * numPerPage + 1;
			int end = currentPage * numPerPage;

			List<GuestDTO> guest_list = gDao.getList(start, end,imageCode);
			
			System.out.println(guest_list.get(0));

			String listUrl = cp + "/psPage/down_imageClick.jsp?imageCode="+imageCode;
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);

			// ------------------------------list.jsp에서 복사해옴-----------------
			
			
			String downloadPath = cp + "/picsell/down_logincheck.do";
			String imagePath = cp + "/pds/saveImageFile";

			PicsellImageDTO dto = psImagedao.selectImage(imageCode);
			int result = psImagedao.updateHitCount(imageCode);

			int sum = psImagedao.getData(info.getUserId()); //장바구니에 몇 개 있는지
			List<String> tag = psImagedao.getTag(imageCode); //tag

			req.setAttribute("downloadPath", downloadPath);
			req.setAttribute("imagePath", imagePath);
			req.setAttribute("dto", dto);
			req.setAttribute("info", info);
			req.setAttribute("sum", sum);
			req.setAttribute("tag", tag);
			req.setAttribute("result", result);
			req.setAttribute("imageCode", imageCode);


			req.setAttribute("guest_list", guest_list);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);

			url = "/psPage/down_imageClick.jsp?imageCode=" + imageCode;
			//url="picsell/down_imageClick.do";
			forward(req, resp, url);
			
		}
	}
}
