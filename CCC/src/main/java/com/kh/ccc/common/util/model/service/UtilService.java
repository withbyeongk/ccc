package com.kh.ccc.common.util.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ccc.common.util.model.dao.UtilDao;

@Service
public class UtilService {
	
	@Autowired
	UtilDao utilDao = new UtilDao();

}
