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

public class Shop_Write_AdminBoardVO {
	private int article_No;
	private String admin_id;
	private String title;
	private String content;
	private Date write_date;
}
