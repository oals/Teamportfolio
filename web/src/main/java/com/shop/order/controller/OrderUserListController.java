package com.shop.order.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.shop.dto.Shop_Write_OrderDTO;
import com.shop.dto.Shop_Write_P_BoardDTO;
import com.shop.service.Shop_Count_Service;
import com.shop.service.Shop_Select_Service;

@WebServlet("/OrderUserList.do")
public class OrderUserListController extends HttpServlet{
	
	Shop_Select_Service shop_Select_Service = Shop_Select_Service.INSTANCE;
	Shop_Count_Service shop_Count_Service = Shop_Count_Service.INSTANCE;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doHandler(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandler(req, resp);
	}
	
	protected void doHandler(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
System.out.println("마이페이지 주문 정보 접근 테스트");
		
		
		String user_id = req.getParameter("user_id");
		String _section = req.getParameter("pageBlock");
		String _pageNum = req.getParameter("pageNum");
		
		System.out.println("section원본값 : "+_section);
		
		int section = Integer.parseInt((_section == null) ? "1" : _section);
		int pageNum = Integer.parseInt((_pageNum == null) ? "1" : _pageNum);
		
		
		Map<String, String> map = new HashMap();
		map.put("user_id", user_id);
		map.put("section", Integer.toString(section));
		map.put("pageNum", Integer.toString(pageNum));
		
		
		int order_count = shop_Count_Service.Count_order(map);
		
		System.out.println(order_count);
		System.out.println("-------");
		
		
		int totalPage = (int)Math.ceil(order_count*1.0/10); // 문의
		int totalPageBlock =(int)Math.ceil(totalPage*1.0/10);
		
		
		
		
		List<Shop_Write_OrderDTO> p_board_list = shop_Select_Service.Select_order_list2(map);
		
		
		
		 int lastPage = 1;
		 for (int i=1; i<=10; i++){
			 // 블럭에 대한 페이지번호 생성
			int endPage = (section-1)*10 + i;
			
			if (endPage <=  totalPage){
				lastPage = i;
			}
		 }

				// 페이지 블럭에서 마지막페이지 값 보관
			 
		 
		 //map 안에 jsonobject 값 그리고 section 등 값들 넣어서 전달 ?
		 
		 
		 JSONObject jsonObject;
		 JSONArray sendArray = new JSONArray();
		 JSONArray sendArray2 = new JSONArray();
		 JSONObject jsonObject2 = new JSONObject();
		 JSONObject jsonObject3 = new JSONObject();
		
		 resp.setContentType("text/html;charset=utf-8");  //먼저 선언 해야
		 PrintWriter out = resp.getWriter();
			
		 for(int i = 0; i < 5; i++) {
			 jsonObject = new JSONObject();
			 
			 jsonObject.put("articleNo", p_board_list.get(i).getOrder_num());
			 jsonObject.put("product_num", p_board_list.get(i).getProduct_num());
			 jsonObject.put("product_name", p_board_list.get(i).getProduct_name());
			 jsonObject.put("product_opt", p_board_list.get(i).getProduct_opt());
			 jsonObject.put("result", p_board_list.get(i).getResult());
			 jsonObject.put("user_id",p_board_list.get(i).getUser_id());
			 jsonObject.put("order_num",p_board_list.get(i).getOrder_num());
			 
		
			 System.out.println("---------");
			 System.out.println(jsonObject);
			 sendArray.add(jsonObject);
		 }		
		 
		 
		
		 
		 
		 System.out.println( "pageNum : "+ pageNum);
		 System.out.println( "lastpage : "+ lastPage);
		 System.out.println("section : "+ section);
		 System.out.println("totsection : " + totalPageBlock);
		 
		 
		 String data = 
				 "<nav aria-label='...'>"
		                    +"<ul class='pagination'>";
						 
		                    for(int i = 1; i <= lastPage; i++) {
		                       			if(section >1 && i == 1) {
		                       				data += "<li class='page-item '>"
						                        	+"<a class='page-link' id='prev' name='prev' onclick=order_page(" + (section -1) +"," + i + "," + 2 +") > 이전 </a>"
						                     	+"</li>";
		                       			};
				                     	
				                	if(i == pageNum) {
				                		
				                		 data +="<li class='page-item  disabled' aria-current='page'>"
							                      	+"<a class='page-link' id='${page}' onclick=order_page(" +  (section) +"," + i + "," + ")>" + ((section-1)*10 + i) + "</a>"
							                     +"</li>";
				                	}else {
				                		data +=  "<li class='page-item '>"
					   	                    	+"<a class='page-link' id='${page}' onclick=order_page(" +  (section) +"," + i + "," +  ")>" + ((section-1)*10 + i) + "</a>"
							                     +"</li>";
				                	}
		                    };
		   	                    	 
		                    			if(section < totalPageBlock) {
		                    			data += "<li class='page-item'>"
		        			                  	+"<a class='page-link' id='next' name='next' onclick=order_page(" + (section +1) +"," + 1 + "," +  2 +") > 다음 </a>"
		      			                      +"</li>";
		                    			}
			                     
		                    data +="</ul>"
		                +"</nav>" ;
		                    
		                
		 
		 
		 
			jsonObject2.put("data", data);

			 sendArray2.add(jsonObject2);
		 
		
		 jsonObject3.put("list",sendArray);
		 jsonObject3.put("paging", sendArray2);
		 String jsonInfo = jsonObject3.toJSONString();
		 
		 
		 out.print(jsonInfo);
		 
		
		
	}
	

}
