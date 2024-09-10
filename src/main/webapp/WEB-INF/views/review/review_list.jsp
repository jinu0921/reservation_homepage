<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	width: 1250px;
	margin: 0 auto;
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
	background-color: #0067f3;
}

#review_currentPage_a {
	color: white;
}

table {
	border-collapse: collapse;
}

/* ----------------위로는 페이징 아래는 테이블 ---------------------- */

.review_table tr {
	border-bottom: 2px solid #cccccc;
	height: 300px;
	    display: flex;
    justify-content: flex-start; /* 자식 요소들을 상단에 정렬 */
}

.review_table_right:hover{
cursor: pointer;
}

.review_viewcnt{
	margin-left:10px;
	margin-bottom:10px;
	font-size:14px;
	display: inline-block;
	color: gray;
}

.review_table_right:hover>.review_title,
.review_table_right:hover>.review_content{
	text-decoration: underline;
}

.review_table_left{
width: 400px;
padding-left:70px;
padding-top:0px;
}

.review_nickname{
    margin-top: 70px;
font-weight: bold;
line-height:20px;
font-size:20px;
height: 20px;
}

.review_regdate{
font-size:14px;
color: gray;
}
.review_rating {
margin-top: 50px;
}

.filled_star{
color: #FEFD48;
font-weight: bold;
line-height:20px;
font-size:20px;
display: inline-block;
}
.empty_star{
display: inline-block;
}

.review_table_right{
width: 700px;
}

.review_title{
width: 550px;
margin-bottom: 30px;
margin-top: 8px;
height: 25px;
text-overflow: ellipsis;  
overflow: hidden;
white-space: nowrap;
font-size: 25px;
line-height: 25px;
font-weight: bold;

}

.review_content {
    width: 700px;
    height: 45px;
    font-size: 15px;
    line-height: 15px;
    display: -webkit-box;         
    -webkit-line-clamp: 3;          
    -webkit-box-orient: vertical;   
    overflow: hidden;              
    text-overflow: ellipsis;        
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
		<c:if test="${!empty reviewList}">
			<c:forEach var="review" items="${reviewList}">

				<tr onclick="detail('${review.review_num}');" class="review_table_tr">
					<td class="review_table_left">
						<div class="review_nickname">${review.nickname}</div>
						<div class="review_regdate"><fmt:formatDate value="${review.regdate}" pattern="yyyy.MM.dd" /></div>
						</td>
					<td class="review_table_right">
						<div class="review_rating">
						<div class="review_viewcnt">조회수 ${review.viewcnt}</div> <br/>
							<c:forEach var="i" begin="1" end="${review.rating}">
							<div class="filled_star">★</div></c:forEach>
							<c:forEach var="i" begin="1" end="${5-review.rating}">
							<div class="empty_star">☆</div></c:forEach>
							
						</div>
						<div class="review_title">${review.title}</div>
						<div class="review_content">${review.content}</div>
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