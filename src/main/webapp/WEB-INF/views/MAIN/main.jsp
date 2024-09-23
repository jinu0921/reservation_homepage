<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:set var="path" value="${pageContext.request.contextPath}" />
<head>
<style>

	.mainBody{
		height: 5000px;
		width: 1000px;
		padding: 0 auto;
	}
	.mainImage{
		    width: 100%; /* 원하는 크기로 조정 */
    height: 500px; /* 원하는 높이 */
    background-image: url('${path}/resources/piano.jpg');
    background-size: cover; /* 또는 contain */
    background-position: center; /* 이미지를 중앙에 위치 */
	opacity: 0.8; /* 배경 이미지의 불투명도 조정 */
    position: absolute;
       z-index: 1; /* 텍스트나 다른 요소 아래에 위치하도록 */   
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/MAIN/header.jsp"%>

	<main>
		<div class="mainBody">
<!-- 			<div class="mainImage"></div> -->
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