<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MAIN/header.jsp"%>

<h1>쪼인</h1>

	<form method="POST">
	<table>
			<tr>
				<th colspan="2">
					<h1>회원가입</h1>
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
				<td>닉네임</td>
				<td><input type="text" name="nickname" required/></td>
			</tr>
			<tr>
				<td colspan=2>
					<input type="submit" value="회원가입" />
				</td>
			</tr>
		</table>
		
	</form>

<%@ include file="/WEB-INF/views/MAIN/footer.jsp"%>