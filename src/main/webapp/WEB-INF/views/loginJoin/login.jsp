	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/views/MAIN/header.jsp"%>
	<c:if test="${!empty msg}">
    <script>
        window.onload = function() {
            alert('${msg}');
        }
    </script>
</c:if>
	
	<h1>로그인</h1>
	
		<form method="POST">
		<table>
				<tr>
					<th colspan="2">
						<h1>로그인</h1>
					</th>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" required/></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password" required/></td>
				</tr>
				
				<tr>
					<td colspan="2">
						<label>
							<input type="checkbox" name="rememberme" />
							로그인 정보 저장
						</label>
					</td>
				</tr>
				<tr>
					<td colspan=2>
						<input type="submit" value="로그인" />
						<a href="findIdPw">아이디/비밀번호 찾기</a>
						<a href="join">회원가입하러가기</a> <br><br>
					</td>
				</tr>
			</table>
			
		</form>
	
	<%@ include file="/WEB-INF/views/MAIN/footer.jsp"%>
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        // 쿠키에서 ID와 비밀번호 읽어오기
        const savedId = getCookie("savedId");
        const savedPassword = getCookie("savedPassword");

        if (savedId) {
            $('input[name="id"]').val(savedId);
        }
        
        if (savedPassword) {
            $('input[name="password"]').val(savedPassword);
            $('input[name="rememberme"]').prop("checked", true); // 로그인 정보 저장 체크박스 선택 상태 유지
        }
    });

    function getCookie(name) {
        const nameEQ = name + "=";
        const ca = document.cookie.split(';');
        for (let i = 0; i < ca.length; i++) {
            let c = ca[i];
            while (c.charAt(0) === ' ') c = c.substring(1, c.length);
            if (c.indexOf(nameEQ) === 0) return c.substring(nameEQ.length, c.length);
        }
        return null;
    }
</script>