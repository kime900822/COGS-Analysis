package com.sign.biz.impl;

import java.io.ByteArrayInputStream;
import java.util.List;

import org.springframework.stereotype.Service;

import com.sign.biz.PaymentBIZ;
import com.sign.model.Payment;

@Service
public class PaymentBIZImpl implements PaymentBIZ {

	@Override
	public ByteArrayInputStream export() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void savePayment(Payment payment) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modePayment(Payment payment) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Payment> getPayment(String where) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Payment> getPayment(String where, Integer pageSize, Integer pageCurrent) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void sign(Payment payment) {
		// TODO Auto-generated method stub
		
	}

	
}
