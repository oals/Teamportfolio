package com.shop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.modelmapper.ModelMapper;

import com.shop.domain.Shop_User_InfoVO;
import com.shop.domain.Shop_Write_AdminBoardVO;
import com.shop.domain.Shop_Write_BoardVO;
import com.shop.domain.Shop_Write_CartVO;
import com.shop.domain.Shop_Write_CouponVO;
import com.shop.domain.Shop_Write_OrderVO;
import com.shop.domain.Shop_Write_Order_InfoVO;
import com.shop.domain.Shop_Write_P_BoardVO;
import com.shop.domain.Shop_Write_ProductVO;
import com.shop.domain.Shop_Write_ReviewVO;
import com.shop.domain.Shop_Write_sell_tableVO;
import com.shop.dto.Shop_User_InfoDTO;
import com.shop.dto.Shop_Write_AdminBoardDTO;
import com.shop.dto.Shop_Write_BoardDTO;
import com.shop.dto.Shop_Write_CartDTO;
import com.shop.dto.Shop_Write_OrderDTO;
import com.shop.dto.Shop_Write_Order_InfoDTO;
import com.shop.dto.Shop_Write_P_BoardDTO;
import com.shop.dto.Shop_Write_ProductDTO;
import com.shop.dto.Shop_Write_ReviewDTO;
import com.shop.mapper.MybatisManager;
import com.shop.util.MapperUtil;


public enum Shop_Insert_Service {
	INSTANCE;
	
