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
import com.shop.domain.Shop_Write_PointVO;
import com.shop.domain.Shop_Write_ProductVO;
import com.shop.domain.Shop_Write_sell_tableVO;
import com.shop.dto.Shop_User_InfoDTO;
import com.shop.dto.Shop_Write_AdminBoardDTO;
import com.shop.dto.Shop_Write_BoardDTO;
import com.shop.dto.Shop_Write_CartDTO;
import com.shop.dto.Shop_Write_ProductDTO;
import com.shop.dto.Shop_Write_sell_tableDTO;
import com.shop.mapper.MybatisManager;
import com.shop.util.MapperUtil;

public enum Shop_Update_Service {
	INSTANCE;
	
	private ModelMapper modelMapper;
	private SqlSession session;
	
	
	
	
	
	public void Update_Board(Shop_Write_BoardDTO shop_Write_BoardDTO) {   //문의사항 수정
		
		modelMapper = MapperUtil.INSTANCE.get();
		session = MybatisManager.getInstance().openSession();
		
		Shop_Write_BoardVO shop_Write_board = modelMapper.map(shop_Write_BoardDTO,Shop_Write_BoardVO.class);
		
//		Shop_Write_BoardVO shop_Write_board = Shop_Write_BoardVO.builder()
//				.qna_num(1)       //req.getparamete로 받기 
//				.user_id("jenny")
//				.qna_title("문의사항이 있습니다 수정")
//				.qna_content("안녕하세요2 수정")
//				.qna_reply("답글 없음")  //조건에 따른 값
//				.rep_check("미답변") //조건에 따른 값
//				.build();
		
		
		session.update("shop_Update.update_board", shop_Write_board);
		session.commit();
		
		
	}
	
	
	public void Update_sell_table(Shop_Write_sell_tableDTO shop_Write_sell_tableDTO) {  //판매 테이블 처리 상태 변경 시 로직 
	
		modelMapper = MapperUtil.INSTANCE.get();
		session = MybatisManager.getInstance().openSession();
		
		Shop_Write_sell_tableVO shop_Write_sell_tableVO = modelMapper.map(shop_Write_sell_tableDTO,Shop_Write_sell_tableVO.class);

		

		
		
		session.update("shop_Update.update_sell_result", shop_Write_sell_tableVO);
		session.commit();
		
		session.update("shop_Update.update_order_info_result", shop_Write_sell_tableVO);
		session.commit();
		
		session.update("shop_Update.update_order_result", shop_Write_sell_tableVO);
		session.commit();
		
		
		System.out.println("123123");
		
		
		//구매 확정 시 포인트 적립 
		if(shop_Write_sell_tableVO.getResult().equals("구매확정")) {
			
			// 해당 상품 정보의 포인트 칼럼, 상품명, 유저명 가져오기
			List<Map<String, Object>> list = session.selectList("shop_Select.select_product_point",shop_Write_sell_tableVO);
			
	
			
			//포인트 적립 내역 테이블에 데이터 입력
			Shop_Write_PointVO shop_Write_PointVO = Shop_Write_PointVO.builder()
					.user_id((String) list.get(0).get("USER_ID"))  
					.product_name((String) list.get(0).get("PRODUCT_NAME"))
					.point(Integer.parseInt(list.get(0).get("POINT").toString()))
					.build();
			
			System.out.println(shop_Write_PointVO);
			System.out.println("포인트 적립하기");
			
			session.insert("shop_Insert.write_point", shop_Write_PointVO);
			session.commit();
			
			
			
			//user_info point 업데이트
			int user_point = session.selectOne("shop_Select.select_user_point", shop_Write_PointVO.getUser_id());
			
			Map<String, String> map = new HashMap<>();
			map.put("user_id",shop_Write_PointVO.getUser_id());
			map.put("point", Integer.toString(user_point + shop_Write_PointVO.getPoint()));
			
			session.update("shop_Update.update_point", map);
			session.commit();
			
		
			
		}else if(shop_Write_sell_tableVO.getResult().equals("구매취소")) {
			//구매 취소 시 상품 수량 + 1
			System.out.println("1");
			int in_count = session.selectOne("shop_Select.select_in_count",shop_Write_sell_tableVO.getProduct_num());
			in_count += 1;
			
			Map<String, Integer> map = new HashMap<>();
			map.put("in_count", in_count);
			map.put("product_num", shop_Write_sell_tableVO.getProduct_num());
			System.out.println("2");
			System.out.println(map);
			session.update("shop_Update.update_inventory", map);
			session.commit();
			System.out.println("3");
		}
		
		
	}
	
	
	public void Update_Cart(Shop_Write_CartDTO shop_Write_CartDTO) {  //장바구니 수량 수정
		
		modelMapper = MapperUtil.INSTANCE.get();
		session = MybatisManager.getInstance().openSession();
		
		Shop_Write_CartVO shop_Write_CartVO = modelMapper.map(shop_Write_CartDTO, Shop_Write_CartVO.class);

//		Shop_Write_CartVO shop_Write_CartVO = Shop_Write_CartVO.builder()
//				.user_id("jenny") //req.getparameter
//				.product_num(3)	//req.getparameter
//				.amount(6)		//req.getparameter  (수정되는 값)
//				.price("10000")   	// 수정 되는 값(수량) * 연산 필요 (수정되는 값)
//				.build();
		
		session.update("shop_Update.update_cart_amount", shop_Write_CartVO);
		session.commit();
		
	}
	
	public void Update_Admin_Board(Shop_Write_AdminBoardDTO shop_Write_AdminBoardDTO) { //공지사항 및 이벤트 글 수정
		
		modelMapper = MapperUtil.INSTANCE.get();
		session = MybatisManager.getInstance().openSession();
		
		Shop_Write_AdminBoardVO shop_Write_AdminBoardVO = modelMapper.map(shop_Write_AdminBoardDTO, Shop_Write_AdminBoardVO.class);
		
		
		session.update("shop_Update.update_admin_board", shop_Write_AdminBoardVO);
		session.commit();
	}
	
	
	
	public void Update_Product(Shop_Write_ProductDTO shop_Write_ProductDTO) { //상품 정보 수정 
	
		modelMapper = MapperUtil.INSTANCE.get();
		session = MybatisManager.getInstance().openSession();
		
		Shop_Write_ProductVO shop_Write_ProductVO = modelMapper.map(shop_Write_ProductDTO, Shop_Write_ProductVO.class);
		
		
		//product_num 제외 수정 가능 
		
//				Shop_Write_ProductVO shop_Write_ProductVO = Shop_Write_ProductVO.builder()
//						.product_num(4)     // 수정할 상품 req.getparameter
//						.product_name("아디다스 신발 수정")   //req.getparameter
//						.product_brand("아디다스 수정")
//						.gender("여")
//						.price("30000 수정")
//						.description("편함 수정")
//						.imagePath("이미지 준비중")
//						.in_count(100)
//						.point(200)
//						.build();
				
				
				session.update("shop_Update.update_product", shop_Write_ProductVO);
				session.commit();
		
	}
	
	
	public void Update_User_info(Shop_User_InfoDTO shop_User_InfoDTO) {   //회원 정보 수정
	
		modelMapper = MapperUtil.INSTANCE.get();
		session = MybatisManager.getInstance().openSession();
		
		Shop_User_InfoVO shop_User_InfoVO = modelMapper.map(shop_User_InfoDTO, Shop_User_InfoVO.class);
		
		session.update("shop_Update.update_user_info",shop_User_InfoVO);
		session.commit();
		
	}
	
	
	
}
