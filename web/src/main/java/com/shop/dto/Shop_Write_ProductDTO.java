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


public class Shop_Write_ProductDTO {

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
