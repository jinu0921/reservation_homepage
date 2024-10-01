<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MAIN/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<c:if test="${!empty msg}">
    <script>
        window.onload = function() {
            alert('${msg}');
        }
    </script>
</c:if>

<h1>쪼인</h1>

<form method="POST" onsubmit="return validateForm()">
    <table>
        <tr>
            <th colspan="2">
                <h1>회원가입</h1>
            </th>
        </tr>
        <tr>
            <td>아이디</td>
            <td>
                <input type="text" name="id" required />
                <button type="button" id="checkIdBtn">중복확인</button>
            </td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="password" required /></td>
        </tr>
        <tr>
            <td>비밀번호확인</td>
            <td><input type="password" name="re_pw" required /></td>
        </tr>
        <tr>
        <tr>
            <td>이름</td>
            <td><input type="text" name="uname" required /></td>
        </tr>
        <tr>
            <td>이메일</td>
            <td>
                <input type="text" name="email" required />
                <button type="button" id="sendEmailBtn">인증코드받기</button>
                <div class="result"></div>
                <div id="emailCodeWrap" style="display: none;">
                    <input type="text" id="emailCode" placeholder="인증 코드를 입력하세요" />
                    <button type="button" id="emailAcceptBtn">인증완료</button>
                </div>
            </td>
        </tr>
        <tr>
            <td>휴대폰번호</td>
            <td><input type="text" name="phone" required></td>
        </tr>
        <tr>
            <td>주소</td>
            <td><input type="text" name="address" required></td>
        </tr>
        <tr>
            <td colspan=2>
                <input type="submit" value="회원가입" />
            </td>
        </tr>
    </table>
</form>

<%@ include file="/WEB-INF/views/MAIN/footer.jsp"%>

<script>
    $(document).ready(function() {
        // 아이디 중복 확인
        $('#checkIdBtn').click(function() {
            const id = $('input[name="id"]').val();
            if (!id) {
                alert("아이디를 입력해주세요.");
                return;
            }

            $.ajax({
                url: '/project/loginJoin/checkId',
                type: 'GET',
                data: { id: id },
                success: function(response) {
                    console.log("Response: ", response); // 응답 결과를 콘솔에 출력
                    if (response.available) {
                        alert("사용 가능한 아이디입니다.");
                    } else {
                        alert("이미 사용 중인 아이디입니다.");
                    }
                },
                error: function(xhr, status, error) {
                    console.error("AJAX 요청 오류:", xhr, status, error); // 오류 내용을 콘솔에 출력
                    alert("아이디 중복 체크 실패");
                }
            });
        });

     // 이메일 인증 코드 전송
        $('#sendEmailBtn').click(function() {
            const email = $('input[name="email"]').val();
            if (!email) {
                alert("이메일을 입력해주세요.");
                return;
            }

            $.ajax({
                url: '/project/sendVerificationCode',
                type: 'POST',
                data: { email: email },
                success: function(response) {
                    alert("인증 코드가 이메일로 전송되었습니다.");
                    console.log("인증 코드 전송 성공:", response); // 성공 메시지 콘솔에 출력
                    $("#emailCodeWrap").show(); // 인증 코드 입력창 표시
                },
                error: function(xhr, status, error) {
                    console.error("인증 코드 전송 오류:", xhr, status, error); // 오류 내용을 콘솔에 출력
                    alert("인증 코드 전송 실패");
                }
            });
        });

        // 인증 코드 확인
        $('#emailAcceptBtn').click(function() {
            const inputCode = $('#emailCode').val();
            if (!inputCode) {
                alert("인증 코드를 입력해주세요.");
                return;
            }

            $.ajax({
                url: '/project/verifyCode',
                type: 'POST',
                data: { inputCode: inputCode },
                success: function(response) {
                	if (response === "success") {
	                    alert("인증 성공!");
	                    console.log("인증 성공"); // 성공 메시지 콘솔에 출력
	                    console.log("인증 성공:", response); // 성공 메시지 콘솔에 출력
	                    $('#emailCodeWrap').hide(); // 인증 성공 시 입력창 숨김 처리
	                }else {
	                    alert("인증 코드가 일치하지 않습니다. 다시 시도해주세요.");
	                    console.error("인증 실패:", response); // 오류 내용을 콘솔에 출력
	                }
                },
                error: function(xhr, status, error) {
                    console.error("인증 오류:", xhr, status, error); // 오류 내용을 콘솔에 출력
                    alert("인증 오류");
                }
            });
        });
    });

    // password <-> re_pw 일치여부 
	function validateForm() {
		const passwordField = document.querySelector('input[name="password"]');
        const rePasswordField = document.querySelector('input[name="re_pw"]');

        if (passwordField.value !== rePasswordField.value) {
            alert("비밀번호가 일치하지 않습니다.");
            passwordField.value = ""; 
            rePasswordField.value = ""; 
            passwordField.focus();
            return false; 
        }
        return true;
    }
</script>