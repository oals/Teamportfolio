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

public class Shop_Write_OrderVO {

	private int order_num;
	private String user_id;
	private int product_num;
	private String product_name;
	private String product_opt;
	private String result;
	private Date indate;
	
}
