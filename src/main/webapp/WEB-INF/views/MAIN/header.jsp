<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
	.solid{
		border: 1px solid black;
	}
	
	.flex{
		display: flex;
		justify-content: space-around;
	}
	
	.headerBar{
		height: 100px;
		width: 200px;
	}
</style>	

<body>
	<header>
		<h1>나는 헤더</h1>
		<a href="${path}/project">메인으로</a>
		<div class="flex">
			<div class="headerBar solid"></div>
			<div style="display: flex;">
				<div class="headerBar solid"></div>
				<div class="headerBar solid"></div>
				<div class="headerBar solid"></div>
			</div>
			<div class="headerBar solid"></div>
		</div>
	</header>
	<hr>