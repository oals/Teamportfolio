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
public class Shop_Write_sell_tableDTO {
	
	private int sell_num;
	private String user_id;
	private int product_num;
	private String product_name;
	private int order_num;
	private String result;
	private Date indate;
}
