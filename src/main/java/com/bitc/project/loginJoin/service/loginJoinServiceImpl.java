package com.bitc.project.loginJoin.service;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.bitc.project.loginJoin.dao.loginJoinDAO;
import com.bitc.project.loginJoin.dto.loginJoinDTO;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class loginJoinServiceImpl{


	private final loginJoinDAO dao;
	
	/*
	 * public String memberJoin(loginJoinDTO dto) throws Exception {
	 * if(!dao.idDupCheck(dto)) { int result = dao.join(dto); String message =
	 * (result == 1) ? "SUCCESS" : "FAILED"; return message; }else { return
	 * "아이디 중복입니다."; } }
	 */
	
	public String memberJoin(loginJoinDTO dto) throws Exception {
	    // idDupCheck가 0일 경우 중복되지 않은 것으로 판단
	    if(dao.idDupCheck(dto) == 0) {
	        int result = dao.join(dto);
	        String message = (result == 1) ? "SUCCESS" : "FAILED";
	        return message;
	    } else {
	        return "아이디 중복입니다.";
	    }
	}


	public String memberLogin(loginJoinDTO dto, HttpSession s) throws Exception {
		loginJoinDTO dto2 = dao.login(dto);
		if (dto2 != null) {
			s.setAttribute("member", dto2);
			return "SUCCESS";
		} else {
			return "FAILED";
		}
	}

	public boolean memberUpdate(loginJoinDTO dto) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean memberDelete(loginJoinDTO dto) {
		// TODO Auto-generated method stub
		return false;
	}


	/*
	 * public boolean isIdAvailable(String id) throws Exception { loginJoinDTO dto =
	 * new loginJoinDTO(); dto.setId(id); return dao.idDupCheck(dto); // 아이디 중복체크 }
	 */
	 
	public boolean isIdAvailable(String id) throws Exception {
	    loginJoinDTO dto = new loginJoinDTO();
	    dto.setId(id);
	    
	    int count = dao.idDupCheck(dto); 
	    System.out.println("ID 중복 체크 결과: " + count); 
	    
	    return count == 0; // 중복되지 않은 경우 true, 중복된 경우 false 
	}


	// 아이디 찾기
	public String findIdByNameAndEmail(String uname, String email) throws Exception {
		
	    return dao.findIdByNameAndEmail(uname, email);
	}


	
}
