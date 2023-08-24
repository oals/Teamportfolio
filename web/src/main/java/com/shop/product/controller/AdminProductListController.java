package com.shop.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.cart.dispatcher.Controller;
import com.shop.dto.Shop_Write_ProductDTO;
import com.shop.service.Shop_Count_Service;
import com.shop.service.Shop_Select_Service;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class AdminProductListController implements Controller {
	
	Shop_Select_Service shop_Select_Service = Shop_Select_Service.INSTANCE;
	Shop_Count_Service shop_Count_Service = Shop_Count_Service.INSTANCE;
	
	
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		String _section = req.getParameter("pageBlock");
		String _pageNum = req.getParameter("pageNum");
		
		int section = Integer.parseInt((_section == null) ? "1" : _section);
		int pageNum = Integer.parseInt((_pageNum == null) ? "1" : _pageNum);
		
		int tot = shop_Count_Service.Count_product();
		
		int totalPage = (int)Math.ceil(tot*1.0/10); // 소수점이하기 있으면 자리올림(10.1=>11)
		int totalPageBlock =(int)Math.ceil(totalPage*1.0/10);
		
		
		
		 int lastPage = 1;
		 for (int i=1; i<=10; i++){
			 // 블럭에 대한 페이지번호 생성
			int endPage = (section-1)*10 + i;
			
			if (endPage <=  totalPage){
				lastPage = i;
			}
		 }
		
		 

		
		Map<String,String> map = new HashMap<>();
		map.put("section", Integer.toString(section));
		map.put("pageNum", Integer.toString(pageNum));

		
		List<Shop_Write_ProductDTO> list =shop_Select_Service.Select_Product(map);
		
		req.setAttribute("product_info", list);
		req.setAttribute("totArticles", tot);
		req.setAttribute("section", section);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("totSection", totalPageBlock);
			// 페이지 블럭에서 마지막페이지 값 보관
		req.setAttribute("lastPage", lastPage);
		 
		
		
		
		
		
		
		return "product/AdminProductList"; // 상품 리스트(관리자) jsp로 이동
	}
	
	
}
