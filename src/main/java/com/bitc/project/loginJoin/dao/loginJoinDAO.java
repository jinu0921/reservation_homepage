package com.bitc.project.loginJoin.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.bitc.project.loginJoin.dto.loginJoinDTO;


public interface loginJoinDAO {

	@Insert(" INSERT INTO member(id, password, nickname)"
			+ " 	values(#{id}, #{password}, #{nickname})")
	int join(loginJoinDTO dto) throws Exception;
	
	@Select("SELECT EXISTS (SELECT * FROM member"
			+ " 	where id = #{id})")
	boolean idDupCheck(loginJoinDTO dto) throws Exception;
	
	@Select(" SELECT * FROM member"
			+ " 	where id = #{id} AND password = #{password}")
	loginJoinDTO login(loginJoinDTO dto) throws Exception;
}
