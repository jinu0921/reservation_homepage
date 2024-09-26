<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Great+Vibes&display=swap"
	rel="stylesheet">
<style>
main {
	
}

.mainBody {
	margin: auto;
	width: 1100px;
	margin-top: 80px;
}

.mainImage {
	top: 80px;
	width: 100%; /* 원하는 크기로 조정 */
	height: 600px; /* 원하는 높이 */
	background-image: url('${path}/resources/piano.jpg');
	background-size: cover; /* 또는 contain */
	background-position: center; /* 이미지를 중앙에 위치 */
	position: absolute;
	z-index: -1; /* 텍스트나 다른 요소 아래에 위치하도록 */
}

.mentorBackground {
	display: flex; /* flexbox를 사용하여 자식 요소를 정렬 */
	justify-content: center; /* 수평 중앙 정렬 */
	align-items: center; /* 수직 중앙 정렬 */
	background-color: #fffaf0;
	width: 100%;
	height: 1280px;
	position: absolute;
	top: 1700px;
	z-index: -1;
}

.mentorBackgroundText {
	font-size: 300px;
	color: #fce8d8;
	font-family: "Great Vibes", cursive;
}

.mainImageContent {
	margin-top: 300px;
	margin-bottom: 350px;
}

.MIC1 {
	color: #aaa;
	text-align: center;
	font-size: 20px;
	font-weight: bold;
	font-family: 'Cafe24Gounbang', sans-serif;
}

.MIC2 {
	text-align: center;
	font-size: 50px;
	font-weight: bold;
	font-family: 'Brush Script MT', cursive;
}

.MIC3 {
	font-size: 20px;
	border: 2px black solid;
	color: black;
	font-weight: bold;
	text-align: center;
	width: 200px;
	height: 50px;
	margin: auto;
	line-height: 50px;
	margin-top: 90px;
	border-radius: 20px;
	background-color: rgba(255, 255, 255, 0.2);
}

.overlay {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(255, 255, 255, 0.2); /* 반투명 흰색 오버레이 */
	z-index: 1;
}

.InformationBar {
	display: grid;
	grid-template-columns: repeat(5, 200px);
	gap: 20px;
}

.mainSymbol {
	height: 100px;
	width: fit-content; /* 텍스트에 맞춰 너비 조정 */
	margin: auto; text-align : center; /* 텍스트 중앙 정렬 */
	font-weight: bold;
	font-size: 50px;
	margin-bottom: 50px;
	text-align: center;
}

.MI1 {
	color: #c7b199;
	font-size: 30px;
	font-weight: bold;
	margin-bottom: 10px;
}

.MI2 {
	font-size: 14px;
	color: #666;
}

.mentorContainer {
	width: 960px;
	margin: 0 auto;
}

.mentorContainer1, .mentorContainer2 {
	display: inline-block;
	width: 270px;
}

.mentorContainer1 {
	margin-left: 80px;
}

.mentorContainer2 {
	width: 350px;
	float: right;
}

.mentorsL, .mentorsR {
	height: 450px;
	margin-bottom: 150px;
	box-shadow: 15px 15px 20px rgba(0, 0, 0, 0.5); /* 기본 그림자 */
}

.mentorImage {
	width: 100%;
	height: 320px;
}

.mentorName {
	background-color: white;
	height: 50px;
	display: flex;
	justify-content: center;
	align-items: center;
	font-weight: bold;
	font-size: 25px;
}

.mentorFeatures {
	background-color: white;
	height: 80px;
	font-size: 13px;
	padding-left: 15px;
	color: #aaa;
}

.mentorIntro {
	width: 100%;
	height: 100px;
	color: #888;
	font-size: 13px;
	font-weight: bold;
}

.mentorContainer2 .mentorsR:nth-child(2) {
	margin-top: 200px;
}

.mentorsR {
	margin-right: 80px;
}

.mentorIntroSymbol {
	width: 436px;
	height: 100px;
	float: right;
	display: flex;
	justify-content: center;
	align-items: center;
	font-weight: bold;
	font-size: 50px;
}

.mentorIntroContainer {
	width: 1040px;
	height: 80px;
	margin: 0 auto;
	margin-top: 300px;
	margin-bottom: 30px;
}

.mapContainer {
	width: 900px;
	background-color: blue;
	height: 600px;
	margin: 0 auto;
}

.mapIntro {
	margin-top: 150px; width : 1100px;
	height: 200px;
	width: 1100px;
}

.mapIntro div:first-child {
	width: 100%;
	height: 100px;
	font-weight: bold;
	font-size: 50px;
	display: flex;
	align-content: center;
	justify-content: center;
}

