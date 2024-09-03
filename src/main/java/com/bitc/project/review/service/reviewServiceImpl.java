package com.bitc.project.review.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bitc.project.review.dao.reviewDAO;
import com.bitc.project.review.util.Criteria;
import com.bitc.project.review.util.PageMaker;
import com.bitc.project.review.vo.reviewVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class reviewServiceImpl {

	private final reviewDAO rd;
	
	public List<reviewVO> getReview(Criteria cri) {
		return rd.getReview(cri);
	}
	public String writeReview(reviewVO vo) {
			int result = rd.writeReview(vo);
			String message = (result == 1) ? "SUCCESS" : "FAILED";
			return message;
	}
	public reviewVO detailReview(int review_num) {
		return rd.detailReveiw(review_num);
	}
	public reviewVO findReviewNum(int review_num) {
		return rd.findReviewNum(review_num);
	}
	public String updateReview(reviewVO rv) {
		int result = rd.updateReview(rv);
		String message = (result == 1) ? "SUCCESS" : "FAILED";
		return message;
	}
	public String deleteReview(reviewVO rv) {
		int result = rd.deleteReview(rv);
		String message = (result == 1) ? "SUCCESS" : "FAILED";
		return message;
	}
	public Object getList(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}
	public PageMaker getPageMaker(Criteria cri) {
		return new PageMaker(cri, rd.Count());
	}
}
