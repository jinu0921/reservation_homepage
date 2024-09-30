<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MAIN/header.jsp"%>
<style>
    /* 폼 전체 스타일 */
    .reviewWriteContainer {
        width: 1100px;
        border-radius: 10px;
        margin : 0 auto;
   		margin-top:160px;
        padding: 50px;
    }

    /* 제목 스타일 */
    .reviewWriteContainer h1 {
        font-size: 45px;
        font-weight: bold;
        text-align: center;
        margin: 0 auto;
        margin-bottom: 30px;
        display: block;
        letter-spacing: -3px;
    }

    /* 라벨 텍스트 스타일 */
    .form-label {
        font-size: 16px;
        font-weight: bold;
        margin-bottom: 10px;
        color: #333;
    }

    /* 입력 필드 스타일 */
    .form-control {
        border: 1px solid #ddd;
        padding: 12px;
        border-radius: 8px;
        width: 100%;
        font-size: 14px;
        margin-bottom: 20px;
    }

    /* 별점 스타일 */
    .rating {
        display: inline-block;
        direction: rtl;
        margin-bottom: 30px;
    }

    .rating label {
        font-size: 30px;
        color: #ddd;
        cursor: pointer;
    }

    .rating input:checked ~ label{
        color: gold;
    }

    .rating input {
        display: none;
    }

    /* 버튼 스타일 */
    .btn-primary {
        background-color: #007bff;
        color: white;
        font-size: 16px;
        padding: 12px;
        border-radius: 8px;
        border: none;
        cursor: pointer;
    }

    .btn-primary:hover {
        background-color: #0056b3;
    }

    /* 전반적인 폼 구성 */
    .form-group {
        margin-bottom: 20px;
    }
    
    .form-group:nth-child(3) {
		resize: none;
		background-color: blue;
}

.reviewWriteText{
margin: 0 auto;
display: inline-block;
}

.form-group:nth-child(1) {	
text-align: center;
margin:0 auto;
font-size: 100px;
color: yellow;
}
</style>

<div class="reviewWriteContainer">
    <form method="POST" onsubmit="return validateForm();" enctype="multipart/form-data">
                <input class="form-control" type="hidden" value="${member.memberNum}" name="memberNum" />
        <h1 class="reviewWriteText">센텀피아노 리뷰 작성</h1>

        <!-- 작성자 -->
        <div class="form-group">
            <label class="form-label">작성자</label>
            <input class="form-control" type="text" value="${member.nickname}" readonly />
        </div>

        <!-- 제목 -->
        <div class="form-group">
            <label class="form-label">제목 ${member.memberNum}</label>
            <input class="form-control" name="title" type="text" />
        </div>
        
        

        <!-- 내용 -->
        <div class="form-group">
            <label class="form-label">내용</label>
            <textarea class="form-control" name="content" rows="8"></textarea>
        </div>

		<div class="form-group">
            <label class="form-label">첨부파일</label>
            <input type="file" id="reviewImage" name="reviewImage" accept="image/*" multiple/>
        </div>
        <!-- 별점 -->
<div class="rating">
    <input type="radio" id="star5" name="rating" value="5" checked >
    <label for="star5"><img src="${path}/resources/emptystar.png" alt="별 5개" class="star"></label>
    <input type="radio" id="star4" name="rating" value="4">
    <label for="star4"><img src="${path}/resources/emptystar.png" alt="별 4개" class="star"></label>
    <input type="radio" id="star3" name="rating" value="3">
    <label for="star3"><img src="${path}/resources/emptystar.png" alt="별 3개" class="star"></label>
    <input type="radio" id="star2" name="rating" value="2">
    <label for="star2"><img src="${path}/resources/emptystar.png" alt="별 2개" class="star"></label>
    <input type="radio" id="star1" name="rating" value="1">
    <label for="star1"><img src="${path}/resources/emptystar.png" alt="별 1개" class="star"></label>
</div>

        <!-- 작성 완료 버튼 -->
        <input type="submit" value="작성완료" class="form-control btn btn-primary" />
    </form>
</div>

<%@ include file="/WEB-INF/views/MAIN/footer.jsp"%>

<script>
    function validateForm() {
        var title = document.getElementsByName("title")[0].value;
        var content = document.getElementsByName("content")[0].value;
        if (title.length > 200) {
            alert("제목은 200자 미만이어야 합니다.");
            return false;
        }

        if (content.length > 65535) {
            alert("내용은 65535자 미만이어야 합니다.");
            return false;
        }
        

        return true;
    }
</script>
<script>
updateStarImages();
    document.querySelectorAll('.rating input').forEach(function (input) {
        input.addEventListener('change', function () {
            updateStarImages();
        });
    });

    function updateStarImages() {
        const stars = document.querySelectorAll('.rating .star');
        for (let index = 0; index < stars.length; index++) {
            const input = document.querySelector(`input[id=star\${5-index}]`);
            if (input.checked) {
            	console.log("dsfasfsaf")
                // 체크된 별과 그 이하의 별들을 금빛 이미지로 설정
                for (let j = 4; j >= index; j--) {
                    stars[j].src = '${path}/resources/yellowstar.png'; // 금빛 이미지
                }
                break; // 체크된 별을 찾았으므로 루프 종료
            } else {
                stars[index].src = '${path}/resources/emptystar.png'; // 기본 이미지
            }
        }
    }

</script>