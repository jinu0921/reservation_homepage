package com.bitc.project.review.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.project.review.util.Criteria;
import com.bitc.project.review.vo.reviewVO;

public interface reviewDAO {

	@Select("SELECT r.review_num, r.title, r.content, r.regdate, r.viewcnt, r.rating, m.uname FROM review r "
			+ "NATURAL JOIN member m ORDER BY r.review_num DESC LIMIT #{startRow}, #{perPageNum}")
	List<reviewVO> getReview(Criteria cri);
	
	@Select("SELECT AVG(rating) FROM review")
	Float getavgRating();
	
	
	@Insert("INSERT INTO review(member_num, title,content,rating) values(#{memberNum},#{title},#{content},#{rating})")
	int writeReview(reviewVO vo);

	@Select("SELECT r.review_num, r.member_num, r.title, r.regdate, r.viewcnt, r.content, r.rating, m.uname FROM review r "
			+ "NATURAL JOIN member m " + "WHERE r.review_num=#{reviewNum}")
	reviewVO detailReview(int reviewNum);

	@Select("SELECT r.review_num, r.member_num, r.title, r.regdate, r.viewcnt, r.content, r.rating, m.uname FROM review r "
			+ "NATURAL JOIN member m WHERE review_num=#{reviewNum}")
	reviewVO findReviewNum(int reviewNum);

	@Insert("UPDATE review SET title=#{title}, content=#{content}, rating=#{rating} WHERE review_num=#{reviewNum}")
	int updateReview(reviewVO vo);

	@Delete("DELETE FROM review WHERE review_num =#{reviewNum}")
	int deleteReview(reviewVO rv);

	@Select("SELECT count(*) from review")
	int Count();

	@Update("UPDATE review SET viewcnt=viewcnt+1 WHERE review_num=#{reviewNum}")
	void updateViewCnt(int reviewNum);

	
	@Insert("INSERT INTO review_images(review_num, image_url) VALUES(#{reviewNum}, #{u_profile})")
	int uploadReviewImage(@Param("reviewNum") int reviewNum, @Param("u_profile") String u_profile);
	
	@Select("SELECT review_num FROM review ORDER BY regdate DESC LIMIT 1")
	int getRecentReviewNum();

	@Select("SELECT image_url from review_images WHERE review_num=#{reviewNum}")
	List<String> getImageUrl(int reviewNum);

}
