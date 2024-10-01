package com.bitc.project.loginJoin.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.bitc.project.loginJoin.dto.loginJoinDTO;


public interface loginJoinDAO {

	@Insert(" INSERT INTO member(id, password, uname, email, phone, address)"
			+ " 	values(#{id}, #{password}, #{uname}, #{email}, #{phone}, #{address})")
	int join(loginJoinDTO dto) throws Exception;
	
	/*
	 * @Select("SELECT EXISTS (SELECT * FROM member" + " 	where id = #{id})")
	 * boolean idDupCheck(loginJoinDTO dto) throws Exception;
	 */
	
	@Select("SELECT COUNT(*) FROM member WHERE id = #{id}")
	int idDupCheck(loginJoinDTO dto) throws Exception;
	
	@Select(" SELECT * FROM member"
			+ " 	where id = #{id} AND password = #{password}")
	loginJoinDTO login(loginJoinDTO dto) throws Exception;
	
	// 아이디찾기
	@Select("SELECT id FROM member WHERE uname = #{uname} AND email = #{email}")
	String findIdByNameAndEmail(@Param("uname") String uname, @Param("email") String email) throws Exception;

	
}
