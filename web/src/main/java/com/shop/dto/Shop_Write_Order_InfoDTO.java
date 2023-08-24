package com.shop.dto;

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


public class Shop_Write_Order_InfoDTO {

	private int order_num;
	private int product_num;
	private String result;
	private int amount;
	private String name;
	private String address;
}
