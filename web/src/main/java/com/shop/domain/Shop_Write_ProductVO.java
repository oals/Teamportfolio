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


public class Shop_Write_ProductVO {

	private int product_num;
	private String product_name;
	private String product_brand;
	private String gender;
	private String price;
	private String description;
	private String imagePath;
	private int in_count;
	private int point;
	
}
