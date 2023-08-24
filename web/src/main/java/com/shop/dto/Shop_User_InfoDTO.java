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
public class Shop_User_InfoDTO {

	private String user_id;
	private String pw;
	private String nickname;
	private String name;
	private String email;
	private String address;
	private String phone;
	private int point;
	
	
	
}
