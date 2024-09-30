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
	
	@RequestMapping("/lessonReg/lesson")
	public void lessonReg() {
	}
	
	@RequestMapping("information/inform")
	public void inform() {
	}
	
	@RequestMapping("lesson")
	public String lesson() {
		return"/lessonReg/lesson";
	}
	
	@RequestMapping("review/review_list")
	public void review() {
	}
	
	@RequestMapping("roomReg/room")
	public void room() {
	}
	
}
