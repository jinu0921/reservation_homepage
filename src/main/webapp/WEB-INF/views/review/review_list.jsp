<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="../MAIN/header.jsp"%>
<body>
<h1><a style="color:red" href="${path}/review/review_write">글쓰기</a></h1>
<h1>review_list</h1>
<table border="1">

<tr>
	<th>작성자</th>
	<th>제목</th>
	<th>게시일</th>
	<th>조회수</th>
	<th>별점</th>
</tr>

<c:if test="${!empty reviewList}">
<c:forEach var="review" items="${reviewList}">

<tr>
<td>${review.nickname}</td>
<td>${review.title}</td>
<td>${review.regdate}</td>
<td>${review.viewcnt}</td>
<td>${review.rating}</td>
</tr>


</c:forEach>
</c:if>
</table>
</body>
</html>