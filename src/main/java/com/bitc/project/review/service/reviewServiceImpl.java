package com.bitc.project.review.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bitc.project.review.dao.reviewDAO;
import com.bitc.project.review.vo.reviewVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class reviewServiceImpl {

	private final reviewDAO rd;
	
	public List<reviewVO> getReview() {
		return rd.getReview();
	}
	public String writeReview(reviewVO vo) {
			int result = rd.writeReview(vo);
			String message = (result == 1) ? "SUCCESS" : "FAILED";
			return message;
	}
}
