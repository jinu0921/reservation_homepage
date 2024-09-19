package com.bitc.project.loginJoin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String join(loginJoinDTO dto, Model model) throws Exception {
		String msg = ls.memberJoin(dto);
		model.addAttribute("msg", msg);
		if(msg.equals("SUCCESS")) {			
			return "MAIN/main";		
		}
		return "loginJoin/join";		
	}
	
	@PostMapping("login")
	public String login(loginJoinDTO dto, HttpSession s,Model model) throws Exception {
		String msg = ls.memberLogin(dto,s);
		model.addAttribute("msg", msg);
		if(msg.equals("SUCCESS")) {			
			return "MAIN/main";		
		}
		return "loginJoin/login";		
	}
	
	
	@GetMapping("logOut")
	public String logOut(loginJoinDTO dto, HttpSession s) throws Exception {
		s.invalidate();
		return "MAIN/main";
	}

	
}
