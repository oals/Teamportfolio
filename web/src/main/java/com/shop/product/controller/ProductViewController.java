package com.shop.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.cart.dispatcher.Controller;
import com.shop.dto.Shop_Write_P_BoardDTO;
import com.shop.dto.Shop_Write_ProductDTO;
import com.shop.dto.Shop_Write_ReviewDTO;
import com.shop.service.Shop_Count_Service;
import com.shop.service.Shop_Select_Service;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class ProductViewController implements Controller {
	
	Shop_Select_Service shop_Select_Service = Shop_Select_Service.INSTANCE;
	Shop_Count_Service shop_Count_Service = Shop_Count_Service.INSTANCE;
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		
		System.out.println("상품 보기 접근");
		//클릭한 상품에 대한 리뷰와 상품문의 글 가져오기
		String product_name = req.getParameter("product_name");
		System.out.println(product_name);
		
		HttpSession session = req.getSession();
		String user_id = (String)session.getAttribute("user_id");   //수정 필요
		Map<String, String> map = new HashMap<>();
		
		

		
		map.put("product_name", product_name);
		map.put("user_id", user_id);
		System.out.println("1");
		
		Shop_Write_ProductDTO shop_Write_ProductDTO = shop_Select_Service.select_find_product(map);
		
		System.out.println("2000-00---");
		System.out.println(map);
		
		map.put("product_num",Integer.toString(shop_Write_ProductDTO.getProduct_num()));
		int review_tot = shop_Count_Service.Count_review(map);
		int p_board_tot = shop_Count_Service.Count_p_board2(map);
		
		System.out.println("asdasd" + p_board_tot);
		
		int section = 1;
		int pageNum = 1;
		
		int totalPage = (int)Math.ceil(review_tot*1.0/4); // 리뷰
		int totalPageBlock =(int)Math.ceil(totalPage*1.0/4);
		
	
		 int lastPage = 1;
		 for (int i=1; i<=10; i++){
			 // 블럭에 대한 페이지번호 생성
			int endPage = (section-1)*10 + i;
			
			if (endPage <=  totalPage){
				lastPage = i;
			}
		 }
		 	System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println(section);
		System.out.println(pageNum);
		System.out.println(totalPageBlock);
		System.out.println(lastPage);
		System.out.println(review_tot);
		
		req.setAttribute("section", section);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("totSection", totalPageBlock);
		req.setAttribute("lastPage", lastPage);
		req.setAttribute("totArticles", review_tot); 
		
		

		map.put("section", "1");
		map.put("pageNum", "1");	
		List<Shop_Write_ReviewDTO> review_list = shop_Select_Service.Select_Review(map);
		List<Shop_Write_P_BoardDTO> p_board_list = shop_Select_Service.Select_P_Board(map);
		System.out.println(p_board_list);
		
		
		
		int totalPage2 = (int)Math.ceil(p_board_tot*1.0/4); // 문의
		int totalPageBlock2 =(int)Math.ceil(totalPage2*1.0/4);
		
		
		 int lastPage2 = 1;
		 for (int i=1; i<=10; i++){
			 // 블럭에 대한 페이지번호 생성
			int endPage2 = (section-1)*10 + i;
			
			if (endPage2 <=  totalPage2){
				lastPage2 = i;
			}
		 }
		 
		req.setAttribute("section2", section);
		req.setAttribute("pageNum2", pageNum);
		req.setAttribute("totSection2", totalPageBlock2);
		req.setAttribute("lastPage2", lastPage2);
		req.setAttribute("totArticles2", p_board_tot); 
		
		
		
		
		
		
		req.setAttribute("user_id", user_id);
		req.setAttribute("review", review_list);
		req.setAttribute("p_board", p_board_list);
		req.setAttribute("product_info", shop_Write_ProductDTO);
		
		
		
		return "product/productView"; // 상세 페이지 jsp로 이동
	}
}
