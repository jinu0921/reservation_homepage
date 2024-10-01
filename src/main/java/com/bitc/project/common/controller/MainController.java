package com.bitc.project.common.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	
	@RequestMapping("/comehere/direction")
	public void direction() {
	}
	
	@GetMapping("/lesson/lesson")
	public void lessonReg() {
	}
	
	@RequestMapping("information/inform")
	public void inform() {
	}

	
	@RequestMapping("review/review_list")
	public void review() {
	}
	
	@RequestMapping("roomReg/room")
	public void room() {
	}
	
}
