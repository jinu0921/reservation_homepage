package com.bitc.project.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.project.reservation.vo.lessonVO;

@Controller
@RequestMapping("/lesson")
public class lessonController {
	
	@GetMapping("myInformation")
	public String lesson() {
		return"/lesson/myInformation";
	}
	
	@PostMapping("myInformation")
	public String myInformation(lessonVO lesson,RedirectAttributes rttr) {
		System.out.println(lesson);
		rttr.addFlashAttribute("msg","레슨 신청 성공"+lesson);
		return "redirect:/";
	}
	
	
	
	@GetMapping("myInformation2")
	public void myInformation2() {
		
	}
	
}
