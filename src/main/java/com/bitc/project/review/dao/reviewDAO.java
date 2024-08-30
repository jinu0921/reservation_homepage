package com.bitc.project.review.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.bitc.project.review.vo.reviewVO;

public interface reviewDAO {

	@Select("SELECT r.review_num, r.title, r.regdate, r.viewcnt, r.rating, m.nickname FROM review r "
			+ "NATURAL JOIN member m")
	List<reviewVO> getReview();
	
	@Insert("INSERT INTO review(member_num,title,content,rating) values(#{member_num},#{title},#{content},#{rating})")
	int writeReview(reviewVO vo); 
}
