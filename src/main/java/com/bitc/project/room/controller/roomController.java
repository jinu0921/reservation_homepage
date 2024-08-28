package com.bitc.project.room.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("roomReg/")
public class roomController {
	
	@GetMapping("room")
	public String room() {
		return"/roomReg/room";
	}
	
	
	@GetMapping("check")
	public String reg(){
		
		return"/roomReg/check";
	}
	
	@PostMapping("reg")
	public String reg(RedirectAttributes rttr){
		
		rttr.addFlashAttribute("msg","예약 성공");
		
		return"redirect:/roomReg/check";
	}
}
