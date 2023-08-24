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

public class Shop_Write_CartVO {
	private String user_id;
	private int product_num;
	private String product_name;
	private int amount;
	private String price;
	private String p_size;
	private String imagePath; 
}
