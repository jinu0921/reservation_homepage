package com.bitc.project.review.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bitc.project.review.dao.reviewDAO;
import com.bitc.project.review.util.Criteria;
import com.bitc.project.review.util.FileUtils;
import com.bitc.project.review.util.PageMaker;
import com.bitc.project.review.vo.reviewVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class reviewServiceImpl {

	private final reviewDAO rd;

	private final String uploadDir;

	public List<reviewVO> getReview(Criteria cri) {
		return rd.getReview(cri);
	}

	public String writeReview(reviewVO vo, MultipartFile[] reviewImage) throws Exception {
		int result = 0;
		result = rd.writeReview(vo);
		if (reviewImage != null) {
			for (MultipartFile ri : reviewImage) {
				if (!ri.isEmpty()) {
					String u_profile = FileUtils.uploadFile(uploadDir, ri);
					System.out.println(rd.getRecentReviewNum());
					rd.uploadReviewImage(rd.getRecentReviewNum(), u_profile);

				}
			}
		}
		String message = (result == 1) ? "SUCCESS" : "FAILED";
		return message;
	}

	public reviewVO detailReview(int reviewNum) {
		return rd.detailReview(reviewNum);
	}

	public reviewVO findReviewNum(int reviewNum) {
		return rd.findReviewNum(reviewNum);
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

	public float getAvgRating() {
		return rd.getavgRating();
	}

	public void updateViewCnt(int reviewNum) {
		rd.updateViewCnt(reviewNum);
	}

	public List<reviewVO> getReviewImage(List<reviewVO> rv) {
		List<reviewVO> newRv = new ArrayList<>();
		for(reviewVO rvList : rv) {
			List<String> ImageUrl = rd.getImageUrl(rvList.getReviewNum());
	        if (ImageUrl == null) {
	            ImageUrl = new ArrayList<>();
	        }
			rvList.setImageUrl(ImageUrl);
			newRv.add(rvList);
		}
		return newRv;
		
	}
}
