package com.kh.ccc.shop.shipping.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.ccc.shop.shipping.model.vo.AddressInfo;

@Service
public interface ShippingService {
	// 배송지 추가
	int insertAddressInfo(AddressInfo ai);

	// 해당 회원의 배송지 state를 모두 N으로 변경(기본배송지 설정을 위함)
	int changeState(int memberNo);

	// 해당 회원의 배송지 정보를 조회
	ArrayList<AddressInfo> selectListAddressInfo(int memberNo);

	// addressNo로 배송지 정보 조회
	AddressInfo selectAddressInfoByAddrNo(int addressInfoNo);

	// 배송지 정보 수정
	int updateAddressInfo(AddressInfo ai);

	// 배송주소 삭제
	int deleteAddressInfo(int addressNo);
}
