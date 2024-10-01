package com.bitc.project.common.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	
	int memberNum;
	String id;
	String password;
	String uname;
	String phone;
	Date join_date;
	String email;
	String address;
	int points;
}
