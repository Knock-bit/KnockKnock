package com.knockknock.mypage.mypageproductimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knockknock.mypage.MypageProductService;
import com.knockknock.user.UserVO;
import com.knockknock.util.ProductVO;

@Service("mypageProductService")
public class MypageProductServiceImpl implements MypageProductService {

	@Autowired
	private MypageProductDAO mypageProductDAO;
	
	// 상품 목록으로 이동(임시)
	@Override
	public List<ProductVO> ProductList() {
		return mypageProductDAO.ProductList();
	}

	// 상품정보 가져오기 (임시)
	@Override
	public ProductVO productDetail(int pIdx) {
		
		return mypageProductDAO.productDetail(pIdx);
	}
	// 장바구니에 상품 담기 전 동일한 상품번호 있는지 확인
	@Override
	public int checkCart(int pIdx) {
		
		return mypageProductDAO.checkCart(pIdx);
	}
	
	// 장바구니에 상품 담기
	@Override
	public int addCart(Map<String, Object> map) {
		
		return mypageProductDAO.addCart(map);
	}
	// 나의 장바구니 목록
	@Override
	public List<ProductVO> cartList(UserVO vo) {

		return mypageProductDAO.cartList(vo);
	}
	
	
}
