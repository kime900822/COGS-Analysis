package com.sign.payment.dao;

import java.util.List;

import com.sign.payment.model.Beneficiary;

public interface BeneficiaryDAO {

	public void save(Beneficiary beneficiary);
	
	public void update(Beneficiary beneficiary);
	
	public void delete(Beneficiary beneficiary);
	
	public List<Beneficiary> query(String where);
	
	public List<Beneficiary> query(String where,Integer pageSize,Integer pageCurrent);
	
}
