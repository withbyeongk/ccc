package com.kh.ccc.shop.order.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.ccc.shop.cart.model.vo.Cart;
import com.kh.ccc.shop.order.model.vo.InsertOrder;
import com.kh.ccc.shop.order.model.vo.Order;

@Service
public interface OrderService {

	// 주문 등록
	int insertOrder(InsertOrder io);

}
