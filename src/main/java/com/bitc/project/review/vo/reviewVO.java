package com.bitc.project.review.vo;

import java.util.Date;

import lombok.Data;

@Data
public class reviewVO {
		private int member_num;
		private int review_num;
		private String title;
		private String content;
		private Date regdate;
		private int viewcnt;
		private int Rating;
		private String nickname;
	}
