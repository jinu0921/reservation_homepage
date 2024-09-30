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
	display: block;
	text-decoration: none;
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
	margin: auto;
	text-align: center; /* 텍스트 중앙 정렬 */
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
	height: 1750px;
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
	box-shadow: 15px 15px 20px rgba(0, 0, 0, 0.5);
}

.mentorsR:nth-child(3) {
	margin-bottom: 180px;
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
	margin-top: 250px;
	width: 1100px;
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
	color: #777;
	display: flex;
	align-content: center;
	justify-content: center;
	display: flex;
}

.carousel {
	width: 500px;
	height: 500px;
	overflow: hidden;
	position: relative;
	margin: auto;
	float: left;
	border-radius: 40px;
}

.carousel img {
	width: 500px;
	height: 300px;
	border-radius: 40px;
	object-fit: cover;
	margin-left: 100px;
}

.carousel img:nth-child(1){
margin-left: 0px;
}

.carousel-button {
	width: 50px;
	height: 50px;
	border-radius: 50px;
	box-shadow: 8px 8px 16px rgba(0, 0, 0, 0.7);
	background-color: white;
	border: none;
	font-weight: bold;
	font-size: 15px;
	position: relative;
	top: -25px;
	margin-left: 100px;
}

.carousel-button:hover {
	cursor: pointer;
}

.reviewContainer {
	width: 100%;
	height: 700px;
	margin-top: 350px;
}

.prev {
	margin-left: 165px;
}

.next {
	margin-left: 70px;
}

.reviewTextContainer {
	width: 450px;
	height: 250px;
	display: inline-block;
	margin-top: 40px;
	margin-left: 50px;
}

.reviewTextContainer div:nth-child(1) {
	font-size: 14px;
}

.reviewTextContainer div:nth-child(2) {
	font-weight: bold;
	font-size: 44px;
	width: 400px;
	color: white;
	letter-spacing: -6px;
}

.reviewTextContainer div:nth-child(3) {
	margin-top: 20px;
	color: #bbb;
	font-size: 17px;
	color: #bbb;
}

.reviewMainText {
	width: 500px;
	height: 400px;
	float: right;
	margin-top: 150px;
	font-size: 35px;
	font-weight: bold;
	color: white;
	letter-spacing: -4px;
	margin-left: 50px;
}

.reviewLink {
	width: 160px;
	height: 50px;
	border: 1px solid white;
	color: white;
	font-weight: bold;
	border-radius: 30px;
	text-align: center;
	line-height: 50px;
	float: right;
	font-size: 20px;
	margin-top: 80px;
	margin-right: 180px;
	letter-spacing: -2px;
	text-decoration: none;
}

.reviewMainText div:nth-child(1), .reviewMainText div:nth-child(3) {
	color: #999;
	font-size: 60px;
}

.reviewMainText div:nth-child(4) {
	font-size: 17px;
	font-weight: normal;
	letter-spacing: -1px;
}

.carousel-inner {
	display: flex;
	width: 2900px; /* 이미지 개수에 따라 크기 설정 */
	transition: transform 0.5s ease-in-out;
	border-radius: 40px;
}

.lessonContainer {
	width: 1100px;
	text-align: center;
	margin-top: 350px;
}

.lessonMainText {
	font-size: 50px;
	margin-bottom: 15px;
	font-weight: bold;
}

.lessonSubText {
	font-size: 18px;
	color: #888;
}

.lessonBar {
	margin-top: 100px;
	display: grid;
	grid-template-columns: repeat(4, 250px);
	gap: 33px;
	display: grid;
}

.lessonContent div:nth-child(1) {
	font-size: 30px;
	font-weight: bold;
	margin-bottom: 65px;
}

.lessonContent div:nth-child(2) {
	font-size: 16px;
	margin-bottom: 30px;
	color: #777;
}

.lessonContent div:nth-child(3) {
	width: 250px;
	height: 250px;
}

.lessonContent div:nth-child(3) img {
	width: 100%;
	height: 100%;
}

.informationLink {
	display: block;
	width: 160px;
	height: 50px;
	border: 1px solid black;
	text-align: center;
	color: black;
	line-height: 50px;
	text-decoration: none;
	font-weight: bold;
	border-radius: 30px;
	font-size: 20px;
	letter-spacing: -2px;
	margin: 0 auto;
	margin-top: 60px;
}

#mentor {
	margin-top: 0px;
}

