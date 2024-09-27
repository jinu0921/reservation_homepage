<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<style>
body {
	margin: 0px;
}

.headerContainer1 {
	top: 0; /* 페이지의 맨 위에 위치 */
	position: fixed;
	width: 100%;
	height: 80px;
	border-bottom: 1px #aaa solid;
	z-index: 1000;
	background-color: white;
}

.headerContainer2 {
	width: 1100px;
	margin: auto;
	margin-top: 10px;
	height: 60px;
	margin-bottom: 10px;
}

.headerLogo {
	display: inline-block;
	text-decoration: none;
	background-color: #bbb;
	height: 60px;
	width: 150px;
	vertical-align: top; /* 또는 middle */
	margin-bottom: 10px;
}

.headerBar {
	width: 100px;
	height: 60px;
	display: inline-block;
	display: grid;
	place-items: center; /* 수평과 수직 모두 중앙 정렬 */
	font-weight: bold;
	color: black;
	text-decoration: none;
}

.headerBar:hover {
	color: gray;
	cursor: pointer;
}

.memberBar {
	display: inline-block;
	width: 160px;
	height: 60px;
}

.menuBar1 {
	margin-left: 50px;
	margin-right: 155px;
	width: 550px;
	height: 60px;
	display: inline-block;
}

.menuBar2 {
	display: grid;
	grid-template-columns: repeat(5, 100px);
	gap: 10px;
}

.memberBtn1, .memberBtn2 {
	display: inline-block;
	width: 67px;
	height: 30px;
	color: #ccb389;
	text-decoration: none;
	border: 2px #ccb389 solid;
	border-radius: 20px;
	text-align: center;
	line-height: 30px;
	font-size: 13px;
	font-weight: bold;
}

.memberBtn1 {
	margin-right: 10px;
}
</style>
<header>
	<div class="headerContainer1">
		<div class="headerContainer2">
			<a href="${path}"><img class="headerLogo" src="https://via.placeholder.com/500x300?text=Image1" /></a>
			<div class="menuBar1">
				<div class="menuBar2">
					<a href="${path}/" class="headerBar">ABOUT</a> 
					<a class="headerBar">연습실 대여</a> 
					<a class="headerBar">강습신청</a> 
					<a href="${path}/review/review_list" class="headerBar">리뷰</a> 
					<a href="${path}/comehere/direction" class="headerBar">위치</a>
				</div>
			</div>
			<div class="memberBar">
				<c:choose>
					<c:when test="${!empty member}">
						<a href="${path}/loginJoin/logOut"> 로그아웃<img alt="" src="">
						</a>
					</c:when>
					<c:otherwise>
						<a href="${path}/loginJoin/login" class="memberBtn1">로그인</a>
						<a href="${path}/loginJoin/join" class="memberBtn2">회원가입</a>
					</c:otherwise>
				</c:choose>

			</div>
		</div>
	</div>
</header>