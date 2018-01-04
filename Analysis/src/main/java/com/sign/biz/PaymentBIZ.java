package com.sign.biz;

import java.io.ByteArrayInputStream;
import java.util.List;

import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;

import com.sign.model.Payment;

public interface PaymentBIZ {

	public ByteArrayInputStream export();
	
	public void savePayment(Payment payment);
	
	public void submitPayment(Payment payment) throws Exception;
	
	public List<Payment> getPayment(String where);
	
	public List<Payment> getPayment(String where,Integer pageSize,Integer pageCurrent);
	
	public void sign(Payment payment);
	
	public String getMaxCode();

	void accPayment(Payment payment) throws Exception;

	void assignPayment(Payment payment) throws Exception;

	void approvePayment(Payment payment) throws Exception;

	void invalidPayment(Payment payment) throws Exception;

	void returnPayment(Payment payment) throws Exception;

	void rejectPayment(Payment payment) throws Exception;

	void printPayment(Payment payment) throws Exception;
	
}
