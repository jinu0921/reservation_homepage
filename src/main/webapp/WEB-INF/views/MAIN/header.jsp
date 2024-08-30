<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
.solid {
	border: 1px solid black;
}

.flex {
	display: flex;
	justify-content: space-around;
}

.headerBar {
	height: 100px;
	width: 200px;
}
</style>

<body></body>
<header>
	<h1>나는 헤더</h1>
	
	<c:choose>
		<c:when test="${!empty member}">
			<h1>${member}</h1>
		</c:when>
		<c:otherwise>
			<a href="${path}/loginJoin/login">로그인</a>
			<a href="${path}/loginJoin/join">회원가입</a>
		</c:otherwise>
	</c:choose>
	
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