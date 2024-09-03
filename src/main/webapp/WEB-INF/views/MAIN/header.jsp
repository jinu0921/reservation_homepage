<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>센텀 베토벤 피아노</title>
</head>
<style>
body {
/* 	background-image: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.8)), */
/* 		/* 어두운 오버레이 */ */
/*         url('/project/resources/piano.jpg'); */
	background-color: #fff;
	background-size: cover; /* 이미지가 화면을 덮도록 설정 */
	background-repeat: no-repeat; /* 이미지 반복을 방지 */
	background-position: center; /* 이미지 위치를 중앙으로 설정 */
	background-attachment: fixed; /* 배경 이미지 고정 */
}

header {
	width: 96%;
	margin: auto;
}

.solid {
	border: 1px solid white;
	border-radius: 5px;
	font-weight: bold;
	background-color: rgba(0, 0, 0, 0.3);
}

header .flex {
	display: flex;
	justify-content: space-between;
}

header .headerBar {
	min-width: 150px;
	height: 30px;
	margin: 0 10px;
	color: white;
	font-size: 20px;
	text-align: center;
}

header .mainLogo {
	min-width: 200px;
	height: 30px;
	margin: 0 20px;
	color: white;
	font-size: 20px;
	text-align: center;
}

.menuBar {
	overflow: hidden;
	display: flex; 
	min-width : 860px;
	height: 32px;
	min-width: 860px;
}

.menuBar:hover {
	cursor: pointer;
}

.hiddenMenuBar {
	margin: 20px 0;
	position: relative;
	display: flex;
}

.hiddenMenu {
	width: 150px;
	margin: 10px;
}

header ul {
	margin: 10px auto;
	text-align: center;
	padding: 0;
}

header li {
	list-style: none;
	margin: 10px auto;
	color: white;
}

.hiddenMenuBar {
	width: 860px;
	border: none;
	height: 0px;
	overflow: hidden;
	position: absolute;
	transition: all 0.2s linear;
}

.menuBar:hover .hiddenMenuBar {
	border-radius:10px;
	height: 120px;
	margin-top: 50px;
	background-color: rgba(50, 50, 50, 0.5);
}

.menuBar:hover .hiddenMenuBar.cursor{
	margin: 0;
	height: 70px;
	background-color: rgba(0, 0, 0, 0);
}
header ul hr{
	width: 90%;
	margin: 15px auto;
}


</style>	
	<header>
		<div class="flex">
			<div class="mainLogo solid">
				<a href="${path}">메인으로</a>
			</div>
		<div class="menuBar">

			<div class="headerBar solid">ABOUT</div>
			<div class="headerBar solid">연습실</div>
			<div class="headerBar solid">문의</div>
			<div class="headerBar solid">커뮤니티</div>
			<div class="headerBar solid">오시는 길</div>

			<div class="hiddenMenuBar cursor"></div>
			<div class="hiddenMenuBar solid">
				<div class="hiddenMenu solid">
					<ul>
						<li>학원 소개
							<hr>
						</li>
						<li>교수진 소개</li>
					</ul>
				</div>
				<div class="hiddenMenu solid">
					<ul>
						<li>예약 하기
							<hr>
						</li>
						<li>구경 하기</li>
					</ul>
				</div>
				<div class="hiddenMenu solid">
					<ul>
						<li>레슨 문의
							<hr>
						</li>
						<li>학원 문의</li>
					</ul>
				</div>
				<div class="hiddenMenu solid">
					<ul>
						<li>새로운 소식
							<hr>
						</li>
						<li><a href="${path}/review/review_list">고객 리뷰</a></li>
					</ul>
				</div>
				<div class="hiddenMenu solid">
					<ul>
						<li>길 찾기
							<hr>
						</li>
						<li>지도 보기</li>
					</ul>
				</div>

			</div>
		</div>
		<div class="mainLogo solid">
			<c:choose>
				<c:when test="${!empty member}">
					<h1>${member}</h1>
					<a href="${path}/loginJoin/logOut">로그아웃</a>
				</c:when>
				<c:otherwise>
					<a href="${path}/loginJoin/login">로그인</a>
					<a href="${path}/loginJoin/join">회원가입</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
		 
		<hr>
		<!-- 메뉴바와 같이 크기가 줄어들도록 --><!-- 메뉴바와 같이 크기가 줄어들도록 -->
		<!-- 메뉴바와 같이 크기가 줄어들도록 --><!-- 메뉴바와 같이 크기가 줄어들도록 -->
		<!-- 메뉴바와 같이 크기가 줄어들도록 --><!-- 메뉴바와 같이 크기가 줄어들도록 -->
		<!-- 메뉴바와 같이 크기가 줄어들도록 --><!-- 메뉴바와 같이 크기가 줄어들도록 -->
		
	</header>