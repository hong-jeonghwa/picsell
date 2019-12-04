<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");

	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
#my_modal {
	display: none;
	width: 300px;
	padding: 20px 60px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
}

#my_modal .modal_close_btn {
	/* position: absolute; */
	top: 10px;
	right: 10px;
}

.button {
	width: 140px;
	height: 45px;
	font-family: 'Roboto', sans-serif;
	font-size: 11px;
	text-transform: uppercase;
	letter-spacing: 2.5px;
	font-weight: 500;
	color: #000;
	background-color: #fff;
	border: none;
	border-radius: 45px;
	box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease 0s;
	cursor: pointer;
	outline: none;
}

.button:hover {
	background-color: #2EE59D;
	box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
	color: #fff;
	transform: translateY(-7px);
}
</style>

<script type="text/javascript">

	function charge() {
		
		document.myForm.action = "<%=cp%>/picsell/charge_ok.do";
		document.myForm.submit();

	}
</script>

</head>
<body>

	<div id="my_modal" align="center">
		<form action="" name="myForm" method="post">
			<div>
				결제금액 : <b id="chargeMoney" align="center">ㅎㅇㅎㅇㅎㅇ</b>
			</div>
			<hr>

			<div style="height: 100px"></div>
			<div>
				<input type="button" value="충전하기" onclick="charge();"/>
				<input type="button" value="취소하기" class="modal_close_btn" />
				<input type="hidden" value="5000" id="hdChagePoint" name="hdcp"/>
			</div>
		</form>
	</div>

	<div>
		<c:forEach var="dto" items="${lists }">

			<div>
				<dd>${dto.chargePoint }
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button id="popup_open_btn_${dto.chargeCode }" class="button"
						onclick="modal('my_modal','${dto.realMoney}');">구매하기</button>
				</dd>
			</div>
			<br />
			<br />
		</c:forEach>
	</div>

	<script>
		function modal(id, chargeM) {
			var zIndex = 9999;
			var modal = document.getElementById(id);

			document.getElementById('hdChagePoint').value = chargeM;
			document.getElementById('chargeMoney').innerHTML = chargeM;

			// 모달 div 뒤에 희끄무레한 레이어
			var bg = document.createElement('div');
			bg.setStyle({
				position : 'fixed',
				zIndex : zIndex,
				left : '0px',
				top : '0px',
				width : '100%',
				height : '100%',
				overflow : 'auto',
				// 레이어 색갈은 여기서 바꾸면 됨
				backgroundColor : 'rgba(0,0,0,0.4)'
			});
			document.body.append(bg);

			// 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
			modal.querySelector('.modal_close_btn').addEventListener('click',
					function() {
						bg.remove();
						modal.style.display = 'none';
					});

			modal
					.setStyle({
						position : 'fixed',
						display : 'block',
						boxShadow : '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

						// 시꺼먼 레이어 보다 한칸 위에 보이기
						zIndex : zIndex + 1,

						// div center 정렬
						top : '50%',
						left : '50%',
						transform : 'translate(-50%, -50%)',
						msTransform : 'translate(-50%, -50%)',
						webkitTransform : 'translate(-50%, -50%)'
					});
		}

		// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
		Element.prototype.setStyle = function(styles) {
			for ( var k in styles)
				this.style[k] = styles[k];
			return this;
		};
	</script>
</body>
</html>