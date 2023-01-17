package com.kh.ccc.shop.shipping.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ccc.shop.shipping.model.dao.ShippingDao;
import com.kh.ccc.shop.shipping.model.vo.AddressInfo;

@Service
public class ShippingServiceImpl implements ShippingService{

	@Autowired
	ShippingDao shippingDao = new ShippingDao();
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertAddressInfo(AddressInfo ai) {
		return shippingDao.insertAddressInfo(sqlSession, ai);
	}

	@Override
	public int changeState(int memberNo) {
		return shippingDao.changeState(sqlSession, memberNo);
	}

	@Override
	public ArrayList<AddressInfo> selectListAddressInfo(int memberNo) {
		return shippingDao.selectListAddressInfo(sqlSession, memberNo);
	}

	@Override
	public AddressInfo selectAddressInfoByAddrNo(int addressInfoNo) {
		return shippingDao.selectAddressInfoByAddrNo(sqlSession, addressInfoNo);
	}

	@Override
	public int updateAddressInfo(AddressInfo ai) {
		return shippingDao.updateAddressInfo(sqlSession, ai);
	}

	@Override
	public int deleteAddressInfo(int addressNo) {
		return shippingDao.deleteAddressInfo(sqlSession, addressNo);
	}
}
