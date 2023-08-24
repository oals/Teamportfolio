package com.shop.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class Shop_Write_BoardVO {
	
	private int qna_num;
	private String user_id;
	private String qna_title;
	private String qna_content;
	private String qna_reply;
	private String rep_check;
	private Date write_date;

}
