<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MAIN/header.jsp"%>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">

<style>
    /* 폼 전체 스타일 */
    .reviewWriteContainer {
        width: 900px;
        border-radius: 10px;
        margin : 0 auto;
   		margin-top:160px;
        padding: 50px;
    font-family: 'Noto Sans', sans-serif;
    }

    /* 제목 스타일 */
    .reviewWriteContainer h1 {
        font-size: 45px;
        font-weight: bold;
        text-align: center;
        margin: 0 auto;
        margin-bottom: 60px;
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
        margin-bottom: 100px;
        margin-top: 30px;
        width: 400px;
        text-align: center;
        margin-left: 250px;
    }

    .rating label {
        font-size: 20px;
        color: #ddd;
        cursor: pointer;
    }
    
     .rating label img{
     	width: 50px;
     	height: 50px;
     	margin-left: 20px;
     }
     
     .rating label:nth-child(1) img{
     	margin-left: 0px;
     }

    .rating input:checked ~ label{
        color: gold;
    }

    .rating input {
        display: none;
    }

    /* 버튼 스타일 */
    .btn-primary {
        background-color: #89480a;
        color: white;
        font-size: 20px;
        padding: 12px;
        border-radius: 8px;
        border: none;
        cursor: pointer;
        width: 600px;
        height: 100px;
        margin:0 auto;
        display: block;	
        margin-top: 100px;
        font-weight: bold;
         transition: background-color 0.2s ease, transform 0.3s ease; 
    }

    .btn-primary:hover {
        background-color: #9A5B1B;
        transform: scale(1.05); /* hover 시 크기 증가 */
    }

    /* 전반적인 폼 구성 */
    .form-group {
        margin-bottom: 20px;
    }
    
    .form-control.c{
		resize: none;
}

.reviewWriteText{
margin: 0 auto;
display: inline-block;
}

.form-control.a{
display:block;
margin:0 auto;
text-align:center;
	background-color: #c7b199;
	color: white;
	font-size: 18px;	
	font-weight: bold;
	width: auto;
}

#reviewImage{
	display: none;
}

.reviewImageLabel div:nth-child(1){
	width: 375px;
	margin: 0 auto;
	text-align: center;
	height: 60px;
	border: 2px solid #b59178;
	color: #b59178;
	font-weight: bold;
	font-size: 23px;
	line-height: 60px;
	transition: transform 0.2s ease-in-out;
	border-radius: 14px;
}

.form-control.c{
	background-color: #efefef;
}

input::placeholder, textarea::placeholder{
	letter-spacing: -1px;
	color: #bbb;
	font-weight: bold;
}


.reviewImageLabel div:nth-child(1):hover{
	cursor: pointer;
	 transform: scale(1.05);
	}
	
	.reviewImageLabel div:nth-child(2){
		display: grid;
		grid-template-columns:repeat(5, 160px);
		gap:25px;
	}
	
	.reviewImageLabel div:nth-child(2) img{
	width:160px;
	display:block;
	height: 130px;
	border-radius: 15px;
	margin-top: 20px;
	}
	
</style>

<div class="reviewWriteContainer">
    <form method="POST" onsubmit="return validateForm();" enctype="multipart/form-data">
                <input class="form-control" type="hidden" value="${member.memberNum}" name="memberNum" />
        <h1 class="reviewWriteText">센텀피아노 리뷰 수정</h1>
        <div class="form-group">
            <input class="form-control a" type="text" value="${member.uname} 님" readonly />
        </div>

<div class="rating">
    <input type="radio" id="star5" name="rating" value="5">
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
        <!-- 작성자 -->

        <!-- 제목 -->
        <div class="form-group">
            <input class="form-control b" name="title" type="text" placeholder="리뷰의 제목을 입력해 주세요!" value="${reviewUpdate.title }"/>
        </div>
        
        

        <!-- 내용 -->
        <div class="form-group">
            <textarea class="form-control c" name="content" rows="8"  placeholder="센텀피아노에서 느낀 바에 대해 솔직하게 평가해주세요!">${reviewUpdate.content}</textarea>
        </div>
<div class="form-group">
    <input type="file" id="reviewImage" name="reviewImage" accept="image/*" multiple/>
    <label class="reviewImageLabel" for="reviewImage">
        <div>사진 첨부하기 ${fn:length(reviewUpdate.imageUrl)}/10</div>
        <div id="previewContainer">
        	<c:if test="${!empty reviewUpdate.imageUrl }">
						<c:forEach var="reviewImage" items="${reviewUpdate.imageUrl}">
							<img src="${path}/displayFile?fileName=${reviewImage}">
						</c:forEach>
					</c:if>
        </div>
    </label>
</div>
<p id="error" style="color: red;"></p> <!-- 오류 메시지를 표시할 요소 -->


        <!-- 작성 완료 버튼 -->
        <input type="submit" value="작성완료" class="form-control btn btn-primary" />
    </form>
</div>

<%@ include file="/WEB-INF/views/MAIN/footer.jsp"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

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

<script>


const fileInput = document.getElementById('reviewImage');
const labelDiv = document.querySelector(".reviewImageLabel div"); // 개수 표시용 div
const previewContainer = document.getElementById('previewContainer'); // 미리보기 컨테이너
const errorMessage = document.getElementById('error'); // 오류 메시지 표시
const maxFiles = 10;

fileInput.addEventListener('change', function() {
    previewContainer.innerHTML = ''; // 이전 미리보기 초기화
    const files = fileInput.files;

    // 파일 수 제한 체크
    if (files.length > maxFiles) {
        errorMessage.textContent = `최대 \${maxFiles}개의 이미지만 선택할 수 있습니다.`;
        fileInput.value = ''; // 선택된 파일 초기화
        labelDiv.textContent = `사진 첨부하기 0/10`; // 초기화 시 텍스트도 리셋
        return; // 추가 진행을 멈춤
    } else {
        errorMessage.textContent = ''; // 오류 메시지 초기화
    }

    for (let i = 0; i < files.length; i++) {
        const file = files[i];
        const reader = new FileReader();

        reader.onload = function(e) {
            const img = document.createElement('img');
            img.src = e.target.result; // 파일의 데이터 URL
            previewContainer.appendChild(img); // 미리보기 추가
        };

        reader.readAsDataURL(file); // 파일 읽기
    }

    // 현재 선택된 파일 개수 표시
    labelDiv.textContent = `사진 첨부하기 \${files.length}/\${maxFiles}`;
});


let ratingupdate = ${reviewUpdate.rating};
const prevRating = document.querySelector(`#star\${ratingupdate}`);
prevRating.checked=true;
updateStarImages();
</script>