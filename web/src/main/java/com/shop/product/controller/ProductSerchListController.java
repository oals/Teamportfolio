package com.shop.product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.cart.dispatcher.Controller;
import com.shop.dto.Shop_Write_ProductDTO;
import com.shop.service.Shop_Select_Service;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class ProductSerchListController implements Controller {
	
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		Shop_Select_Service shop_Select_Service = Shop_Select_Service.INSTANCE;
		
		String keyword = req.getParameter("keyword");
		System.out.println(keyword);
		
		if(keyword == null || keyword == "") {
			
			req.setAttribute("msg", "검색된 결과가 없습니다.");
		
		} else {
			
			List<Shop_Write_ProductDTO> SearchList = shop_Select_Service.Select_Search_Product(keyword);
			System.out.println(SearchList);
			
			
			if(SearchList == null || SearchList.isEmpty()) {
				req.setAttribute("msg", "검색된 결과가 없습니다.");
				
			} else {
				req.setAttribute("keyword", keyword);
				req.setAttribute("SearchList", SearchList);
				System.out.println(SearchList);
			}
			
		}
		
		return "product/productSerchList"; // 검색결과 jsp로 이동
	}
	
	
}
