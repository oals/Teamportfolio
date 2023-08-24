package com.shop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collector;
import java.util.stream.Collectors;

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
import com.shop.dto.Shop_Write_CouponDTO;
import com.shop.dto.Shop_Write_OrderDTO;
import com.shop.dto.Shop_Write_Order_InfoDTO;
import com.shop.dto.Shop_Write_P_BoardDTO;
import com.shop.dto.Shop_Write_ProductDTO;
import com.shop.dto.Shop_Write_ReviewDTO;
import com.shop.dto.Shop_Write_sell_tableDTO;
import com.shop.mapper.MybatisManager;
import com.shop.util.MapperUtil;

public enum Shop_Select_Service {
	INSTANCE;
	
	private ModelMapper modelMapper;
	private SqlSession session;


	
	public List<Shop_Write_AdminBoardDTO> Select_Admin_BoardList(Map<String,String> map) {  //공지사항 및 이벤트 글 리스트 가져오기
		
		
		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();

	
		
		List<Shop_Write_AdminBoardVO> vo = session.selectList("shop_Select.select_admin_board",map);
		List<Shop_Write_AdminBoardDTO> dto = vo.stream().map(x -> modelMapper.map(x,Shop_Write_AdminBoardDTO.class)).collect(Collectors.toList());
		//dto 변환
		
	
	return dto;
	
	}
	
	public Shop_Write_AdminBoardDTO Select_Admin_BoardOne(int articleNo) {  //공지사항 및 이벤트 글 하나 정보 가져오기
		
		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		 
		Shop_Write_AdminBoardVO vo = session.selectOne("shop_Select.select_admin_board_one",articleNo); //req.getparameter
		
		Shop_Write_AdminBoardDTO dto = modelMapper.map(vo, Shop_Write_AdminBoardDTO.class);
		
		return dto;
		
	}
	
	
	public List<Shop_Write_ReviewDTO> Select_Review(Map<String, String> map) { //리뷰 리스트 가져오기
		
		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		 
		
		List<Shop_Write_ReviewVO> vo = session.selectList("shop_Select.select_review",map);
		
		List<Shop_Write_ReviewDTO> dto = vo.stream().map(x -> modelMapper.map(x,Shop_Write_ReviewDTO.class)).collect(Collectors.toList());
		
		
		return dto;
	}
	
	public int Select_Review_chk(Shop_Write_ReviewDTO shop_Write_ReviewDTO) {
		
		modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		 
		 Shop_Write_ReviewVO shop_Write_ReviewVO = modelMapper.map(shop_Write_ReviewDTO, Shop_Write_ReviewVO.class);
		 
		 int chk = session.selectOne("shop_Select.select_review_chk",shop_Write_ReviewVO);
		
		return chk;
		
	}
	
	
	
	
	public List<Shop_Write_BoardDTO> Select_Board(Map<String,String> map) {
		
		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		 
		
		List<Shop_Write_BoardVO> vo = session.selectList("shop_Select.select_board", map);
		List<Shop_Write_BoardDTO> dto = vo.stream().map(x -> modelMapper.map(x, Shop_Write_BoardDTO.class)).collect(Collectors.toList());
		return dto;
		
		
	}
	
	
	public Shop_Write_BoardDTO select_board_one(Map<String, String> map) {
		
		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		 
		 Shop_Write_BoardVO vo = session.selectOne("shop_Select.select_board_one",map);
		 Shop_Write_BoardDTO dto = modelMapper.map(vo, Shop_Write_BoardDTO.class);
		 
		return dto;
		
	}
	
	
	public List<Shop_Write_P_BoardDTO> Select_P_Board(Map<String, String> map) { //상품 문의 리스트 가져오기
		
		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();

		
		
		List<Shop_Write_P_BoardVO> vo = session.selectList("shop_Select.select_p_board",map);
		List<Shop_Write_P_BoardDTO> dto = vo.stream().map(x -> modelMapper.map(x,Shop_Write_P_BoardDTO.class)).collect(Collectors.toList()); 
		System.out.println(dto);
		
		return dto;
		
	}
	
	
	
