package com.shop.review.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dto.Shop_Write_ReviewDTO;
import com.shop.service.Shop_Count_Service;
import com.shop.service.Shop_Insert_Service;
import com.shop.service.Shop_Select_Service;

import lombok.extern.log4j.Log4j2;
@Log4j2
@WebServlet("/reviewInsert.do")
public class ReviewInsertController extends HttpServlet {

	
	Shop_Insert_Service shop_Insert_Service = Shop_Insert_Service.INSTANCE;
	Shop_Count_Service shop_Count_Service = Shop_Count_Service.INSTANCE;
	Shop_Select_Service shop_Select_Service = Shop_Select_Service.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandler(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandler(req, resp);
	}
	
	protected void doHandler(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		System.out.println("리뷰 쓰기 접근");
		
	Map<String, String > map = new HashMap<>();
		
	System.out.println(map);
	
		Shop_Write_ReviewDTO shop_Write_ReviewDTO = Shop_Write_ReviewDTO.builder()
				.articleNo(shop_Count_Service.Count_review(map))
				.user_id(req.getParameter("user_id"))
				.product_num(Integer.parseInt(req.getParameter("product_num")))
				.content(req.getParameter("content"))
				.imagePath(req.getParameter("imagePath"))
				.build();

		
		System.out.println(shop_Write_ReviewDTO);
		
		//해당 유저 아이디와 상품 번호를 통해서 리뷰를 쓴 기록이 있는지 검사 
		int chk_insert = shop_Select_Service.Select_Review_chk(shop_Write_ReviewDTO);
		System.out.println("권한 체크");
		
		if(chk_insert == 0) {  //리뷰 쓴 기록이 없을 때
			//오류 전송 
			
			int chk = shop_Insert_Service.Write_review(shop_Write_ReviewDTO);  //리뷰 저장
			
			System.out.println(chk);
			map.put("product_num", req.getParameter("product_num"));
			map.put("section", "1");
			map.put("pageNum", "1");
			
			List<Shop_Write_ReviewDTO> list = shop_Select_Service.Select_Review(map);
			System.out.println(list);
			System.out.println("------0------");
			
			
			if(chk == 1) { //리뷰 쓰기 권한이 없을 때
				out.print("false");
				
			}else {
				
				String data = "";
				for(int i = 0; i<list.size(); i++) {
						data += 
				 "<div class='m-3'>"
	            +"<div class='row'>"
	               + "<input type='text' class='review_text' value='"+ list.get(i).getContent() +"'readonly>"
	             + "</div>"
	             + "<div class='mt-3'>"
	               + "<input type='text' value='"+list.get(i).getUser_id() +"' class='review_text' style='font-size: 0.8em; color: gray;' readonly>"
	             + "<input type='text' value='" + list.get(i).getWrite_date() + "' class='review_text' style='font-size: 0.8em; color: gray;' readonly>"
	             
	             
	             + "</div>"
	            + "</div>"
	            + "<hr>";
	            }
	            
	           out.print(data);
	           
	           
				
			}
			
			
		}else { //기록이 있을 때
			
			
			out.print("chk_false");
			
			
		}
		
		
		
		
		
	}
}
