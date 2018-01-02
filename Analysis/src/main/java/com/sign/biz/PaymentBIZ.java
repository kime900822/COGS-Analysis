package com.sign.biz;

import java.io.ByteArrayInputStream;
import java.util.List;

import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;

import com.sign.model.Payment;

public interface PaymentBIZ {

	public ByteArrayInputStream export();
	
	public void savePayment(Payment payment);
	
	public void modePayment(Payment payment);
	
	public List<Payment> getPayment(String where);
	
	public List<Payment> getPayment(String where,Integer pageSize,Integer pageCurrent);
	
	public void sign(Payment payment);
	
	public String getMaxCode();
	
}
