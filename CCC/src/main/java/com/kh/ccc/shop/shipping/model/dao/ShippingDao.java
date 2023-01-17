package com.kh.ccc.shop.shipping.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ccc.shop.shipping.model.vo.AddressInfo;

@Repository
public class ShippingDao {

	public int insertAddressInfo(SqlSessionTemplate sqlSession, AddressInfo ai) {
		return sqlSession.insert("shippingMapper.insertAddressInfo", ai);
	}

	public int changeState(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.insert("shippingMapper.changeState", memberNo);
	}

	public ArrayList<AddressInfo> selectListAddressInfo(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("shippingMapper.selectListAddressInfo", memberNo);
	}

	public AddressInfo selectAddressInfoByAddrNo(SqlSessionTemplate sqlSession, int addressInfoNo) {
		return sqlSession.selectOne("shippingMapper.selectAddressInfoByAddrNo", addressInfoNo);
	}

	public int updateAddressInfo(SqlSessionTemplate sqlSession, AddressInfo ai) {
		return sqlSession.update("shippingMapper.updateAddressInfo", ai);
	}

	public int deleteAddressInfo(SqlSessionTemplate sqlSession, int addressNo) {
		return sqlSession.delete("shippingMapper.deleteAddressInfo", addressNo);
	}

}
