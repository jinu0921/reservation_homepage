package com.bitc.project.room.service;

import com.bitc.project.room.vo.reserveVO;

public interface roomService {
	
	/**
	 * 예약하기
	 * @param 예약할 날짜, 예약된 시간 ,예약자 정보, 예약할 연습실
	 * @return 예약 성공 유뮤 메시지
	 */
	String reservation () throws Exception;
	
	

	/**
	 *  예약 취소
	 *	@param 어떤 예약인지(예약할 날짜, 예약된 시간 ,예약자 정보, 예약할 연습실)
	 * 	@return 예약 삭제 성공 유뮤 메시지
	 */
	String cancel() throws Exception;
	
	
	
	/**
	 *  예약 정보 수정
	 * 	@param 어떤 예약인지(예약할 날짜, 예약된 시간 ,예약자 정보, 예약할 연습실)
	 * 	@return 예약 수정 성공 유뮤 메시지
	 */
	String modify() throws Exception;
	
	
	
	/**
	 *  날짜 지정 후
	 *  예약 가능 날짜, 시간 확인
	 *  @param 날짜, 선택한 연습실
	 *  @return 예약 가능한 시간			현재시간 이후?
	 */
	reserveVO availability() throws Exception;
}
