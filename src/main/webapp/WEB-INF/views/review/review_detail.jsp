<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MAIN/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<!DOCTYPE html>
	<head>
<style>
.detail_filled_star {
	display: inline-block;
	color: #FEFD48;
}

.detail_empty_star {
	display: inline-block;
}

.reviewContainer{
	margin: 0 auto;
	width: 900px;
	text-align: center;
}
.review_detail_content{
text-align: left;
}

.review_detail_box {
	width: 100%;
	display: flex;
margin-top:100px;
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
margin: 150px 50px;
margin-top: 200px;
font-size: 16px;
}

.review_detail_title{
	font-weight: bold;
	font-size: 34px;
	margin-top:20px;
	letter-spacing: -2px;
	text-align: left;
	margin-bottom: 20px;
}

.review_detail_rating{
margin-left:20px;
	display: inline-block;	
	width: 150px;
	height: 20px;
}

.review_detail_rating img{
	width: 20px;
	height: 20px;
}

.review_detail_nickname{
margin-left:15px;
margin-top:17px;
font-weight: bold;	
display: inline-block;
}

.review_detail_regdate{
	display: inline-block;
	direction:rtl;
	float: right;
	margin-right: 10px;
	color:#888;
}


.review_detail_viewcnt{
color:#888;
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


.DetailReviewContainer{
width: 900px;
display: grid;
	grid-template-columns: repeat(5, 160px);
	gap: 20px;
	margin-bottom: 40px;
}

.DetailImage{
width:150px;
height: 150px;
border-radius: 20px;
}

#deleteBtn{
	display: none;
}

.deleteLabel, .updateBtn{
margin-top:30px;
	width:100px;
	text-align:center;
	border-radius:20px;
	border:2px solid #b59178;
	float:right;
	display: inline-block;
	height: 40px;
	line-height: 40px;
	color:#b59178;
	font-weight:bold;
	text-decoration: none;
			margin-right: 20px;
}



</style>
	</head>
<div class="reviewContainer">
<div class="review_detail_box">
	<div class="review_detail_head">
		<div class="review_detail_title">${reviewDetail.title}</div>
	<div class="review_detail_head_left">
		<div class="review_detail_nickname">${reviewDetail.uname}</div>
		<div class="review_detail_rating">
			<c:forEach var="i" begin="1" end="${reviewDetail.rating}">
				<img class="detail_filled_star" src="${path }/resources/yellowstar.png">
			</c:forEach>
			<c:forEach var="i" begin="1" end="${5-reviewDetail.rating}">
				<img class="detail_empty_star" src="${path }/resources/emptystar.png">
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
	
	<c:if test="${!empty reviewDetail.imageUrl}">
	<div class="DetailReviewContainer">
		    <c:forEach var="reviewImage" items="${reviewDetail.imageUrl}">
									<img src="${path}/displayFile?fileName=${reviewImage}" class="DetailImage">
							    </c:forEach>
							    </div>
					</c:if>
	
	
</div>
		<c:if test="${member.memberNum==reviewDetail.memberNum}">
		<div>
	<form action="${path}/review/review_delete" method="post"
		onsubmit="return confirm('정말 삭제하시겠습니까?');">
		<input type="hidden" name="reviewNum"
			value="${reviewDetail.reviewNum}" /> <input type="submit"
			value="삭제" id="deleteBtn"/><label for="deleteBtn" class="deleteLabel">삭제</label>
	</form>	

	<a
		href="${path}/review/review_update?reviewNum=${reviewDetail.reviewNum}" class="updateBtn">수정</a>
		</div>
		</c:if>
</div>

<%@ include file="/WEB-INF/views/review/review_list_content.jsp"%>
<%@ include file="/WEB-INF/views/MAIN/footer.jsp"%>
<c:if test="${!empty msg}">
    <script>
        window.onload = function() {
            alert('${msg}');
        }
    </script>
    

</c:if>