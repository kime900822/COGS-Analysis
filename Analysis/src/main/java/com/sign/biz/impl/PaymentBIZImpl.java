package com.sign.biz.impl;

import java.io.ByteArrayInputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sign.biz.PaymentBIZ;
import com.sign.dao.PaymentDAO;
import com.sign.model.Payment;

@Service
@Transactional(readOnly=true)
public class PaymentBIZImpl implements PaymentBIZ {
	
	@Autowired
	private PaymentDAO paymentDao;
	
	
	public PaymentDAO getPaymentDao() {
		return paymentDao;
	}

	public void setPaymentDao(PaymentDAO paymentDao) {
		this.paymentDao = paymentDao;
	}

	@Override
	public ByteArrayInputStream export() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class )
	public void savePayment(Payment payment) {
		paymentDao.save(payment);		
	}

	@Override
	@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class )
	public void modePayment(Payment payment) {
		paymentDao.update(payment);
	}

	@Override
	public List<Payment> getPayment(String where) {
		return paymentDao.query(where);
	}

	@Override
	public List<Payment> getPayment(String where, Integer pageSize, Integer pageCurrent) {
		return paymentDao.query(where, pageSize, pageCurrent);
	}

	@Override
	@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class )
	public void sign(Payment payment) {
		paymentDao.update(payment);
		
	}

	
}
