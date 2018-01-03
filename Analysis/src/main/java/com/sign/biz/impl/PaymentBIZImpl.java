package com.sign.biz.impl;

import java.io.ByteArrayInputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kime.biz.UserBIZ;
import com.kime.dao.UserDAO;
import com.kime.model.User;
import com.kime.utils.mail.SendMail;
import com.sign.biz.PaymentBIZ;
import com.sign.dao.PaymentDAO;
import com.sign.model.Payment;

@Service
@Transactional(readOnly=true)
public class PaymentBIZImpl implements PaymentBIZ {
	
	@Autowired
	private PaymentDAO paymentDao;
	@Autowired
	private UserDAO userDAO;
	
	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

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
	public void savePayment(Payment payment) throws Exception {
		paymentDao.save(payment);
		List<User> lUsers=userDAO.queryByHql(" select U from User U,SignMan S where U.uid=S.uid AND S.did='"+payment.getDepartmentID()+"'");
		if (lUsers.size()>0) {
			SendMail.SendMail(lUsers.get(0).getEmail(), "有新的待签核付款申请单", "有'"+payment.getUName()+"' 的付款申请单待签核！");	
		}else{
			throw new Exception("对应签核人员未维护，邮件发送失败");
		}
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

	@Override
	public String getMaxCode() {
		Date d=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMM");
		String hql="SELECT MAX(CODE) FROM PAYMENT";
		List<Object> list= paymentDao.queryHql(hql);
		if (list.size()>0) {
			return  String.valueOf(Integer.valueOf(list.get(0).toString())+1);
		}
			return sdf.format(d)+"0001";
	}

	
	
}
