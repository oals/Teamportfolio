package com.shop.domain;

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


public class Shop_Write_Order_InfoVO {

	private int order_num;
	private int product_num;
	private String result;
	private int amount;
	private String name;
	private String address;
}
