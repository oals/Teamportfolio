package com.shop.order.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.cart.dispatcher.Controller;
import com.shop.dto.Shop_Write_CouponDTO;
import com.shop.dto.Shop_Write_OrderDTO;
import com.shop.dto.Shop_Write_P_BoardDTO;
import com.shop.service.Shop_Count_Service;
import com.shop.service.Shop_Select_Service;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class OrderListController implements Controller {
	
	
	Shop_Select_Service shop_Select_Service = Shop_Select_Service.INSTANCE;
	Shop_Count_Service shop_Count_Service = Shop_Count_Service.INSTANCE;
	
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		HttpSession session = req.getSession();
		Map<String, String> map = new HashMap();
		map.put("user_id",(String)session.getAttribute("user_id"));
		
		
		//쿠폰 가져오기
		List<Shop_Write_CouponDTO> coupon_list = shop_Select_Service.Select_Coupon(map);
	
		
		String _section = req.getParameter("pageBlock");
		String _pageNum = req.getParameter("pageNum");
		
		
		int section = Integer.parseInt((_section == null) ? "1" : _section);
		int pageNum = Integer.parseInt((_pageNum == null) ? "1" : _pageNum);
		
		
		map.put("section", Integer.toString(section));
		map.put("pageNum", Integer.toString(pageNum));
		
		
		

		//상품 문의내역 가져오기
		List<Shop_Write_P_BoardDTO> p_board_list = shop_Select_Service.select_user_p_board(map);
		
		//주문정보 가져오기
		List<Shop_Write_OrderDTO> order_list = shop_Select_Service.Select_order_list2(map);
		
		System.out.println(p_board_list);
		
		int p_board_tot = shop_Count_Service.Count_p_board(map);
		int order_tot = shop_Count_Service.Count_order(map);
		
		int totalPage = (int)Math.ceil(order_tot*1.0/10); // 문의
		int totalPageBlock =(int)Math.ceil(totalPage*1.0/10);
		
		
		int totalPage2 = (int)Math.ceil(p_board_tot*1.0/10); // 문의
		int totalPageBlock2 =(int)Math.ceil(totalPage2*1.0/10);
		
		
		int lastPage = 1;
		 for (int i=1; i<=10; i++){
			 // 블럭에 대한 페이지번호 생성
			int endPage = (section-1)*10 + i;
			
			if (endPage <=  totalPage){
				lastPage = i;
			}
		 }
		
		
		
		 int lastPage2 = 1;
		 for (int i=1; i<=10; i++){
			 // 블럭에 대한 페이지번호 생성
			int endPage2 = (section-1)*10 + i;
			
			if (endPage2 <=  totalPage2){
				lastPage2 = i;
			}
		 }
		 
		 
		req.setAttribute("section", section);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("totSection", totalPageBlock);
		req.setAttribute("lastPage", lastPage);
		req.setAttribute("totArticles", order_tot); 
		 
		 
		
		req.setAttribute("section2", section);
		req.setAttribute("pageNum2", pageNum);
		req.setAttribute("totSection2", totalPageBlock2);
		req.setAttribute("lastPage2", lastPage2);
		req.setAttribute("totArticles2", p_board_tot); 
		
		
		
		req.setAttribute("order_list", order_list);     //주문내역
		req.setAttribute("coupon_list", coupon_list);
		req.setAttribute("p_board_list", p_board_list);  //문의
		
		
		//상품 문의 내역 가져오기
		

	
      
		
		return "order/orderList"; // 마이페이지 jsp로 이동
	}
	
	
}
