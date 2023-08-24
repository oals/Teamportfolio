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

public class Shop_Write_CouponDTO {

	private String user_id;
	private String cp_name;
	private int cp_result;
	private String cp_sale;
	private Date cp_expiration;
}