	public List<Shop_Write_P_BoardDTO> select_user_p_board(Map<String, String> map) { //상품 문의 리스트 가져오기
		
		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();

		
		
		
		List<Shop_Write_P_BoardVO> vo = session.selectList("shop_Select.select_user_p_board",map);
		List<Shop_Write_P_BoardDTO> dto = vo.stream().map(x -> modelMapper.map(x,Shop_Write_P_BoardDTO.class)).collect(Collectors.toList()); 
		
		
		return dto;
		
	}
	
	
	
	
	public List<Shop_Write_sell_tableDTO> Select_sell_table(Map<String,String> map) { //판매처리 테이블 정보 가져오기
		
		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		
		
		List<Shop_Write_sell_tableVO> vo = session.selectList("shop_Select.select_sell",map);
		List<Shop_Write_sell_tableDTO> dto = vo.stream().map(x -> modelMapper.map(x, Shop_Write_sell_tableDTO.class)).collect(Collectors.toList());
		
		
		return dto;
		
		
	}
	
	public List<Shop_Write_OrderDTO> Select_order_list(Map<String, String> map) {   //주문 정보 리스트 가져오기
		
		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		
		List<Shop_Write_OrderVO> vo = session.selectList("shop_Select.select_order", map);
		List<Shop_Write_OrderDTO> dto = vo.stream().map(x -> modelMapper.map(x, Shop_Write_OrderDTO.class)).collect(Collectors.toList()); 
		
		return dto;
	}
	
	
	
	
	//임시로 만듬 
	public List<Shop_Write_OrderDTO> Select_order_list2(Map<String, String> map) {   //주문 정보 리스트 가져오기
		
		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		
		List<Shop_Write_OrderVO> vo = session.selectList("shop_Select.select_order2", map);
		List<Shop_Write_OrderDTO> dto = vo.stream().map(x -> modelMapper.map(x, Shop_Write_OrderDTO.class)).collect(Collectors.toList()); 
		
		return dto;
	}
	
	
	
	
	
	
	public Map<String, Object> Select_order_one(Map<String, String> map) { //주문 정보 , 주문 상세 정보 하나 가져오기
		
		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		 
		
		
		//order_num에 해당하는 주문 테이블 가져오기
		Shop_Write_OrderVO vo = session.selectOne("shop_Select.select_order_one", map);
		
		//order_num에 해당하는 주문 상세 테이블 가져오기
		Shop_Write_Order_InfoVO vo2 = session.selectOne("shop_Select.select_order_info_one",map);
		
		Shop_Write_OrderDTO shop_Write_OrderDTO = modelMapper.map(vo, Shop_Write_OrderDTO.class);
		Shop_Write_Order_InfoDTO shop_Write_Order_InfoDTO = modelMapper.map(vo2, Shop_Write_Order_InfoDTO.class);
		
		
		Map<String, Object> obj = new HashMap<>();
		obj.put("Shop_Write_OrderDTO", shop_Write_OrderDTO);
		obj.put("Shop_Write_Order_InfoDTO", shop_Write_Order_InfoDTO);   //컨트롤러에서 꺼내서 처리 
		
		return obj;
		
	}
	
	
	
	public List<Shop_Write_CartDTO> Select_cart(Map<String, String> map) { //장바구니 리스트 가져오기

		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		 
		
		List<Shop_Write_CartVO> vo = session.selectList("shop_Select.select_cart", map);
		
		List<Shop_Write_CartDTO> dto = vo.stream().map(x -> modelMapper.map(x, Shop_Write_CartDTO.class)).collect(Collectors.toList());
		
		System.out.println("장바구니 체크2222");
		System.out.println(dto);
		return dto;
		
	}
	
	public List<Shop_Write_ProductDTO> Select_Product(Map<String, String> map) {  //상품 정보 가져오기 

		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		 
		
		List<Shop_Write_ProductVO> vo = session.selectList("shop_Select.select_product", map);
		List<Shop_Write_ProductDTO> dto = vo.stream().map(x -> modelMapper.map(x, Shop_Write_ProductDTO.class)).collect(Collectors.toList());
		
		return dto;
		
	}
	
	
	
	
	
	
	public List<Shop_Write_ProductDTO> select_brand_product(Map<String, String> map) {  //상품 정보 가져오기 

		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		 
		
		List<Shop_Write_ProductVO> vo = session.selectList("shop_Select.select_brand_product", map);
		List<Shop_Write_ProductDTO> dto = vo.stream().map(x -> modelMapper.map(x, Shop_Write_ProductDTO.class)).collect(Collectors.toList());
		
		return dto;
		
	}
	
	
	
