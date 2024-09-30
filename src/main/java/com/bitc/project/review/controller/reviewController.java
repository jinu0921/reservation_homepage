package com.bitc.project.review.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.project.review.service.reviewServiceImpl;
import com.bitc.project.review.util.Criteria;
import com.bitc.project.review.util.PageMaker;
import com.bitc.project.review.vo.reviewVO;

import lombok.RequiredArgsConstructor;

@RequestMapping("review/")
@Controller
@RequiredArgsConstructor
public class reviewController {
	private final reviewServiceImpl rs;
	
	@GetMapping("review_list")
	public void review_list(Criteria cri, Model model) {
		List<reviewVO> rv =  rs.getReview(cri);
		PageMaker pm = rs.getPageMaker(cri);
		model.addAttribute("pm",pm);
		rv = rs.getReviewImage(rv);
		System.out.println("이진우!!"+rv);
		model.addAttribute("reviewList",rv);
		float avgRating = rs.getAvgRating();
		avgRating = (float) (Math.round(avgRating * 100.0) / 100.0);
		model.addAttribute("avgRating",avgRating);
	}
	
	
	
	@GetMapping("review_detail")
	public void review_detail(Model model, int reviewNum, Criteria cri) {
		rs.updateViewCnt(reviewNum);
		model.addAttribute("reviewDetail",rs.detailReview(reviewNum));
		List<reviewVO> rv =  rs.getReview(cri);
		PageMaker pm = rs.getPageMaker(cri);
		model.addAttribute("reviewList",rv);
		model.addAttribute("pm",pm);
	}
	
	
	
	@GetMapping("review_write")
	public String G_review_write(HttpSession s, RedirectAttributes ra) {
		if(s.getAttribute("member")!=null) {
			return "review/review_write";
		}else {
			ra.addFlashAttribute("msg","로그인 후 이용 가능합니다.");
			return "redirect:/review/review_list";
		}
	}
	
	
	
	
	@PostMapping("review_write")
	public String P_review_write(reviewVO rv, HttpSession s, MultipartFile[] reviewImage) throws Exception {
		System.out.println("이진우111"+rv.getReviewNum());
		rv.setContent(rv.getContent().replace("\n", "<br>"));
		rs.writeReview(rv, reviewImage);
		return "redirect:/review/review_list";
	}
	
	
	
	@GetMapping("review_update")
	public String G_review_update(int reviewNum, Model model, HttpSession s, RedirectAttributes ra) {
		reviewVO rv = rs.findReviewNum(reviewNum);
		model.addAttribute("reviewUpdate", rv);
		 return "review/review_update";
	}
	
	@PostMapping("review_update")
	public String P_review_update(reviewVO rv) {
		rs.updateReview(rv);
		return "redirect:/review/review_list";
	}
	
	@PostMapping("review_delete")
	public String P_review_delete(int reviewNum, HttpSession s, Model model, RedirectAttributes ra) {
		reviewVO rv = rs.findReviewNum(reviewNum);
		rs.deleteReview(rv);
		return "redirect:/review/review_list";
	}
}
