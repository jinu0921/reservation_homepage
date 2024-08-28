package com.bitc.project.room.service;

import com.bitc.project.room.vo.lessonVO;

public interface lessonService {

	/**
	 *  이름 저장
	 * 	@param 이름
	 */
	lessonVO name() throws Exception;
	
	/**
	 *  나이 저장
	 * 	@param 나이
	 */
	lessonVO age() throws Exception;
	
	/**
	 *  자기 수준 정도 저장
	 * 	@param 나이
	 */
	lessonVO myLevel() throws Exception;
	
	/**
	 *  전화번호 저장
	 * 	@param 전화번호
	 */
	lessonVO phoneNum() throws Exception;
	
	/**
	 *  이메일 저장
	 * 	@param email
	 */
	lessonVO email() throws Exception;
	
	/**
	 *  제출
	 * 	@param lessonVO
	 */
	boolean submit() throws Exception;
	
	
}
