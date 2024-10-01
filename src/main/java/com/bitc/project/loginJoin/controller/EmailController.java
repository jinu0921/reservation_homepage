package com.bitc.project.loginJoin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitc.project.loginJoin.service.EmailService;

@Controller
public class EmailController {

    @Autowired
    private EmailService emailService;

    @PostMapping("/sendVerificationCode")
    @ResponseBody
    public String sendVerificationCode(@RequestParam String email, HttpSession session, Model model) {
        try {
            String code = emailService.generateVerificationCode(); // 4자리 난수 생성
            emailService.sendVerificationEmail(email, code);       // 이메일 발송
            session.setAttribute("verificationCode", code);        // 세션에 인증 코드 저장
            model.addAttribute("message", "인증 코드가 이메일로 전송되었습니다.");
            return "success"; // 성공
        } catch (Exception e) {
            model.addAttribute("message", "이메일 전송 실패");
            return "error"; // 실패
        }
    }

    @PostMapping("/verifyCode")
    @ResponseBody
    public String verifyCode(@RequestParam String inputCode, HttpSession session, Model model) {
    	System.out.println("verifyCode 메서드 호출됨");
        String storedCode = (String) session.getAttribute("verificationCode");
        if (storedCode != null && storedCode.equals(inputCode)) {
            model.addAttribute("message", "인증이 완료되었습니다.");
            session.removeAttribute("verificationCode");
            return "success"; // 인증성공
        } else {
            model.addAttribute("message", "인증 코드가 일치하지 않습니다.");
            return "error"; // 인증실패
        }
    }
    
    
    
}