	public List<Shop_Write_ProductDTO> Select_Search_Product(String keyword) {  //상품 검색 정보 가져오기 

		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		 
		
		List<Shop_Write_ProductVO> vo = session.selectList("shop_Select.select_search_product", keyword);
		List<Shop_Write_ProductDTO> dto = vo.stream().map(x -> modelMapper.map(x, Shop_Write_ProductDTO.class)).collect(Collectors.toList());
		
		return dto;
		
	}
	
	public Shop_Write_ProductDTO select_find_product(Map<String, String> map) {  //해당 상품 정보 가져오기 
		modelMapper = MapperUtil.INSTANCE.get();
		session  = MybatisManager.getInstance().openSession();
		
		System.out.println("a");
		System.out.println(map);
		Shop_Write_ProductVO shop_Write_ProductVO = session.selectOne("shop_Select.select_find_product", map);
		System.out.println("b");
		System.out.println(shop_Write_ProductVO);
		Shop_Write_ProductDTO shop_Write_ProductDTO = modelMapper.map(shop_Write_ProductVO,Shop_Write_ProductDTO.class);
		System.out.println("c");


		return shop_Write_ProductDTO;
		
	}
	
	
	public String select_product_name (Map<String, String> map) {
		
		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		 
		 
		 String product_name = session.selectOne("shop_Select.select_product_name", map);
		 
		 return product_name;
	}
	
	
	
	public List<Shop_Write_CouponDTO> Select_Coupon(Map<String, String> map) {  //해당 유저의 쿠폰 가져오기
		
		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		 
		
		List<Shop_Write_CouponVO> vo = session.selectList("shop_Select.select_coupon", map);
		List<Shop_Write_CouponDTO> dto = vo.stream().map(x -> modelMapper.map(x, Shop_Write_CouponDTO.class)).collect(Collectors.toList());
		
		return dto;
		
	}
	
	public int Select_login(Map<String, String> map) { //로그인
	
		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		 
		String pw = session.selectOne("shop_Select.select_login", map);
		
		int result = 0;
		if(map.get("pw").equals(pw)) {
			//로그인 성공
			result = 1;
			if(map.get("user_id").equals("admin")) {
				result=3;
			}
		
		}
	
		return result;
		
	}
	
	public int select_admin_login(Map<String, String> map) {
	
		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		 
		String pw = session.selectOne("shop_Select.select_admin_login", map);
		
		int result = 0;
		if(map.get("pw").equals(pw)) {
			//로그인 성공
			if(map.get("user_id").equals("admin")) {
				result=3;
			}
		
		}
	
		return result;
		
		
	}
	
	public Shop_User_InfoDTO select_user_info(Map<String, String> map) {
		
		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		
		 Shop_User_InfoVO shop_User_InfoVO = session.selectOne("shop_Select.select_user_info", map);
		 
		 Shop_User_InfoDTO shop_User_InfoDTO = modelMapper.map(shop_User_InfoVO, Shop_User_InfoDTO.class);
		 
		return shop_User_InfoDTO;
	}
	
	public List<Shop_Write_ProductDTO> select_product_info() {
		
		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		
		 List<Shop_Write_ProductVO> list = session.selectList("shop_Select.select_product_info");
		 
		 List<Shop_Write_ProductDTO> shop_Write_ProductDTO = list.stream().map(x -> modelMapper.map(x,Shop_Write_ProductDTO.class )).collect(Collectors.toList());
		 
		 
		return shop_Write_ProductDTO;
	}
	
	
	
	public int checkID(Map<String, String> map) { // 아이디 중복체크
		
		modelMapper = MapperUtil.INSTANCE.get();
		session  = MybatisManager.getInstance().openSession();
		 
		String user_id = session.selectOne("shop_checkId", map);
		
		int result = 0;
		if(map.get("user_id").equals(user_id)) {
			// 아이디 중복
			result = 1;
		
		}
	
		return result;
		
	}
	
	
}
