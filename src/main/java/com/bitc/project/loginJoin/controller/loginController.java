package com.bitc.project.loginJoin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitc.project.loginJoin.dto.loginJoinDTO;
import com.bitc.project.loginJoin.service.loginJoinServiceImpl;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("loginJoin/")
@RequiredArgsConstructor
public class loginController {

	private final loginJoinServiceImpl ls;
	
	@GetMapping("login")
	public void login() throws Exception {}
	
	@GetMapping("join")
	public void join() throws Exception {}
	
	@PostMapping("join")
	public String join(loginJoinDTO dto) throws Exception {
		System.out.println(ls.memberJoin(dto));
		return "loginJoin/login";
		
	}
	
	@PostMapping("login")
	public String login(loginJoinDTO dto, HttpSession s) throws Exception {
		System.out.println(ls.memberLogin(dto, s));
		return "MAIN/main";
	}
	
	@GetMapping("logOut")
	public String logOut(loginJoinDTO dto, HttpSession s) throws Exception {
		s.invalidate();
		return "MAIN/main";
	}

	
}
