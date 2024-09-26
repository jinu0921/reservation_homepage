package com.bitc.project.mainPage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitc.project.HomeController;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping("/comehere/direction")
	public void direction() {
	}
	
	@RequestMapping("inform")
	public String inform() {
		return"/information/inform";
	}
	
	@RequestMapping("lesson")
	public String lesson() {
		return"/lessonReg/lesson";
	}
	
	@RequestMapping("review_list")
	public String review() {
		return"/review/review_list";
	}
	
	@RequestMapping("room")
	public String room() {
		return"/roomReg/room";
	}
	
}
