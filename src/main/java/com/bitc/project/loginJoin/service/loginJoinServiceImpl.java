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
	
	public String memberJoin(loginJoinDTO dto) throws Exception {
		if(!dao.idDupCheck(dto)) {
		int result = dao.join(dto);
		String message = (result == 1) ? "SUCCESS" : "FAILED";
		return message;
		}else {
			return "아이디 중복입니다.";
		}
	}


	public String memberLogin(loginJoinDTO dto, HttpSession s) throws Exception {
		loginJoinDTO dto2 = dao.login(dto);
		if(dto2!=null) {
		s.setAttribute("member", dto2);
			return "SUCCESS";
		
	}else {
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

}
