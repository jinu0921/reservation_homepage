package com.bitc.project.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.project.reservation.vo.roomVO;

@Controller
@RequestMapping("reservation/")
public class roomController {
	
	@GetMapping("room")
	public String room() {
		return"/reservation/room";
	}
	
	
	@GetMapping("check")
	public String reg(){
		
		return"/reservation/check";
	}
	
	@PostMapping("reservation")
	public String reg(roomVO room,RedirectAttributes rttr){
		
		System.out.println(room);
		rttr.addFlashAttribute("msg","예약 성공"+room);
		
		return"redirect:/reservation/check";
	}
}
