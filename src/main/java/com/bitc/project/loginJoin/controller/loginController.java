package com.bitc.project.loginJoin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public void join() throws Exception {
	}
	
	@PostMapping("join")
	public String join(loginJoinDTO dto, RedirectAttributes rttr) throws Exception {
		String msg = ls.memberJoin(dto);
		rttr.addFlashAttribute("msg", msg);
		if(msg.equals("SUCCESS")) {			
			return "MAIN/main";		
		}
		return "redirect:/";
	}
	
	/**
	@PostMapping("login")
	public String login(loginJoinDTO dto, HttpSession s,Model model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String msg = ls.memberLogin(dto,s);
		model.addAttribute("msg", msg);
		
		if(msg.equals("SUCCESS")) {
			System.out.println("로그인됨 : " + dto.getId());
			String rememberMe = request.getParameter("rememberMe");
			Cookie idCookie = new Cookie("savedId", dto.getId());
			Cookie passwordCookie = new Cookie("savedPassword", dto.getPassword());
			
			idCookie.setMaxAge(7 * 24 * 60 * 60);
			passwordCookie.setMaxAge(7 * 24 * 60 * 60);
			
			idCookie.setPath("/");
			passwordCookie.setPath("/");
			
			response.addCookie(idCookie);
			response.addCookie(passwordCookie);
			return "MAIN/main";		
		}else {
			System.out.println("로그인실패 : " + dto.getId());
		}
		return "loginJoin/login";		
	}
	*/
	
	@PostMapping("login")
	public String login(loginJoinDTO dto, HttpSession s, RedirectAttributes rttr,
	                    HttpServletRequest request, HttpServletResponse response) throws Exception {
	    String msg = ls.memberLogin(dto, s);
	    rttr.addFlashAttribute("msg", msg);
	    
	    if ("SUCCESS".equals(msg)) {
	        System.out.println("로그인됨 : " + dto.getId());
	        
	        // 로그인정보저장 체크여부 확인
	        String rememberMe = request.getParameter("rememberme");
	        if ("on".equals(rememberMe)) {
	            // 로그인 정보 저장을 선택한 경우에만 쿠키생성
	            Cookie idCookie = new Cookie("savedId", dto.getId());
	            Cookie passwordCookie = new Cookie("savedPassword", dto.getPassword()); // 비밀번호를 저장하지 않는 것이 권장됩니다
	            
	            idCookie.setMaxAge(7 * 24 * 60 * 60); 
	            passwordCookie.setMaxAge(7 * 24 * 60 * 60); 
	            
	            idCookie.setPath("/");
	            passwordCookie.setPath("/");
	            
	            // 쿠키 보안 속성 설정
	            idCookie.setHttpOnly(true);
	            passwordCookie.setHttpOnly(true);
	            
	            response.addCookie(idCookie);
	            response.addCookie(passwordCookie);
	        }
	        return "redirect:/";
	    } else {
	        System.out.println("로그인실패 : " + dto.getId());
	    }
	    return "redirect:/";
	}
	
	/**
	 @GetMapping("logOut") public String logOut(loginJoinDTO dto, HttpSession s)
	 throws Exception { s.invalidate(); return "MAIN/main"; }
	 */
	/**
	@GetMapping("logOut")
	public String logOut(HttpSession s, HttpServletResponse response) throws Exception {
		// 로그인세션확인
	    loginJoinDTO user = (loginJoinDTO) s.getAttribute("member");
	    if (user != null) {
	        System.out.println("로그아웃됨 : " + user.getId());
	    }
		
		// 세션 무효화
	    s.invalidate();
	    
	    // 쿠키 삭제
	    Cookie idCookie = new Cookie("savedId", null);
	    Cookie passwordCookie = new Cookie("savedPassword", null);
	    
	    idCookie.setMaxAge(0);
	    passwordCookie.setMaxAge(0);
	    
	    idCookie.setPath("/");
	    passwordCookie.setPath("/");
	    
	    response.addCookie(idCookie);
	    response.addCookie(passwordCookie);
	    
	    return "MAIN/main";
	}
	*/
	
	@GetMapping("logOut")
	public String logOut(HttpSession s, HttpServletResponse response) throws Exception {
	    // 로그인 세션 확인
	    loginJoinDTO user = (loginJoinDTO) s.getAttribute("member");
	    if (user != null) {
	        System.out.println("로그아웃됨 : " + user.getId());
	    }
	    
	    // 세션 무효화
	    s.invalidate();
	    
	    // 쿠키 삭제
	    Cookie idCookie = new Cookie("savedId", null);
	    Cookie passwordCookie = new Cookie("savedPassword", null);
	    
	    idCookie.setMaxAge(0);
	    passwordCookie.setMaxAge(0);
	    
	    idCookie.setPath("/");
	    passwordCookie.setPath("/");
	    
	    // HttpOnly 추가 (보안강화)
	    idCookie.setHttpOnly(true);
	    passwordCookie.setHttpOnly(true);
	    
	    response.addCookie(idCookie);
	    response.addCookie(passwordCookie);
	    
	    return "redirect:/";
	}
	
	
	// 아이디 중복체크 
	@GetMapping("checkId")
	@ResponseBody
	public ResponseEntity<Map<String, Boolean>> checkId(String id) throws Exception {
		System.out.println("test");
		boolean isAvailable = ls.isIdAvailable(id);
		Map<String, Boolean> response = new HashMap<>();
		response.put("available", isAvailable);
		return ResponseEntity.ok(response);
	}
	
	// 아이디 찾기
	@GetMapping("findIdPw")
	public String findIdPw() {
	    return "loginJoin/findIdPw"; 
	}
	@PostMapping("findIdPw")
	public String findIdByNameAndEmail(@RequestParam("uname") String uname, 
	                                   @RequestParam("email") String email, 
	                                   Model model) throws Exception {
	    // 서비스에서 이름과 이메일로 아이디를 찾는 메서드 호출
	    String foundId = ls.findIdByNameAndEmail(uname, email);

	    if (foundId != null) {
	        model.addAttribute("foundId", "찾으신 아이디는: " + foundId);
	    } else {
	        model.addAttribute("foundId", "해당하는 아이디를 찾을 수 없습니다.");
	    }
	    
	    return "loginJoin/findIdPw";
	}
	

	
}
