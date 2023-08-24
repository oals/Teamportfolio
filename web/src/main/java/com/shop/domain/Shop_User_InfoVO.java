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
public class Shop_User_InfoVO {

	private String user_id;
	private String pw;
	private String nickname;
	private String name;
	private String email;
	private String address;
	private String phone;
	private int point;
	
	
	
}
