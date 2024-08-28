<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	let msg = "${msg}";
	if(msg != "") alert(msg);
</script>
</head>
<style>

	.x>div {
		border: 1px solid black;
		width: 200px;
		height: 200px;
	}
	.x{
		width: 700px;
		height: 300px;
		display: flex;
		justify-content: space-around;
	}
</style>
<%@ include file="../MAIN/header.jsp"%>
<h1>예약 확인</h1>

	<div class="x">
		<div> 1번 예약</div>
		<div> 2번 예약</div>
		<div> 3번 예약</div>
	</div>
	
	<a href="${path}/project">메인으로</a>
		
<%@ include file="/WEB-INF/views/MAIN/footer.jsp"%>