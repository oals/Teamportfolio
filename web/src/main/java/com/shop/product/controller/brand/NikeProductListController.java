package com.shop.product.controller.brand;

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
public class NikeProductListController implements Controller {
	
	Shop_Select_Service shop_Select_Service = Shop_Select_Service.INSTANCE;
	Shop_Count_Service shop_Count_Service = Shop_Count_Service.INSTANCE;
	
	
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		
		
		
		
		
		
		
		
		Map<String, String> map = new HashMap<>();
		
		map.put("brand", "나이키");
		
		int tot = shop_Count_Service.Count_brand_product_count(map);
		
		
		int section = 1;
		int pageNum = 1;
		
		int totalPage = (int)Math.ceil(tot*1.0/12); // 리뷰
		int totalPageBlock =(int)Math.ceil(totalPage*1.0/12);
		
	
		 int lastPage = 1;
		 for (int i=1; i<=10; i++){
			 // 블럭에 대한 페이지번호 생성
			int endPage = (section-1)*10 + i;
			
			if (endPage <=  totalPage){
				lastPage = i;
			}
		 }
		 
		 map.put("section", Integer.toString(section));
		 map.put("pageNum", Integer.toString(pageNum));
		 
		List<Shop_Write_ProductDTO> nike_list = shop_Select_Service.select_brand_product(map);
			
			
		
		
		req.setAttribute("section", section);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("totSection", totalPageBlock);
		req.setAttribute("lastPage", lastPage);
		req.setAttribute("totArticles", tot); 
		
		
		
		
		req.setAttribute("nike_list", nike_list);
		
		
		return "product/brand/nikeProductList"; // 나이키 상품 jsp로 이동
	}
	
	
}
