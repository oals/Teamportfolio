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

public class Shop_Write_AdminBoardDTO {
	private int article_No;
	private String admin_id;
	private String title;
	private String content;
	private Date write_date;
	
}
