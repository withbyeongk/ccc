package com.kh.ccc.shop.order.model.vo;

import java.util.ArrayList;

import com.kh.ccc.shop.cart.model.vo.Cart;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class InsertOrder {
	private Order o;
	private ArrayList<Cart> clist;
}
