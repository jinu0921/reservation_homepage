<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MAIN/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
.detail_filled_star {
	display: inline-block;
	color: #FEFD48;
}

.detail_empty_star {
	display: inline-block;
}

.review_detail_box {
	width: 900px;
	// border: 1px solid black;
	display: flex;
	justify-content: center; /* 가로 중앙 정렬 */
	   flex-direction: column; /* 자식 요소들을 세로로 정렬 */
	  border-bottom: 2px solid black;
}

review_detail {
	display: flex;
	justify-content: center; /* 가로 중앙 정렬 */
}
.review_detail_head{
border-bottom: 2px solid #ccc;
}

.review_detail_body{
margin: 300px 50px;
margin-top: 100px;
}

.review_detail_title{
	font-weight: bold;
	font-size: 26px;
	margin-top:20px;
}

.review_detail_rating{
	display: inline-block;	
}

.review_detail_regdate{
	display: inline-block;
	direction:rtl;
	float: right;
	margin-right: 10px;
}


.review_detail_viewcnt{
	display: inline-block;
	float: right;
	margin-right: 25px;
}

.review_detail_head_right{
width : 300px;
display: inline-block;
margin-left:290px;
margin-bottom:10px;
}

.review_detail_head_left{
width : 300px;
display: inline-block;
margin-bottom:10px;
} 

.review_detail_nickname{
margin-top:17px;
}

</style>

<review_detail>
<div class="review_detail_box">
	<div class="review_detail_head">
		<div class="review_detail_title">${reviewDetail.title}</div>
	<div class="review_detail_head_left">
		<div class="review_detail_nickname">${reviewDetail.nickname}</div>
		<div class="review_detail_rating">
			<c:forEach var="i" begin="1" end="${reviewDetail.rating}">
				<div class="detail_filled_star">★</div>
			</c:forEach>
			<c:forEach var="i" begin="1" end="${5-reviewDetail.rating}">
				<div class="detail_empty_star">☆</div>
			</c:forEach>
		</div>
	</div>
		<div class="review_detail_head_right">
		<div class="review_detail_regdate">
			<fmt:formatDate value="${reviewDetail.regdate}" pattern="yyyy.MM.dd" />
		</div>
		<div class="review_detail_viewcnt">조회수 ${reviewDetail.viewcnt}</div>
		<br />
		
	</div>
	</div>
	<div class="review_detail_body">
		<div class="review_detail_content">${reviewDetail.content}</div>
	</div>
	
	<div>
		<c:if test="${member.memberNum==reviewDetail.memberNum}">
	<form action="${path}/review/review_delete" method="post"
		onsubmit="return confirm('정말 삭제하시겠습니까?');">
		<input type="hidden" name="reviewNum"
			value="${reviewDetail.reviewNum}" /> <input type="submit"
			value="삭제" />
	</form>	

	<a
		href="${path}/review/review_update?reviewNum=${reviewDetail.reviewNum}">수정</a>
		</c:if>
		</div>
</div>

</review_detail>
	

<%@ include file="/WEB-INF/views/review/review_list_content.jsp"%>
<%@ include file="/WEB-INF/views/MAIN/footer.jsp"%>
<c:if test="${!empty msg}">
    <script>
        window.onload = function() {
            alert('${msg}');
        }
    </script>
</c:if>