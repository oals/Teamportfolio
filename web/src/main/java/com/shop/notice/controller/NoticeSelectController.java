package com.shop.notice.controller;

import java.sql.Date;
import java.time.LocalDateTime;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.cart.dispatcher.Controller;
import com.shop.dto.Shop_Write_AdminBoardDTO;
import com.shop.dto.Shop_Write_BoardDTO;
import com.shop.dto.Shop_Write_P_BoardDTO;


public class NoticeSelectController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		//article_No=${item.article_No}&admin_id=${item.admin_id}&title=${item.title}&content=${item.content}&write_date=${item.write_date}">${item.title}</a>
		
		
		Shop_Write_AdminBoardDTO shop_Write_AdminBoardDTO = Shop_Write_AdminBoardDTO.builder()
				.article_No(Integer.parseInt(req.getParameter("article_No")))
				.admin_id(req.getParameter("admin_id"))
				.title(req.getParameter("title"))
				.content(req.getParameter("content"))
				.write_date(Date.valueOf(req.getParameter("write_date")))
				.build();
		
		System.out.println(shop_Write_AdminBoardDTO);
		
		req.setAttribute("shop_Write_AdminBoardDTO", shop_Write_AdminBoardDTO);
		
		
		return "notice/noticeView"; // 공지사항, 이벤트 조회 jsp로 이동
	}
}
