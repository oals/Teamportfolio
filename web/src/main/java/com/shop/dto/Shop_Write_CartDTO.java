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

public class Shop_Write_CartDTO {
	private String user_id;
	private int product_num;
	private String product_name;
	private int amount;
	private String price;
	private String p_size;
	private String imagePath;
	
}