	private ModelMapper modelMapper;
	private SqlSession session;
	
	
	
	
	public void Register(Shop_User_InfoDTO shop_User_InfoDTO) {   //회원 가입 및 회원가입 기념 쿠폰 증정
		
		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		
		Shop_User_InfoVO shop_User_InfoVO = modelMapper.map(shop_User_InfoDTO, Shop_User_InfoVO.class);
		
		System.out.println("-------------0-----------");
		System.out.println(shop_User_InfoVO);
		
		try {
			System.out.println("1");
			session.insert("shop_Insert.register", shop_User_InfoVO);
			session.commit();
			System.out.println("2");
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		
		
		//회원가입 완료 시 쿠폰 제공 
		Shop_Write_CouponVO shop_Write_CouponVO = Shop_Write_CouponVO.builder()
				.user_id(shop_User_InfoVO.getUser_id())
				.cp_name("회원가입 축하 쿠폰")
				.cp_result(1)
				.cp_sale("15%")
				.build();
		try {
			session.insert("shop_Insert.write_coupon", shop_Write_CouponVO);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	public void Write_Board(Shop_Write_BoardDTO shop_Write_BoardDTO) { //문의사항 쓰기
		
		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		 
		Shop_Write_BoardVO shop_Write_board = modelMapper.map(shop_Write_BoardDTO,Shop_Write_BoardVO.class);
		
		System.out.println(shop_Write_BoardDTO);
		System.out.println("문의 체크");
		System.out.println(shop_Write_board);
		
	 try {
			session.insert("shop_Insert.write_board", shop_Write_board);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	//주문 정보 및 주문 상세 , 판매처리 테이블 입력
	public void Write_order(Shop_Write_OrderDTO shop_Write_OrderDTO, Shop_Write_Order_InfoDTO shop_Write_Order_InfoDTO) {
		
		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		 
		Shop_Write_OrderVO shop_Write_OrderVO = modelMapper.map(shop_Write_OrderDTO, Shop_Write_OrderVO.class);
		
		System.out.println(shop_Write_OrderVO);
		
		try {
			System.out.println("1");
		session.insert("shop_Insert.write_order", shop_Write_OrderVO);
		session.commit();
		System.out.println("2");
		//주문 상세 테이블
		
		
		Shop_Write_Order_InfoVO shop_Write_Order_InfoVO = modelMapper.map(shop_Write_Order_InfoDTO,Shop_Write_Order_InfoVO.class);

		
		System.out.println("3");
			session.insert("shop_Insert.write_order_info", shop_Write_Order_InfoVO);
			session.commit();
			System.out.println("4");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("5");
		//판매 처리 테이블
		Shop_Write_sell_tableVO shop_Write_sell_tableVO = Shop_Write_sell_tableVO.builder()
				.sell_num(session.selectOne("shop_Count.sell_count")==null ? 1 : session.selectOne("shop_Count.sell_count"))
				.user_id(shop_Write_OrderVO.getUser_id())
				.product_num(shop_Write_OrderVO.getProduct_num())
				.product_name(shop_Write_OrderVO.getProduct_name())
				.order_num(shop_Write_OrderVO.getOrder_num())
				.result(shop_Write_OrderVO.getResult())
				.build();
		System.out.println("6");
		session.insert("shop_Insert.write_sell_table", shop_Write_sell_tableVO);
		session.commit();
		System.out.println("7");
		
		//주문시 판매 수량 하나 줄이기 필요
		int in_count = session.selectOne("shop_Select.select_in_count",shop_Write_sell_tableVO.getProduct_num());
		in_count -= 1;
		
		Map<String, Integer> map = new HashMap<>();
		map.put("in_count", in_count);
		map.put("product_num", shop_Write_sell_tableVO.getProduct_num());
		
		session.update("shop_Update.update_inventory", map);
		session.commit();
		
		
	}
	
	
	public int Write_cart(Shop_Write_CartDTO shop_Write_CartDTO) {  //장바구니 입력

		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		
		Shop_Write_CartVO shop_Write_CartVO= modelMapper.map(shop_Write_CartDTO,Shop_Write_CartVO.class);
		
		
		//장바구니에 물품이 존재 하는지 체크
		int chk = session.selectOne("shop_Select.select_cart_p", shop_Write_CartVO);
	
		if(chk == 0) { //존재하지 않을 때
			System.out.println("장바구니에 추가");
			session.insert("shop_Insert.write_cart", shop_Write_CartVO);
			session.commit();
			
		}else {       //이미 존재 할 때
			System.out.println("이미 장바구니에 존재");
			//처리 코드 필요 -> ajax?
			
		}
		
		
		return chk;   // 0일 때 true 1 이상일 때 false
		
		
	}
	
	
	public void Write_Admin_Board(Shop_Write_AdminBoardDTO shop_Write_AdminBoardDTO) { //공지사항 및 이벤트 글 작성
		
		
		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		 
		Shop_Write_AdminBoardVO shop_Write_AdminBoardVO = modelMapper.map(shop_Write_AdminBoardDTO, Shop_Write_AdminBoardVO.class);
		
				
		session.insert("shop_Insert.write_admin_board", shop_Write_AdminBoardVO);
		session.commit();
		
	}
	
	
	
	public int Write_Product(Shop_Write_ProductDTO shop_Write_ProductDTO) {  //상품 등록
		
		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		 
		int chk = 0;
		Shop_Write_ProductVO shop_Write_ProductVO= modelMapper.map(shop_Write_ProductDTO, Shop_Write_ProductVO.class);
		
		
		//이미 등록된 상품인지 확인 
		
		Map<String, String> map = new HashMap<>();
		map.put("product_name", shop_Write_ProductVO.getProduct_name());
		
		Shop_Write_ProductVO vo = session.selectOne("shop_Select.select_find_product", map);
		
		if(vo !=null) {
			System.out.println("상품이 이미 존재");
			System.out.println(vo);  //오류 메세지 전송
			chk = 1;
			
			
			
		}else {
			System.out.println("새 상품 등록");
			session.insert("shop_Insert.write_product", shop_Write_ProductVO);
			session.commit();
			chk = 0;
		}
		
		
		return chk;   //0일때 true 1일떄 false
		
		
	}
	
	public int Write_review(Shop_Write_ReviewDTO shop_Write_ReviewDTO) { //리뷰 입력
		
		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		 
		 Map<String, String> map = new HashMap();
		 map.put("user_id", shop_Write_ReviewDTO.getUser_id());
		 map.put("product_num", Integer.toString(shop_Write_ReviewDTO.getProduct_num()));

		 List<String> result = session.selectList("shop_Select.select_sell_check", map);
		 int chk = 1;
		 
		 int i = 0;
		 while(i < result.size()) {
		 
			
			 if(result.get(i).equals("구매확정")) {
				 System.out.println("insert문 실행");
				 Shop_Write_ReviewVO shop_Write_ReviewVO = modelMapper.map(shop_Write_ReviewDTO, Shop_Write_ReviewVO.class);
				session.insert("shop_Insert.write_reiview", shop_Write_ReviewVO);
				session.commit();
				chk = 0;
				break;
				
			 }else {
				 System.out.println("권한없음");
				 chk = 1;
			 }
			 i++;
		 
		 }
		return chk;
		
		
	}
	
	public void Write_p_board(Shop_Write_P_BoardDTO shop_Write_P_BoardDTO) { //상문 문의 남기기

		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		 
		 System.out.println("3");
		Shop_Write_P_BoardVO shop_Write_P_BoardVO = modelMapper.map(shop_Write_P_BoardDTO, Shop_Write_P_BoardVO.class);
				System.out.println("4");

		session.insert("shop_Insert.write_p_board",shop_Write_P_BoardVO);
		System.out.println("5");
		session.commit();
	}
	
	
	
	
	
	
}
