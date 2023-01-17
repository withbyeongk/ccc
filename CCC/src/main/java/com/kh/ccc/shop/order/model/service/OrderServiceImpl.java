package com.kh.ccc.shop.order.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ccc.shop.cart.model.vo.Cart;
import com.kh.ccc.shop.order.model.dao.OrderDao;
import com.kh.ccc.shop.order.model.vo.InsertOrder;
import com.kh.ccc.shop.order.model.vo.Order;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	OrderDao orderDao = new OrderDao();
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertOrder(InsertOrder io) {
		return orderDao.insertOrder(sqlSession, io);
	}

	
	
	
}
