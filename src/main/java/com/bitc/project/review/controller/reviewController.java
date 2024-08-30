package com.bitc.project.review.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitc.project.loginJoin.dto.loginJoinDTO;
import com.bitc.project.review.service.reviewServiceImpl;
import com.bitc.project.review.vo.reviewVO;

import lombok.RequiredArgsConstructor;

@RequestMapping("review/")
@Controller
@RequiredArgsConstructor
public class reviewController {
	private final reviewServiceImpl rs;
	
	@GetMapping("review_list")
	public void review_list(Model model) {
		model.addAttribute("reviewList",rs.getReview());
	}
	
	@GetMapping("review_write")
	public String G_review_write(HttpSession s) {
		if(s.getAttribute("member")!=null) {
			return "review/review_write";
		}else {
			System.out.println("로그인해라잉");
			return "redirect:/review/review_list";
		}
	}
	
	@PostMapping("review_write")
	public String P_review_write(reviewVO rv, HttpSession s) {
		System.out.println(rv);	
		System.out.println(rs.writeReview(rv));
		return "redirect:/review/review_list";
	}
	
	
	
}
