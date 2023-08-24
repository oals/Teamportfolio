package com.shop.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.cart.dispatcher.Controller;
import com.shop.dto.Shop_Write_ProductDTO;
import com.shop.service.Shop_Count_Service;
import com.shop.service.Shop_Insert_Service;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class ProductInsertController implements Controller {
	
	Shop_Insert_Service shop_Insert_Service = Shop_Insert_Service.INSTANCE;
	Shop_Count_Service shop_Count_Service = Shop_Count_Service.INSTANCE;
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {

		String gender = req.getParameter("gender");
		String product_brand = req.getParameter("product_brand");

		
		System.out.println(product_brand);  //1 2 3 4 5 값에 따라서 등록
		
		System.out.println("접근");
		
		if(product_brand.equals("1")) {
			product_brand = "나이키";
		}else if(product_brand.equals("2")) {
			product_brand = "아디다스";
		}else if(product_brand.equals("3")) {
			product_brand = "뉴발란스";
		}else if(product_brand.equals("4")) {
			product_brand = "퓨마";
		}else if(product_brand.equals("5")) {
			product_brand = "컨버스";
		}else {
			product_brand = "오류";
			System.out.println("접근 오류");
		}
		
		if(gender.equals("1")) {
			gender="남성";
		}else if(gender.equals("2")) {
			gender="여성";
		}else {
			gender = "오류";
		}
		
		
		
		Shop_Write_ProductDTO shop_Write_ProductDTO = Shop_Write_ProductDTO.builder()
				.product_num(shop_Count_Service.Count_product())
				.product_brand(product_brand)
				.product_name(req.getParameter("product_name"))
				.gender(gender)
				.price(req.getParameter("price"))
				.description(req.getParameter("description"))
				.imagePath(req.getParameter("imagePath"))
				.in_count(Integer.parseInt(req.getParameter("in_count")))
				.build();
		
		
		System.out.println(shop_Write_ProductDTO);
		shop_Insert_Service.Write_Product(shop_Write_ProductDTO);
		
		
		
		return "admin_productList.do"; // 상품 등록 후 상품 리스트로 이동
	}
}