.lessonContentLine {
	width: 100%;
	position: absolute;
	background-color: #d0936d;
	height: 5px;
	z-index: 2;
	top: 6270px;
}

.reviewBackground {
	width: 100%;
	position: absolute;
	background-color: #444;
	height: 860px;
	z-index: -1;
	top: 4840px;
}

.roomContainer {
	margin-top: 250px;
}

.carousel-indicator {
	display: flex;
	margin-top: 10px;
}

.indicator {
	width: 25px; /* 길이 조정 */
	height: 5px; /* 두께 조정 */
	background-color: white; /* 배경색 */
	border-radius: 5px;
	transition: transform 0.5s ease-in-out;
	position: absolute;
	margin-left: 165px;
}

.indicatorBlock {
	height: 5px;
	background-color: #999;
	border-radius: 5px;
}

.indicatorBlock:nth-child(1){
}

.indicatorContainer {
	margin-left: 165px;
display:grid;
	grid-template-columns: repeat(5, 25px);
	gap: 10px;
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
		<div class="reviewBackground"></div>
		<div class="lessonContentLine"></div>
		<div class="mainBody">
			<div class="mainImageContent">
				<div class="MIC1">"프리미엄 피아노 학원"</div>
				<div class="MIC2">CENTUM PIANO</div>
				<a class="MIC3" href="${path }/lessonReg/lesson">강습신청 →</a>
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
			<a href="${path }/information/inform" class="informationLink">더
				많은 정보</a>
			<div class="mentorIntroContainer">
				<div class="mentorIntroSymbol">뛰어난 명품 강사진</div>
			</div>
			<div class="mentorContainer">
				<div class="mentorContainer1">
					<div class="mentorsL">
						<img class="mentorImage"
							src="https://via.placeholder.com/500x300?text=Image1"></img>
						<div class="mentorName">이진우</div>
						<div class="mentorFeatures">
							올림픽 우승<br />발롱도르 우승<br />월드컵 우승
						</div>
					</div>
					<div class="mentorsL">
						<img class="mentorImage"
							src="https://via.placeholder.com/500x300?text=Image3"></img>
						<div class="mentorName">이진우2</div>
						<div class="mentorFeatures">
							올림픽 우승<br />발롱도르 우승<br />월드컵 우승
						</div>
					</div>
					<div class="mentorsL">
						<img class="mentorImage"
							src="https://via.placeholder.com/500x300?text=Image5"></img>
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
						<img class="mentorImage"
							src="https://via.placeholder.com/500x300?text=Image2"></img>
						<div class="mentorName">김동하</div>
						<div class="mentorFeatures">
							구구단 9단<br />태권도 9단
						</div>
					</div>
					<div class="mentorsR">
						<img class="mentorImage"
							src="https://via.placeholder.com/500x300?text=Image4"></img>
						<div class="mentorName">김지연</div>
						<div class="mentorFeatures">
							올림픽 우승<br />발롱도르 우승<br />월드컵 우승
						</div>
					</div>

				</div>
			</div>
			<a href="${path }/information/inform" class="informationLink"
				id="mentor">강사진 정보</a>
			<div class="mapIntro">
				<div>센텀 피아노 지점 찾기</div>
				<div>언제 어디서나 센텀 피아노와 함께!</div>

			</div>
			<div class="mapContainer">
				<%@ include file="/WEB-INF/views/comehere/direction_map.jsp"%>
			</div>
			<a href="${path }/comehere/direction" class="informationLink"
				id="map">센텀피아노 위치</a>

			<div class="reviewContainer">
				<div class="reviewTextContainer">
					<div></div>
					<div>센텀 피아노 회원님들의 솔직한 리뷰</div>
					<div>센텀 피아노 회원님들이 직접 남긴 진솔한 이야기들을 확인해 보세요. 그들의 성장과 감동의 순간이
						가득합니다.</div>
				</div>
				<div class="reviewMainText">
					<div>"</div>
					<div>센텀 피아노는 가히 한국 최고의 피아노 학원이라 말할 수 있겠습니다.</div>
					<div>"</div>
					<div>이진우 (최연소 피아노 국가대표)</div>

					<a href="${path }/review/review_list" class="reviewLink">리뷰
						보러가기 </a>
				</div>
				<br />
				<div class="carousel">
					<div class="carousel-inner">
						<img src="https://via.placeholder.com/500x300?text=Image1" /> <img
							src="https://via.placeholder.com/500x300?text=Image2" /> <img
							src="https://via.placeholder.com/500x300?text=Image3" /> <img
							src="https://via.placeholder.com/500x300?text=Image4" /> <img
							src="https://via.placeholder.com/500x300?text=Image5" />
					</div>
					<button class="carousel-button prev" onclick="showPrev()">&#60;</button>
					<button class="carousel-button next" onclick="showNext()">&#62;</button>
					<div class="carousel-indicator">
						<span class="indicator"></span>
						<div class="indicatorContainer">
							<div class="indicatorBlock"></div>
							<div class="indicatorBlock"></div>
							<div class="indicatorBlock"></div>
							<div class="indicatorBlock"></div>
							<div class="indicatorBlock"></div>
						</div>

					</div>
				</div>
			</div>


			<div class="lessonContainer">
				<div class="lessonMainText">빠르고 간편한 예약</div>
				<div class="lessonSubText">온라인으로 손쉽게 예약하세요. 실시간으로 예약 가능 여부를
					확인할 수 있습니다.</div>
				<div class="lessonBar">
					<div class="lessonContent">
						<div>STEP 1</div>
						<div>제 경험상 올래시장에 먹거리 많아서 볼거리도 많은데 야시장에서 맥주라도 한잔 하려면 걸어갈 수 있는
							거리의 숙소가 좋겠더라구요</div>
						<div>
							<img src="https://via.placeholder.com/500x300?text=Image1">
						</div>
					</div>
					<div class="lessonContent">
						<div>STEP 2</div>
						<div>제 경험상 올래시장에 먹거리 많아서 볼거리도 많은데 야시장에서 맥주라도 한잔 하려면 걸어갈 수 있는
							거리의 숙소가 좋겠더라구요</div>
						<div>
							<img src="https://via.placeholder.com/500x300?text=Image2">
						</div>
					</div>
					<div class="lessonContent">
						<div>STEP 3</div>
						<div>제 경험상 올래시장에 먹거리 많아서 볼거리도 많은데 야시장에서 맥주라도 한잔 하려면 걸어갈 수 있는
							거리의 숙소가 좋겠더라구요</div>
						<div>
							<img src="https://via.placeholder.com/500x300?text=Image3">
						</div>
					</div>
					<div class="lessonContent">
						<div>STEP 4</div>
						<div>제 경험상 올래시장에 먹거리 많아서 볼거리도 많은데 야시장에서 맥주라도 한잔 하려면 걸어갈 수 있는
							거리의 숙소가 좋겠더라구요</div>
						<div>
							<img src="https://via.placeholder.com/500x300?text=Image4">
						</div>
					</div>
				</div>
			</div>
			<a href="${path }/lessonReg/lesson" class="informationLink"
				id="roomReg">예약하러 가기</a>
		</div>

		<div class="roomContainer"></div>
	</main>

	<%@ include file="/WEB-INF/views/MAIN/footer.jsp"%>
	<script>
		let currentIndex = 0;
		const carouselInner = document.querySelector('.carousel-inner');
		const images = document.querySelectorAll('.carousel img');
		const totalImages = images.length;
		console.log("이진우1");

		function updateIndicator() {
			const indicator = document.querySelector('.indicator');
			let a = `translateX(\${currentIndex * 35}px)`;
			indicator.style.transform = a;
		}

		function showNext() {
			currentIndex = (currentIndex + 1) % totalImages;
			let a = `translateX(-\${currentIndex * 600}px)`;
			console.log(a);
			carouselInner.style.transform = a;
			resetAutoSlide();
			updateIndicator(); // 추가된 코드

		}

		function showPrev() {
			currentIndex = (currentIndex - 1 + totalImages) % totalImages;
			let a = `translateX(-\${currentIndex * 600}px)`;
			carouselInner.style.transform = a;
			updateIndicator(); // 추가된 코드
			resetAutoSlide();
		}

		function startAutoSlide() {
			autoSlideInterval = setInterval(showNext, 4000);
		}

		// 자동 슬라이드 타이머 초기화 함수
		function resetAutoSlide() {
			clearInterval(autoSlideInterval);
			startAutoSlide(); // 다시 자동 슬라이드 시작
		}
		startAutoSlide();
	</script>
	<c:if test="${!empty msg}">
		<script>
			window.onload = function() {
				alert('${msg}');
			}
		</script>
	</c:if>