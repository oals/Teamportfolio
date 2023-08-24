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

public class Shop_Write_CouponVO {

	private String user_id;
	private String cp_name;
	private int cp_result;
	private String cp_sale;
	private Date cp_expiration;
}
