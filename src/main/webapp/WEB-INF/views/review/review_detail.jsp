<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MAIN/header.jsp"%>

<div>
	<span>작성자</span>
</div>
<div>
	<span>${reviewDetail.nickname}</span>
</div>

<div>
	<span>작성일</span>
</div>
<div>
	<span>${reviewDetail.regdate}</span>
</div>

<div>
	<span>제목</span>
</div>
<div>
	<span>${reviewDetail.title}</span>
</div>

<div>
	<span>내용</span>
</div>
<div>
	<span>${reviewDetail.content}</span>
</div>

<form action="${path}/review/review_delete" method="post" onsubmit="return confirm('정말 삭제하시겠습니까?');">
    <input type="hidden" name="review_num" value="${reviewDetail.review_num}" />
    <input type="submit" value="삭제" />
</form>
<a href="${path}/review/review_update?review_num=${reviewDetail.review_num}">수정</a>



<%@ include file="/WEB-INF/views/MAIN/footer.jsp"%>