.mapIntro div:nth-child(2) {
	width: 100%;
	height: 100px;
	font-size: 15px;
	color: #777; display : flex;
	align-content: center;
	justify-content: center;
	display: flex;
}

        .carousel {
            width: 500px;
            height: 300px;
            overflow: hidden;
            position: relative;
            margin: auto;
        }

        .carousel img {
            width: 100%;
            height: 100%;
            display: none;
        }

        .carousel img.active {
            display: block;
        }

    .carousel-button {
		width: 100px;
		height: 100px;
		background-color: blue;
        }
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/MAIN/header.jsp"%>

	<main>
		<div class="mainImage">
			<div class="overlay"></div>
		</div>

		<div class="mentorBackground">
			<div class="mentorBackgroundText">mentors</div>
		</div>

		<div class="mainBody">
			<div class="mainImageContent">
				<div class="MIC1">"프리미엄 피아노 학원"</div>
				<div class="MIC2">CENTUM PIANO</div>
				<div class="MIC3">강습신청 →</div>
			</div>

			<div class="mainSymbol">"센텀피아노: 당신의 음악, 그 이상을 위해"</div>
			<div class="InformationBar">
				<div class="Maininformation">
					<div class="MI1">1:1 강습</div>
					<div class="MI2">개인의 실력에 따른 체계적인 맞춤형 수업 진행</div>
				</div>
				<div class="Maininformation">
					<div class="MI1">10억+</div>
					<div class="MI2">전 세계적으로 누적 10억 명이 넘는 회원</div>
				</div>
				<div class="Maininformation">
					<div class="MI1">100억+</div>
					<div class="MI2">100억회가 넘는 강습으로 경험이 보증된 센텀 피아노</div>
				</div>
				<div class="Maininformation">
					<div class="MI1">올림픽 우승</div>
					<div class="MI2">강사의 뛰어난 수상 경력, 보장된 실력</div>
				</div>
				<div class="Maininformation">
					<div class="MI1">4.9+</div>
					<div class="MI2">평균 4.9점이 넘는 높은 만족도</div>
				</div>
			</div>
			<div class="mentorIntroContainer">
				<div class="mentorIntroSymbol">뛰어난 명품 강사진</div>
			</div>
			<div class="mentorContainer">
				<div class="mentorContainer1">
					<div class="mentorsL">
						<img class="mentorImage" src="https://via.placeholder.com/500x300?text=Image1"></img>
						<div class="mentorName">이진우</div>
						<div class="mentorFeatures">
							올림픽 우승<br />발롱도르 우승<br />월드컵 우승
						</div>
					</div>
					<div class="mentorsL">
						<img class="mentorImage" src="https://via.placeholder.com/500x300?text=Image3"></img>
						<div class="mentorName">이진우2</div>
						<div class="mentorFeatures">
							올림픽 우승<br />발롱도르 우승<br />월드컵 우승
						</div>
					</div>
					<div class="mentorsL">
						<img class="mentorImage" src="https://via.placeholder.com/500x300?text=Image5"></img>
						<div class="mentorName">이진우3</div>
						<div class="mentorFeatures">
							올림픽 우승<br />발롱도르 우승<br />월드컵 우승
						</div>
					</div>
				</div>

				<div class="mentorContainer2">
					<div class="mentorIntro">총 발롱도르 20회 수상, 피아노 콩쿠르 200회 수상, 월드컵
						2000회 수상, 최연소 피아노 국가대표 이진우 선수 존재</div>
					<div class="mentorsR">
						<img class="mentorImage" src="https://via.placeholder.com/500x300?text=Image2"></img>
						<div class="mentorName">김동하</div>
						<div class="mentorFeatures">
							구구단 9단<br />태권도 9단
						</div>
					</div>
					<div class="mentorsR">
						<img class="mentorImage" src="https://via.placeholder.com/500x300?text=Image4"></img>
						<div class="mentorName">김지연</div>
						<div class="mentorFeatures">
							올림픽 우승<br />발롱도르 우승<br />월드컵 우승
						</div>
					</div>
				</div>
			</div>
			<div class="mapIntro">
				<div>센텀 피아노 지점 찾기</div>
				<div>언제 어디서나 센텀 피아노와 함께!</div>

			</div>
			<div class="mapContainer">
				<%@ include file="/WEB-INF/views/comehere/direction_map.jsp"%>
			</div>
			<div class="reviewContainer">
				<div class="carousel">
					<img src="https://via.placeholder.com/500x300?text=Image1"
						class="active"> <img
						src="https://via.placeholder.com/500x300?text=Image2"> <img
						src="https://via.placeholder.com/500x300?text=Image3"> <img
						src="https://via.placeholder.com/500x300?text=Image4"> <img
						src="https://via.placeholder.com/500x300?text=Image5">
					<button class="carousel-button prev" onclick="showPrev()">&#60;</button>
					<button class="carousel-button next" onclick="showNext()">&#62;</button>
				</div>

				<script>
					let currentIndex = 0;
					const images = document.querySelectorAll('.carousel img');

					function showNext() {
						images[currentIndex].classList.remove('active');
						currentIndex = (currentIndex + 1) % images.length; // 0 -> 1 -> 2 -> 3 -> 4 -> 0
						images[currentIndex].classList.add('active');
					}

					function showPrev() {
						images[currentIndex].classList.remove('active');
						currentIndex = (currentIndex - 1 + images.length)
								% images.length; // 4 -> 3 -> 2 -> 1 -> 0 -> 4
						images[currentIndex].classList.add('active');
					}
				</script>
			</div>
		</div>
	</main>

	<%@ include file="/WEB-INF/views/MAIN/footer.jsp"%>
	<c:if test="${!empty msg}">
		<script>
			window.onload = function() {
				alert('${msg}');
			}
		</script>
	</c:if>