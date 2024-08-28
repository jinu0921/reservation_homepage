package com.bitc.project.room.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/lesson")
public class lessonController {
	
	@RequestMapping("name")
	public String lesson() {
		return"/lessonReg/name";
	}
	
	
}
