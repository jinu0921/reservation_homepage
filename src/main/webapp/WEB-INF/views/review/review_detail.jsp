<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MAIN/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<div class="detail_head">
	<div class="review_detail_nickname">${reviewDetail.nickname}</div>
	<div class="review_detail_title">${reviewDetail.title}</div>
	<div class="review_detail_regdate">
		<fmt:formatDate value="${reviewDetail.regdate}" pattern="yyyy.MM.dd" />
	</div>
	<div class="review_rating">
		<c:forEach var="i" begin="1" end="${review.rating}">
			<div class="filled_star">★</div>
		</c:forEach>
		<c:forEach var="i" begin="1" end="${5-review.rating}">
			<div class="empty_star">☆</div>
		</c:forEach>
	</div>
	<div class="review_viewcnt">조회수 ${review.viewcnt}</div>
	<br />

</div>

<form action="${path}/review/review_delete" method="post"
	onsubmit="return confirm('정말 삭제하시겠습니까?');">
	<input type="hidden" name="review_num"
		value="${reviewDetail.review_num}" /> <input type="submit" value="삭제" />
</form>
<a
	href="${path}/review/review_update?review_num=${reviewDetail.review_num}">수정</a>



<%@ include file="/WEB-INF/views/MAIN/footer.jsp"%>