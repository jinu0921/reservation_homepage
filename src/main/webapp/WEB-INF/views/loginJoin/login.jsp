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
					<td colspan=2>
						<input type="submit" value="로그인" />
					</td>
				</tr>
			</table>
			
		</form>
	
	<%@ include file="/WEB-INF/views/MAIN/footer.jsp"%>