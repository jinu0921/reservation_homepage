<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.currentPage {
	color: red;
}

review_list li {
	background-color:white;
	list-style-type: none;
	display: inline-block;
	margin:40px 0;
	width:40px;
	height:40px;
	border-radius: 50%;
}


review_list li:hover {
	cursor: pointer;
	background-color: #ccc;
	
}


review_list li a{
text-decoration: none;
display:inline-block;
margin: auto 0;
}

.review_table{
	height: 100px;
	width: 1000px;
	margin: 0 auto;
}

.review_list_paging{
margin: 0 auto;
}


.review_list_paging ul{
margin: 0 auto;
width : 500px;
}

.review_list_paging ul li{
	text-align: center;
}

.review_list_paging ul li a{
	display:inline-block;
	line-height:40px;
	color: black;
	font-weight: bold;
	font-size: 15px;
	width: 40px;
}

.review_currentPage {
	background-color: #0067f3;
}

#review_currentPage_a{
	color: white;
}



/* ----------------위로는 페이징 아래는 테이블 ---------------------- */
.review_table tr{
border-bottom: 10px solid black;
height: 30px;
}





</style>
</head>
<%@ include file="../MAIN/header.jsp"%>
<review_list>
<body>
	<h1>
		<a href="${path}/review/review_write">글쓰기</a>
	</h1>
	<table class="review_table">
		<tr>
			<th>작성자</th>
			<th>제목</th>
			<th>게시일</th>
			<th>조회수</th>
			<th>별점</th>
		</tr>

		<c:if test="${!empty reviewList}">
			<c:forEach var="review" items="${reviewList}">

				<tr onclick="detail('${review.review_num}');">
					<td>${review.nickname}</td>
					<td>${review.title}</td>
					<td>${review.regdate}</td>
					<td>${review.viewcnt}</td>
					<td><c:forEach var="i" begin="1" end="${review.rating}">★</c:forEach>
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

</body>
</review_list>
</html>
<script type="text/javascript">
	function detail(rno) {
		location.href = "${path}/review/review_detail?review_num=" + rno;
	}
</script>