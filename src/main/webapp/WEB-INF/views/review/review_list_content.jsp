	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<style type="text/css">
	.currentPage {
		color: red;
	}
	
	review_list li {
		background-color: white;
		list-style-type: none;
		display: inline-block;
		margin: 40px 0;
		width: 40px;
		height: 40px;
		border-radius: 50%;
	}
	
	review_list li:hover {
		cursor: pointer;
		background-color: #ccc;
	}
	
	review_list li a {
		text-decoration: none;
		display: inline-block;
		margin: auto 0;
	}
	
	.review_table {
		width: 1100px;
		margin: 0 auto;
		border-top: 2px solid black;
	}
	
	.review_list_paging {
		margin: 0 auto;
	}
	
	.review_list_paging ul {
		margin: 0 auto;
		width: 500px;
	}
	
	.review_list_paging ul li {
		text-align: center;
	}
	
	.review_list_paging ul li a {
		display: inline-block;
		line-height: 40px;
		color: black;
		font-weight: bold;
		font-size: 15px;
		width: 40px;
	}
	
	.review_currentPage {
		background-color: #c7b199;
	}
	
	#review_currentPage_a {
		color: white;
	}
	
	table {
		border-collapse: collapse;
	}
	
	/* ----------------위로는 페이징 아래는 테이블 ---------------------- */
	.review_table tr {
		border-bottom: 1px solid #ddd;
		display: flex;
		justify-content: flex-start; /* 자식 요소들을 상단에 정렬 */
	}
	
	.review_viewcnt {
		margin-left: 10px;
		margin-bottom: 10px;
		font-size: 14px;
		display: inline-block;
		color: gray;
		letter-spacing: -1px;
	}
	.RTRCContainer:hover > .review_title, .RTRCContainer:hover > .review_content  {
	    text-decoration: underline;
	}
	
	.RTRCContainer:hover{
	cursor: pointer;
	}
	
	
	.review_table_left {
		width: 300px;
		padding-left: 70px;
		padding-top: 0px;
	}
	
	.review_nickname {
		margin-top: 70px;
		font-weight: bold;
		line-height: 20px;
		font-size: 25px;
		height: 20px;
	}
	
	.review_regdate {
	margin-top:5px;
		font-size: 14px;
		color: gray;
	}
	
	.review_rating {
		margin-top: 25px;
	}
	
	.filled_star {
		display: inline-block;
		height: 15px;
		width: 15px;
	}
	
	.empty_star {
		display: inline-block;
		height: 13px;
		width: 13px;
	}
	
	.review_table_right {
		width: 700px;
	}
	
	.review_title {
		width: 550px;
		margin-bottom: 30px;
		margin-top: 18px;
		height: 30px;
		text-overflow: ellipsis;
		overflow: hidden;	
		white-space: nowrap;
		font-size: 27px;
		line-height: 25px;
		font-weight: bold;
		letter-spacing: -1px;
	}
	
	.review_content {	
	color:#555;
	letter-spacing: -1px;
		width: 700px;
		height: 51px;
		font-size: 17px;
		line-height: 17px;
		display: -webkit-box;
		-webkit-line-clamp: 3;
		-webkit-box-orient: vertical;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	
	.review_table_tr{
		padding: 20px;
	}
	
	.review_list {
		width: 1100px;
		margin: 0 auto;
		margin-top: 80px;
	}
	
	.reviewUpperContainer{
		width: 1100px;
		height: 90px;
		margin-top: 200px;
	}
	
	.rating {
	display: inline-block;
	height: 100%;
	line-height: 90px;
	font-size: 30px;
	font-weight: bold;
	margin-left: 25px;
	}
	
	.rating img{
	height: 35px;
	width: 35px;
	}
	
	.totalReview{
	display: inline-block;
	height: 100%;
	line-height: 90px;
	font-size: 20px;
	margin-left: 15px;
	color: #999;
	font-weight: bold;
	}
	
	.review_write_a{
	margin-right:20px;
	width:100px;
	text-align:center;
	margin-top:25px;
	border-radius:20px;
	border:2px solid #b59178;
	float:right;
	display: inline-block;
	height: 40px;
	line-height: 40px;
	color:#b59178;
	font-weight:bold;
	text-decoration: none;
	}
	
	.reviewImage{
	width:180px;
		height: 230px;
		display: inline-block;
		border-radius: 25px;
		margin-left: 20px;
	}
	
	.reviewImage:nth-child(1){
			margin-left: 0px;
	}
	.RIClayout {
			border-radius: 25px;
	    align-items: center; /* 세로 중앙 정렬 */
	    position: relative; /* 자식 요소를 절대 위치로 배치할 수 있게 */
	    width: 700px; /* 고정 너비 */
	    	 mask-image: linear-gradient(to left, rgba(255, 255, 255, 0) 3%, rgba(255, 255, 255, 1) 12%);
	    
	    margin-top: 30px;
	    height: 230px;
	    margin-bottom: 30px;
	    left: 30px;
	}
	
	.reviewImageContainer {
			border-radius: 25px;
display: inline-flex;
	    overflow: hidden; /* 넘치는 내용 숨김 */
	    white-space: nowrap; /* 줄바꿈 방지 */
	    transition: transform 0.5s ease-in-out;
	    width: auto;
	}
	
	.RICprev, .RICnext {
	display: none; /* 기본적으로 숨김 */
	    cursor: pointer; /* 포인터 커서 */
	    width: 50px; /* 버튼 고정 너비 */
	    height: 50px; /* 버튼 고정 높이 */
	    position: absolute; /* 절대 위치 */
	    top: 50%; /* 수직 중앙 정렬 */
	    transform: translateY(-50%); /* 정확한 중앙 정렬 */
	    background-color: white; /* 배경색 */
	    z-index:5;
	    border-radius: 25px; /* 둥근 모서리 */
	    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
	    line-height: 50px;
	    font-weight: bold;
	    text-align: center;
	}
	.RICContainer:hover .RICprev,
.RICContainer:hover .RICnext {
    display: block; /* 호버 상태일 때 보이기 */
}
	
	.RICprev {
	left: 10px;
	}
	
	.RICnext {
	    right: 70px; /* 오른쪽 버튼 위치 */
	}
	
	.RICContainer{
	left:-30px;
	    display: flex; /* 플렉스 박스로 설정 */
	    align-items: center; /* 세로 중앙 정렬 */
	    position: relative; /* 자식 요소를 절대 위치로 배치할 수 있게 */
	width: 810px;
	}
	
	</style>
	</head>
	
	<review_list>
	<body>
		<div class="review_list">
	
			<div class="reviewUpperContainer">
			<div class="rating">
			<img src="${path }/resources/yellowstar.png">
			별점 ${avgRating}</div>
			<div class="totalReview">리뷰 ${pm.totalCount}개</div>
			<a href="${path}/review/review_write" class='review_write_a'> 리뷰 작성 </a>
		</div>
	
	
			<table class="review_table">
				<c:if test="${!empty reviewList}">
					<c:forEach var="review" items="${reviewList}">
	
						<tr 
							class="review_table_tr">
							<td class="review_table_left">
								<div class="review_nickname">${review.nickname}</div>
								<div class="review_regdate">
									<fmt:formatDate value="${review.regdate}" pattern="yyyy.MM.dd" />
								</div>
							</td>
							<td class="review_table_right">
								<div class="review_rating">
									<div class="review_viewcnt">조회수 ${review.viewcnt}</div>
									<br />
									<c:forEach var="i" begin="1" end="${review.rating}">
										<img class="filled_star" src="${path }/resources/yellowstar.png">
									</c:forEach>
									<c:forEach var="i" begin="1" end="${5-review.rating}">
										<img class="empty_star" src="${path }/resources/emptystar.png">
									</c:forEach>
	
								</div>
								<div class="RTRCContainer" onclick="detail('${review.reviewNum}');">
								<div class="review_title" >${review.title}</div>
								<div class="review_content" >${review.content}</div>
								</div>
							<c:if test="${!empty review.imageUrl}">
							<div class="RICContainer" 
							onmouseover="<c:if test="${fn:length(review.imageUrl) > 3}">hoverFunction(${review.reviewNum}, ${fn:length(review.imageUrl)})</c:if>"
							onmouseleave="<c:if test="${fn:length(review.imageUrl) > 3}">overFunction(${review.reviewNum})</c:if>">
							        <c:if test="${fn:length(review.imageUrl) > 3}">
								<div class="RICprev review-${review.reviewNum}" onclick="prev('${review.reviewNum}', ${fn:length(review.imageUrl)})">&#60;</div>
								</c:if>
							<div class="RIClayout" >
							<div class="reviewImageContainer review-${review.reviewNum}">
							    <c:forEach var="reviewImage" items="${review.imageUrl}">
									<img src="${path}/displayFile?fileName=${reviewImage}" class="reviewImage">
							    </c:forEach>
							    </div>
							    </div>
							     <c:if test="${fn:length(review.imageUrl) > 3}">
							<div class="RICnext review-${review.reviewNum}" onclick="next('${review.reviewNum}', ${fn:length(review.imageUrl)})">&#62;</div>
							</c:if>
							    </div>
							</c:if>
	
							</td>
						</tr>
	
	
					</c:forEach>
				</c:if>
			</table>
			<div class="review_list_paging">
				<ul>
					<c:if test="${pm.first}">
						<li><a href="${path}/review/review_list?page=1">&lt;&lt;</a></li>
					</c:if>
					<c:if test="${pm.prev}">
						<li><a href="${path}/review/review_list?page=${pm.startPage-5}">&lt;</a></li>
					</c:if>
					<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
						<c:choose>
							<c:when test="${pm.cri.page eq i}">
								<li class="review_currentPage"><a id="review_currentPage_a">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${path}/review/review_list?page=${i}">${i}</a></li>
							</c:otherwise>
						</c:choose>
	
					</c:forEach>
					<c:if test="${pm.next}">
						<li><a href="${path}/review/review_list?page=${pm.endPage+1}">&gt;</a></li>
					</c:if>
					<c:if test="${pm.last}">
						<li><a href="${path}/review/review_list?page=${pm.maxPage}">&gt;&gt;</a></li>
					</c:if>
				</ul>
			</div>
	
		</div>
	</body>
	</review_list>
	</html>
	
	<c:if test="${!empty msg}">
		<script>
		
			window.onload = function() {
				alert('${msg}');
			}
		</script>
	</c:if>
	<script>
	
	
	
	
		function detail(rno) {
			location.href = "${path}/review/review_detail?reviewNum=" + rno;
		}
	</script>
	
	
	<script>
	let currentIndices = {};
	
	
function hoverFunction(reviewNum, imageLength){
    if (!currentIndices[reviewNum]) {
        currentIndices[reviewNum] = 0; // 초기화
    }
    
		checkPrev(reviewNum);
	checkNext(reviewNum, imageLength);
}

function overFunction(reviewNum){
	const prev = document.querySelector(`.RICprev.review-\${reviewNum}`);
	const next = document.querySelector(`.RICnext.review-\${reviewNum}`);
	prev.style.display = `none`;
	next.style.display = `none`;
	}


		function prev(reviewNum,ImageLen) {
			currentIndices[reviewNum]--;
			const RIContainer = document.querySelector(`.reviewImageContainer.review-\${reviewNum}`);
			RIContainer.style.transform = `translateX(-\${currentIndices[reviewNum] * 200}px)`;
			checkPrev(reviewNum);
			checkNext(reviewNum, ImageLen);
		}
		
		function next(reviewNum, ImageLen) {
			currentIndices[reviewNum]++;
			const RIContainer = document.querySelector(`.reviewImageContainer.review-\${reviewNum}`);
			RIContainer.style.transform = `translateX(-\${currentIndices[reviewNum] * 200}px)`;
			checkPrev(reviewNum);
			checkNext(reviewNum, ImageLen);
			
		}
		
		function checkPrev(reviewNum){
					const prev = document.querySelector(`.RICprev.review-\${reviewNum}`);
			 if (currentIndices[reviewNum] < 1){


					prev.style.display = `none`;		
		}else{
			prev.style.display = `block`;
		}
		}

		
		function checkNext(reviewNum, imageLength){
					const next = document.querySelector(`.RICnext.review-\${reviewNum}`);
			 if (currentIndices[reviewNum] > imageLength - 4){
					next.style.display = `none`;		
		}else{
			next.style.display = `block`;	
		}
		}
		
			 
	</script>