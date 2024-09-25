<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<head>
<style>
main {
	
}

.mainBody {
	margin: auto;
	width: 1100px;
	height: 3000px;
	margin-top: 80px;
}

.mainImage {
	top:80px;
	width: 100vw; /* 원하는 크기로 조정 */
	height: 600px; /* 원하는 높이 */
	background-image: url('${path}/resources/piano.jpg');
	background-size: cover; /* 또는 contain */
	background-position: center; /* 이미지를 중앙에 위치 */
	position: absolute;
	z-index: -1; /* 텍스트나 다른 요소 아래에 위치하도록 */
}


.mentorBackground {
	background-color: #f1e5d4;
	width: 100%;
	height: 600px;
	position: absolute;
	top: 1500px;
	z-index:-1;
}

.mainImageContent {
	margin-top: 300px;
	margin-bottom: 500px;
}

.MIC1 {
	color: #aaa;
	text-align: center;
	font-size: 20px;
	font-weight: bold;
}

.MIC2 {
	text-align: center;
	font-size: 50px;
	font-weight: bold;
	font-family: 'Brush Script MT', cursive;
}

.MIC3{
	font-size:20px;
	border:2px black solid;
	color:white;
	font-weight: bold;
	text-align: center;
	width: 200px;
	height:50px;
	margin: auto;
	line-height:50px;
	margin-top: 70px;
	border-radius:40px;
	background-color: rgba(255,255,255,0.2);
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

.Maininformation {
	background-color: blue;
	height: 100px;
}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/MAIN/header.jsp"%>

	<main>
			<div class="mainImage">
			<div class="overlay"></div>
		</div>
		<div class="mentorBackground"></div>

			<div class="mainBody">
			<div class="mainImageContent">
				<div class="MIC1">"프리미엄 피아노 학원"</div>
				<div class="MIC2">CENTUM PIANO</div>
				<div class="MIC3">강습신청 →</div>
			</div>
			
			<div class="mainInformation"></div>
			<div class="InformationBar">
				<div class="Maininformation">1</div>
				<div class="Maininformation">2</div>
				<div class="Maininformation">3</div>
				<div class="Maininformation">4</div>
				<div class="Maininformation">5</div>
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