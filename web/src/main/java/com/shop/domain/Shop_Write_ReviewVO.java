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

public class Shop_Write_ReviewVO {
	
	private int articleNo;
	private String user_id;
	private int product_num;
	private String content;
	private String imagePath;
	private Date write_date;

}
