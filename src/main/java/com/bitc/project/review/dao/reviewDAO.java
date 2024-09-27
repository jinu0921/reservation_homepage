package com.bitc.project.review.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.bitc.project.review.util.Criteria;
import com.bitc.project.review.vo.reviewVO;

public interface reviewDAO {

	@Select("SELECT r.review_num, r.title, r.content, r.regdate, r.viewcnt, r.rating, m.nickname FROM review r "
			+ "NATURAL JOIN member m ORDER BY r.review_num DESC LIMIT #{startRow}, #{perPageNum}")
	List<reviewVO> getReview(Criteria cri);
	
	@Select("SELECT AVG(r.rating) FROM review")
	int getavgRating(Criteria cri);
	
	
	@Insert("INSERT INTO review(member_num, title,content,rating) values(#{memberNum},#{title},#{content},#{rating})")
	int writeReview(reviewVO vo);

	@Select("SELECT r.review_num, r.member_num, r.title, r.regdate, r.viewcnt, r.content, r.rating, m.nickname FROM review r "
			+ "NATURAL JOIN member m " + "WHERE r.review_num=#{reviewNum}")
	reviewVO detailReview(int reviewNum);

	@Select("SELECT r.review_num, r.member_num, r.title, r.regdate, r.viewcnt, r.content, r.rating, m.nickname FROM review r "
			+ "NATURAL JOIN member m WHERE review_num=#{reviewNum}")
	reviewVO findReviewNum(int reviewNum);

	@Insert("UPDATE review SET title=#{title}, content=#{content}, rating=#{rating} WHERE review_num=#{reviewNum}")
	int updateReview(reviewVO vo);

	@Delete("DELETE FROM review WHERE review_num =#{reviewNum}")
	int deleteReview(reviewVO rv);

	@Select("SELECT count(*) from review")
	int Count();
}
