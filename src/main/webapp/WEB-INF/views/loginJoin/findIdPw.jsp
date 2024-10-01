<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MAIN/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<h1>아이디/비밀번호 찾기</h1>

<form method="POST" id="findForm" onsubmit="return handleFind()">
    <table>
        <tr>
            <th colspan="2">
                <h1>아이디/비밀번호 찾기</h1>
            </th>
        </tr>
        <tr>
            <td colspan="2">
                <input type="radio" name="findOption" value="id" checked> 아이디 찾기
                <input type="radio" name="findOption" value="pw"> 비밀번호 찾기
            </td>
        </tr>
        <tr class="findIdFields">
            <td>이름</td>
            <td><input type="text" name="uname" /></td>
        </tr>
        <tr>
            <td>이메일</td>
            <td><input type="email" name="email" /></td>
        </tr>
        <tr class="findPwFields" style="display: none;">
            <td>아이디</td>
            <td><input type="text" name="id" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="찾기" />
                <a href="login">로그인하러가기</a>
            </td>
        </tr>
    </table>
</form>

<div id="verificationSection" style="display: none;">
    <h3>인증 코드 확인</h3>
    <input type="text" id="verificationCode" placeholder="인증 코드 입력" />
    <button type="button" id="verifyCodeBtn">인증완료</button>
</div>

<c:if test="${!empty foundId}">
    <p>찾으신 아이디는: ${foundId}</p>
</c:if>

<%@ include file="/WEB-INF/views/MAIN/footer.jsp"%>

<script>
    $(document).ready(function() {
        // 라디오 버튼 클릭 시 화면 요소 조절
        $('input[name="findOption"]').change(function() {
            if ($(this).val() === 'id') {
                $('.findIdFields').show();
                $('.findPwFields').hide();
            } else {
                $('.findIdFields').hide();
                $('.findPwFields').show();
            }
        });

        // 인증 코드 발송 후 확인 버튼 이벤트
        $('#verifyCodeBtn').click(function() {
            const inputCode = $('#verificationCode').val();

            $.ajax({
                url: '/project/loginJoin/verifyCode',
                type: 'POST',
                data: { inputCode: inputCode },
                success: function(response) {
                    if (response === "success") {
                        alert("인증이 성공적으로 완료되었습니다. 이메일로 비밀번호를 확인해 주세요.");
                    } else {
                        alert("인증 코드가 일치하지 않습니다.");
                    }
                },
                error: function(xhr, status, error) {
                    alert("인증 처리 중 오류가 발생했습니다.");
                }
            });
        });
    });

    function handleFind() {
        const findOption = $('input[name="findOption"]:checked').val();

        if (findOption === 'id') {
            // 아이디 찾기
            return true; // 기본 submit 동작 수행
        } else {
            // 비밀번호 찾기 - 이메일로 인증 코드 발송
            const id = $('input[name="id"]').val();
            const email = $('input[name="email"]').val();

            $.ajax({
                url: '/project/sendVerificationCode',
                type: 'POST',
                data: { email: email },
                success: function(response) {
                    if (response === "success") {
                        alert("인증 코드가 이메일로 전송되었습니다.");
                        $('#verificationSection').show();
                    } else {
                        alert("인증 코드 발송 실패");
                    }
                },
                error: function(xhr, status, error) {
                    alert("오류");
                }
            });

            return false; // 기본 submit 동작 중지
        }
    }
</script>
