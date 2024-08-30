<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MAIN/header.jsp"%>
<style>
        .rating input:checked ~ label{
        color: gold;
        }
        
        .rating {
        display:inline-block;
        direction:rtl;
        }
        
   		.rating input{
           display: none; 
           }
</style>

<form method="POST">
<input class="form-control" name="member_num" type="text" value="${member.member_num}"  />
		<div>
			<h1>리뷰 작성</h1>
		</div>
		<div class="row  m-5">
			<div class="col-md-2">
				<span class="form-control-plaintext">작성자</span>
			</div>
			<div class="col-md-10">
<!-- 			DB랑 reviewVO에 writer값 없어서 걍 name비워놨음요					 -->
				<input class="form-control" type="text" value="${member.nickname}" readonly />
			</div>
		</div>
		<div class="row m-5">
			<div class="col-md-2">
				<span class="form-control-plaintext">제목</span>
			</div>
			<div class="col-md-10">
				<input class="form-control" name="title" type="text" />
			</div>
		</div>

		<div class="row m-5">
			<div class="col-md-2">
				<span class="form-control-plaintext">내용</span>
			</div>
			<div class="col-md-10">
				<textarea class="form-control" name="content" rows="10"></textarea>
			</div>
		</div>
		<div class="rating">
		 <input type="radio" id="star5" name="rating" value="5">
            <label for="star5">★</label>
            <input type="radio" id="star4" name="rating" value="4">
            <label for="star4">★</label>
            <input type="radio" id="star3" name="rating" value="3">
            <label for="star3">★</label>
            <input type="radio" id="star2" name="rating" value="2">
            <label for="star2">★</label>
            <input type="radio" id="star1" name="rating" value="1">
            <label for="star1">★</label>
		</div>
		
		
		<div class="row m-5">
			<div class="col-md-12">
				<input type="submit" value="작성완료" class="form-control btn btn-primary" />
			</div>
		</div>
	</form>

<%@ include file="/WEB-INF/views/MAIN/footer.jsp"%>