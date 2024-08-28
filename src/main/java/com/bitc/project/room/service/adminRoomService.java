package com.bitc.project.room.service;

import java.util.List;

import com.bitc.project.room.vo.reserveVO;

public interface adminRoomService {
	
	
	/**	
	 *  모든 예약 정보 조회
	 * 	
	 */
	List<reserveVO> viewAll() throws Exception;
	
	/**
	 *	대기중인
	 *  모든 예약 정보 조회
	 * 
	 */
	List<reserveVO> viewWaitingReservation() throws Exception;
	
	/**
	 * 	예약 취소
	 * 
	 */
	String cancel() throws Exception;
	
	/**
	 *  예약 승인 시
	 *  예약 상태 true로 반환
	 *  
	 */
	boolean approval()throws Exception;
	
	/**
	 *  111111
	 * 
	 */
	
	
	/**
	 *  111111
	 * 
	 */
	
	
	/**
	 *  111111
	 * 
	 */
	
}
