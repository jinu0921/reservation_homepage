<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MAIN/header.jsp"%>
<style>
	.inputBody{
		display: flex;
		// border: 1px solid blue;
		box-sizing: border-box;
		width: 300px;
		overflow : hidden;
	}
	
	.inputBox{
		min-width : 280px;
		max-width : 280px;
		margin: 0 10px; 
		border: 1px solid black;
		box-sizing: border-box;
		padding: 2px;
	}
	#moveBox{
		display: flex;
	}
	.move{
	 	-webkit-transform:  translateX(-300px);
  		-webkit-transition-timing-function: linear;
  		-webkit-transition-duration: 1s;  
	}
	
}
</style>
<body>
<a href=""></a>


<div class="inputBody">
	<div id="moveBox">
		<div class="inputBox">
			<h1>이름 입력하기</h1>
			이름 입력하기 : <input type="text" name="name">
			<button onclick="move(0)">확인</button>
		</div>
		
		<div class="inputBox">
			<h1>나이 입력하기</h1>
			나이 입력하기 : <input type="text" name="name">
			<button onclick="move(1)">확인</button>
		</div>
		
		<div class="inputBox">
			<h1>내 수준 입력하기</h1>
			내 수준 입력하기 : <input type="text" name="name">
			<button onclick="move(2)">확인</button>
		</div>
		
		<div class="inputBox">
			<h1>전화번호 입력하기</h1>
			전화번호 입력하기 : <input type="text" name="name">
			<input type="submit">
		</div>
	</div>
</div>
<script type="text/javascript">

function move(i) {
	console.log(i);
	let moveBox = document.getElementById("moveBox");
	moveBox.style.transition = 'transform 0.5s ease';
	moveBox.style.transform = 'translateX('+ (-300*(i+1))+'px)';
	}
</script>


</body>

<%@ include file="/WEB-INF/views/MAIN/footer.jsp"%>