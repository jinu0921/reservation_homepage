<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../MAIN/header.jsp"%>
<div class="content-container">
    <h2>센텀피아노 찾기</h2>
    <h4>센텀피아노의 위치를 지도에서 확인해보세요</h4>
    <div class="map_background"></div>
    <div class="map-container">
        <%@ include file="../comehere/direction_map.jsp"%>
    </div>
</div>

<style>
    body {
        background-color: #f8f9fa;
        font-family: 'Noto Sans', sans-serif;
    }

	.map_background{
		width: 100%;
		height: 100%;
		background-color: #fffaf0;
		position: absolute;
		z-index: -1;
	}
	
    .content-container {
    margin-top:150px;
        text-align: center;
        padding: 50px 0;
        margin-bottom: 100px;
    }

    h2 {
        font-size: 37px;
        font-weight: bold;
        margin-bottom: 10px;
    }
    
    h4 {
        font-size: 21px;
        margin-bottom: 100px;
        color: #888;
        margin-bottom: 100px;
        font-weight: normal;
    }

    .map-container {
        width: 100%;
        max-width: 1100px;
        height: 700px;
        margin: 0 auto;
        border-radius: 15px;
        overflow: hidden;
        box-shadow: 10px 10px 20px rgba(0, 0, 0, 0.5);
    	margin-top:200px;
    }
</style>

<%@ include file="../MAIN/footer.jsp"%>
