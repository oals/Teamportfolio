package com.shop.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString

public class Shop_Write_ReviewDTO {
	
	private int articleNo;
	private String user_id;
	private int product_num;
	private String content;
	private String imagePath;
	private Date write_date;
	
}

