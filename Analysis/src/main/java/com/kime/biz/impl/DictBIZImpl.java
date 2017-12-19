package com.kime.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kime.biz.DictBIZ;
import com.kime.dao.DictDAO;
import com.kime.model.Dict;

@Service
@Transactional(readOnly=true)
public class DictBIZImpl implements DictBIZ {

	@Autowired
	DictDAO dictDao;
	
	public DictDAO getDictDao() {
		return dictDao;
	}

	public void setDictDao(DictDAO dictDao) {
		this.dictDao = dictDao;
	}

	@Override
	public List<Dict> getALLSign() {
		return dictDao.query(" where type='SIGN_TYPE' ");
	}
	
}
