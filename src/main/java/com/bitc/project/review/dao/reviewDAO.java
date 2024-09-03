package com.bitc.project.review.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.bitc.project.review.util.Criteria;
import com.bitc.project.review.vo.reviewVO;

public interface reviewDAO {

	@Select("SELECT r.review_num, r.title, r.regdate, r.viewcnt, r.rating, m.nickname FROM review r "
			+ "NATURAL JOIN member m ORDER BY r.review_num DESC LIMIT #{startRow}, #{perPageNum}")
	List<reviewVO> getReview(Criteria cri);
	
	@Insert("INSERT INTO review(member_num,title,content,rating) values(#{member_num},#{title},#{content},#{rating})")
	int writeReview(reviewVO vo);

	@Select("SELECT r.review_num, r.title, r.regdate, r.viewcnt, r.content, r.rating, m.nickname FROM review r "
			+ "NATURAL JOIN member m "
			+ "WHERE r.review_num=#{review_num}")
	reviewVO detailReveiw(int review_num);


	
	@Select("SELECT r.review_num, r.member_num, r.title, r.regdate, r.viewcnt, r.content, r.rating, m.nickname FROM review r "
			+ "NATURAL JOIN member m WHERE review_num=#{review_num}" )
	reviewVO findReviewNum(int review_num);

	@Insert("UPDATE review SET title=#{title}, content=#{content}, rating=#{rating} WHERE review_num=#{review_num}")
	int updateReview(reviewVO vo);

	@Delete("DELETE FROM review WHERE review_num =#{review_num}")
	int deleteReview(reviewVO rv);

	@Select("SELECT count(*) from review")
	int Count();
}
