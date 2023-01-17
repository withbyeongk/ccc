package com.kh.ccc.shop.order.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ccc.shop.cart.model.vo.Cart;
import com.kh.ccc.shop.order.model.vo.InsertOrder;
import com.kh.ccc.shop.order.model.vo.Order;

@Repository
public class OrderDao {

	public int insertOrder(SqlSessionTemplate sqlSession, InsertOrder io) {
		Order o = io.getO();
		ArrayList<Cart> clist = io.getClist();
		
		int orderDetailResult = 1;
		int deleteCartResult = 1;
		int orderResult = sqlSession.insert("orderMapper.insertOrder", o);
		if(orderResult>0) {
			for(Cart c : clist) {
				
				orderDetailResult *= sqlSession.insert("orderMapper.insertOrderDetail", c);
				deleteCartResult *= sqlSession.delete("cartMapper.deleteGoodsInCart", c.getCartNo());
			}
		}
		
		return orderResult * orderDetailResult * deleteCartResult;
	}

}
