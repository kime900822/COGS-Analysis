package com.sign.biz.impl;

import java.io.ByteArrayInputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kime.biz.DictBIZ;
import com.kime.biz.UserBIZ;
import com.kime.dao.CommonDAO;
import com.kime.dao.DictDAO;
import com.kime.dao.UserDAO;
import com.kime.model.Dict;
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
	@Autowired
	private DictDAO dictDAO;
	@Autowired
	private CommonDAO commonDAO;
	
	
	public CommonDAO getCommonDAO() {
		return commonDAO;
	}

	public void setCommonDAO(CommonDAO commonDAO) {
		this.commonDAO = commonDAO;
	}

	public DictDAO getDictDAO() {
		return dictDAO;
	}

	public void setDictDAO(DictDAO dictDAO) {
		this.dictDAO = dictDAO;
	}

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
		return null;
	}

	@Override
	@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class )
	public void savePayment(Payment payment){
		paymentDao.save(payment);
	}
	
	@Override
	@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class )
	public void updatePayment(Payment payment){
		paymentDao.update(payment);
	}

	@Override
	@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class )
	public void submitPayment(Payment payment) throws Exception {
		List<User> lUsers=userDAO.queryByHql(" select U from User U,SignMan S where U.uid=S.uid AND S.did='"+payment.getDepartmentID()+"'");
		if (lUsers.size()>0) {
			payment.setDeptManagerID(lUsers.get(0).getUid());
			payment.setDeptManager(lUsers.get(0).getName());
			paymentDao.update(payment);
			SendMail.SendMail(lUsers.get(0).getEmail(), "有新的待签核付款申请单", "有'"+payment.getUName()+"' 的付款申请单待签核！");	
		}else{
			throw new Exception("对应签核人员未维护，邮件发送失败");
		}
	}
	
	@Override
	@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class )
	public void accPayment(Payment payment) {
		paymentDao.update(payment);
	}

	@Override
	@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class )
	public void assignPayment(Payment payment) throws Exception {
		paymentDao.update(payment);
	}
	
	@Override
	@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class )
	public void approvePayment(Payment payment) throws Exception {
		List<Dict> lDicts=dictDAO.query(" where key='"+payment.getPaymentSubject()+"'");
		if (!lDicts.get(0).getValue().equals("")&&lDicts.get(0).getValue()!=null) {
			payment.setDocumentAuditID(lDicts.get(0).getValue());
			paymentDao.update(payment);
			User user=(User)userDAO.query(" where id='"+payment.getUID()+"'").get(0);
			SendMail.SendMail(user.getEmail(), "付款申请单签核完成", "你有付款申请单签核完成可打印，请登录系统查看！");	
		}
	}
	
	
	@Override
	@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class )
	public void invalidPayment(Payment payment) throws Exception {
		paymentDao.update(payment);
		User user=(User)userDAO.query(" where id='"+payment.getUID()+"'").get(0);
		SendMail.SendMail(user.getEmail(), "有付款申请单作废", "你有付款申请单作废，请登录系统查看！");
	}
	
	@Override
	@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class )
	public void printPayment(Payment payment) throws Exception {
		paymentDao.update(payment);
	}
	
	
	@Override
	@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class )
	public void returnPayment(Payment payment) throws Exception {
		paymentDao.update(payment);
		User user=(User)userDAO.query(" where id='"+payment.getUID()+"'").get(0);
		SendMail.SendMail(user.getEmail(), "有付款申请单被退回", "你有付款申请单被退回，请登录系统查看！");
	}
	
	@Override
	@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class )
	public void rejectPayment(Payment payment) throws Exception {
		paymentDao.update(payment);
	}
	
	@Override
	public List<Payment> getPaymentByHql(String hql) {
		return paymentDao.queryHql(hql);
	}

	@Override
	public List<Payment> getPaymentByHql(String hql, Integer pageSize, Integer pageCurrent) {
		return paymentDao.queryHql(hql, pageSize, pageCurrent);
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
		String hql="SELECT MAX(P.code) FROM Payment P";
		List list= commonDAO.queryByHql(hql);
		if (list.size()>0) { 
			String mcode=(String)list.get(0);
			if (!mcode.equals("")&&mcode!=null) {
				return  String.valueOf(Integer.valueOf(mcode)+1);
			}		
		}
			return sdf.format(d)+"0001";
	}

	
	
}
