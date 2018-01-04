package com.sign.action;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.google.gson.Gson;
import com.kime.action.ActionBase;
import com.kime.action.DictAction;
import com.kime.biz.DictBIZ;
import com.kime.infoenum.Message;
import com.kime.model.Dict;
import com.kime.model.User;
import com.kime.utils.mail.MailSenderInfo;
import com.kime.utils.mail.SimpleMailSender;
import com.sign.biz.PaymentBIZ;
import com.sign.model.Payment;
import com.sign.other.FileSave;
import com.sign.other.PaymentStatus;

@Controller
public class PaymentAction extends ActionBase {

	@Autowired
	private PaymentBIZ paymentBIZ;
	@Autowired
	private FileSave fileSave;
    @Autowired  
    private  HttpSession session;   
    @Autowired
    private DictBIZ dictBIZ;
	
	private File file;
	private String fileFileName;


	public DictBIZ getDictBIZ() {
		return dictBIZ;
	}
	public void setDictBIZ(DictBIZ dictBIZ) {
		this.dictBIZ = dictBIZ;
	}
	public HttpSession getSession() {
		return session;
	}
	public void setSession(HttpSession session) {
		this.session = session;
	}
	public FileSave getFileSave() {
		return fileSave;
	}
	public void setFileSave(FileSave fileSave) {
		this.fileSave = fileSave;
	}
	public String getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}

	private String queryType;
	private String id;
	private String applicationDate;
	private String requestPaymentDate;
	private String contacturalPaymentDate;
	private String code;
	private String urgent;
	private String payType;
	private String UID;
	private String departmentID;
	private String beneficiary;
	private String beneficiaryAccountNO;
	private String beneficiaryChange;
	private String beneficiaryAccountNOChange;
	private String supplierCode;
	private String refNoofBank;
	private String paymentSubject;
	private String paymentTerm;
	
	private String paymentDays_1;
	private String receivingOrApprovalDate_1;
	private String PONo_1;
	private String currency_1;
	private double amount_1;
	
	private String paymentDays_2;
	private String receivingOrApprovalDate_2;
	private String PONo_2;
	private String currency_2;
	private double amount_2;
	
	private String paymentDays_3;
	private String receivingOrApprovalDate_3;
	private String PONo_3;
	private String currency_3;
	private double amount_3;
	
	private String paymentDays_4;
	private String receivingOrApprovalDate_4;
	private String PONo_4;
	private String currency_4;
	private double amount_4;
	
	private String paymentDays_5;
	private String receivingOrApprovalDate_5;
	private String PONo_5;
	private String currency_5;
	private double amount_5;
	
	private String paymentDays_6;
	private String receivingOrApprovalDate_6;
	private String PONo_6;
	private String currency_6;
	private double amount_6;
	
	
	private String usageDescription;
	private double amountInFigures;
	private String documentAudit;
	private String status;
	private String invoice;
	private String contract;
	private String other;
	private String invalidDescription;
	private String returnDescription;
	private String deptManager;
	private String financeSupervisor;
	private String financeManager;
	private String generalManager;
	
	public String getPaymentTerm() {
		return paymentTerm;
	}
	public void setPaymentTerm(String paymentTerm) {
		this.paymentTerm = paymentTerm;
	}
	public PaymentBIZ getPaymentBIZ() {
		return paymentBIZ;
	}
	public void setPaymentBIZ(PaymentBIZ paymentBIZ) {
		this.paymentBIZ = paymentBIZ;
	}
	
	public String getQueryType() {
		return queryType;
	}
	public void setQueryType(String queryType) {
		this.queryType = queryType;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getApplicationDate() {
		return applicationDate;
	}
	public void setApplicationDate(String applicationDate) {
		this.applicationDate = applicationDate;
	}
	public String getRequestPaymentDate() {
		return requestPaymentDate;
	}
	public void setRequestPaymentDate(String requestPaymentDate) {
		this.requestPaymentDate = requestPaymentDate;
	}
	public String getContacturalPaymentDate() {
		return contacturalPaymentDate;
	}
	public void setContacturalPaymentDate(String contacturalPaymentDate) {
		this.contacturalPaymentDate = contacturalPaymentDate;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getUrgent() {
		return urgent;
	}
	public void setUrgent(String urgent) {
		this.urgent = urgent;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public String getUID() {
		return UID;
	}
	public void setUID(String uID) {
		UID = uID;
	}
	public String getDepartmentID() {
		return departmentID;
	}
	public void setDepartmentID(String departmentID) {
		this.departmentID = departmentID;
	}
	public String getBeneficiary() {
		return beneficiary;
	}
	public void setBeneficiary(String beneficiary) {
		this.beneficiary = beneficiary;
	}
	public String getBeneficiaryAccountNO() {
		return beneficiaryAccountNO;
	}
	public void setBeneficiaryAccountNO(String beneficiaryAccountNO) {
		this.beneficiaryAccountNO = beneficiaryAccountNO;
	}
	public String getBeneficiaryChange() {
		return beneficiaryChange;
	}
	public void setBeneficiaryChange(String beneficiaryChange) {
		this.beneficiaryChange = beneficiaryChange;
	}
	public String getBeneficiaryAccountNOChange() {
		return beneficiaryAccountNOChange;
	}
	public void setBeneficiaryAccountNOChange(String beneficiaryAccountNOChange) {
		this.beneficiaryAccountNOChange = beneficiaryAccountNOChange;
	}
	public String getSupplierCode() {
		return supplierCode;
	}
	public void setSupplierCode(String supplierCode) {
		this.supplierCode = supplierCode;
	}
	public String getRefNoofBank() {
		return refNoofBank;
	}
	public void setRefNoofBank(String refNoofBank) {
		this.refNoofBank = refNoofBank;
	}
	public String getPaymentSubject() {
		return paymentSubject;
	}
	public void setPaymentSubject(String paymentSubject) {
		this.paymentSubject = paymentSubject;
	}

	public String getPaymentDays_1() {
		return paymentDays_1;
	}
	public void setPaymentDays_1(String paymentDays_1) {
		this.paymentDays_1 = paymentDays_1;
	}
	public String getReceivingOrApprovalDate_1() {
		return receivingOrApprovalDate_1;
	}
	public void setReceivingOrApprovalDate_1(String receivingOrApprovalDate_1) {
		this.receivingOrApprovalDate_1 = receivingOrApprovalDate_1;
	}
	public String getPONo_1() {
		return PONo_1;
	}
	public void setPONo_1(String pONo_1) {
		PONo_1 = pONo_1;
	}
	public String getCurrency_1() {
		return currency_1;
	}
	public void setCurrency_1(String currency_1) {
		this.currency_1 = currency_1;
	}
	public String getPaymentDays_2() {
		return paymentDays_2;
	}
	public void setPaymentDays_2(String paymentDays_2) {
		this.paymentDays_2 = paymentDays_2;
	}
	public String getReceivingOrApprovalDate_2() {
		return receivingOrApprovalDate_2;
	}
	public void setReceivingOrApprovalDate_2(String receivingOrApprovalDate_2) {
		this.receivingOrApprovalDate_2 = receivingOrApprovalDate_2;
	}
	public String getPONo_2() {
		return PONo_2;
	}
	public void setPONo_2(String pONo_2) {
		PONo_2 = pONo_2;
	}
	public String getCurrency_2() {
		return currency_2;
	}
	public void setCurrency_2(String currency_2) {
		this.currency_2 = currency_2;
	}
	public String getPaymentDays_3() {
		return paymentDays_3;
	}
	public void setPaymentDays_3(String paymentDays_3) {
		this.paymentDays_3 = paymentDays_3;
	}
	public String getReceivingOrApprovalDate_3() {
		return receivingOrApprovalDate_3;
	}
	public void setReceivingOrApprovalDate_3(String receivingOrApprovalDate_3) {
		this.receivingOrApprovalDate_3 = receivingOrApprovalDate_3;
	}
	public String getPONo_3() {
		return PONo_3;
	}
	public void setPONo_3(String pONo_3) {
		PONo_3 = pONo_3;
	}
	public String getCurrency_3() {
		return currency_3;
	}
	public void setCurrency_3(String currency_3) {
		this.currency_3 = currency_3;
	}
	public String getPaymentDays_4() {
		return paymentDays_4;
	}
	public void setPaymentDays_4(String paymentDays_4) {
		this.paymentDays_4 = paymentDays_4;
	}
	public String getReceivingOrApprovalDate_4() {
		return receivingOrApprovalDate_4;
	}
	public void setReceivingOrApprovalDate_4(String receivingOrApprovalDate_4) {
		this.receivingOrApprovalDate_4 = receivingOrApprovalDate_4;
	}
	public String getPONo_4() {
		return PONo_4;
	}
	public void setPONo_4(String pONo_4) {
		PONo_4 = pONo_4;
	}
	public String getCurrency_4() {
		return currency_4;
	}
	public void setCurrency_4(String currency_4) {
		this.currency_4 = currency_4;
	}
	public String getPaymentDays_5() {
		return paymentDays_5;
	}
	public void setPaymentDays_5(String paymentDays_5) {
		this.paymentDays_5 = paymentDays_5;
	}
	public String getReceivingOrApprovalDate_5() {
		return receivingOrApprovalDate_5;
	}
	public void setReceivingOrApprovalDate_5(String receivingOrApprovalDate_5) {
		this.receivingOrApprovalDate_5 = receivingOrApprovalDate_5;
	}
	public String getPONo_5() {
		return PONo_5;
	}
	public void setPONo_5(String pONo_5) {
		PONo_5 = pONo_5;
	}
	public String getCurrency_5() {
		return currency_5;
	}
	public void setCurrency_5(String currency_5) {
		this.currency_5 = currency_5;
	}
	public String getPaymentDays_6() {
		return paymentDays_6;
	}
	public void setPaymentDays_6(String paymentDays_6) {
		this.paymentDays_6 = paymentDays_6;
	}
	public String getReceivingOrApprovalDate_6() {
		return receivingOrApprovalDate_6;
	}
	public void setReceivingOrApprovalDate_6(String receivingOrApprovalDate_6) {
		this.receivingOrApprovalDate_6 = receivingOrApprovalDate_6;
	}
	public String getPONo_6() {
		return PONo_6;
	}
	public void setPONo_6(String pONo_6) {
		PONo_6 = pONo_6;
	}
	public String getCurrency_6() {
		return currency_6;
	}
	public void setCurrency_6(String currency_6) {
		this.currency_6 = currency_6;
	}
	public double getAmount_1() {
		return amount_1;
	}
	public void setAmount_1(double amount_1) {
		this.amount_1 = amount_1;
	}
	public double getAmount_2() {
		return amount_2;
	}
	public void setAmount_2(double amount_2) {
		this.amount_2 = amount_2;
	}
	public double getAmount_3() {
		return amount_3;
	}
	public void setAmount_3(double amount_3) {
		this.amount_3 = amount_3;
	}
	public double getAmount_4() {
		return amount_4;
	}
	public void setAmount_4(double amount_4) {
		this.amount_4 = amount_4;
	}
	public double getAmount_5() {
		return amount_5;
	}
	public void setAmount_5(double amount_5) {
		this.amount_5 = amount_5;
	}
	public double getAmount_6() {
		return amount_6;
	}
	public void setAmount_6(double amount_6) {
		this.amount_6 = amount_6;
	}
	public String getUsageDescription() {
		return usageDescription;
	}
	public void setUsageDescription(String usageDescription) {
		this.usageDescription = usageDescription;
	}
	public double getAmountInFigures() {
		return amountInFigures;
	}
	public void setAmountInFigures(double amountInFigures) {
		this.amountInFigures = amountInFigures;
	}
	public String getDocumentAudit() {
		return documentAudit;
	}
	public void setDocumentAudit(String documentAudit) {
		this.documentAudit = documentAudit;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getInvoice() {
		return invoice;
	}
	public void setInvoice(String invoice) {
		this.invoice = invoice;
	}
	public String getContract() {
		return contract;
	}
	public void setContract(String contract) {
		this.contract = contract;
	}
	public String getOther() {
		return other;
	}
	public void setOther(String other) {
		this.other = other;
	}
	public String getInvalidDescription() {
		return invalidDescription;
	}
	public void setInvalidDescription(String invalidDescription) {
		this.invalidDescription = invalidDescription;
	}

	public String getReturnDescription() {
		return returnDescription;
	}
	public void setReturnDescription(String returnDescription) {
		this.returnDescription = returnDescription;
	}
	public String getDeptManager() {
		return deptManager;
	}
	public void setDeptManager(String deptManager) {
		this.deptManager = deptManager;
	}
	public String getFinanceSupervisor() {
		return financeSupervisor;
	}
	public void setFinanceSupervisor(String financeSupervisor) {
		this.financeSupervisor = financeSupervisor;
	}
	public String getFinanceManager() {
		return financeManager;
	}
	public void setFinanceManager(String financeManager) {
		this.financeManager = financeManager;
	}
	public String getGeneralManager() {
		return generalManager;
	}
	public void setGeneralManager(String generalManager) {
		this.generalManager = generalManager;
	}
	
	
	
	@Action(value="savefile",results={@org.apache.struts2.convention.annotation.Result(type="stream",
			params={
					"inputName", "reslutJson"
			})})
    public String savefile() throws FileNotFoundException, IOException{
        try {
	    	if (file!=null) {
	            if (fileSave.fleSave(file, fileFileName)) {
	            	result.setMessage("upload Success!");
					result.setStatusCode("200");
				}else{			
					result.setMessage(Message.UPLOAD_MESSAGE_ERROE);
					result.setStatusCode("300");	
				}
			}else{
				result.setMessage("No File upload");
				result.setStatusCode("300");
			}
		} catch (Exception e) {
			result.setMessage(e.getMessage());
			result.setStatusCode("300");
		}
        reslutJson=new ByteArrayInputStream(new Gson().toJson(result).getBytes("UTF-8"));  
    	return SUCCESS;
    }
	
	
	@Action(value="savePayment",results={@org.apache.struts2.convention.annotation.Result(type="stream",
			params={
					"inputName", "reslutJson"
			})})
	public String savePayment() throws UnsupportedEncodingException{
		try {
			Payment payment=paramToPayment();
			payment.setStatus(PaymentStatus.SAVEPAYMENT);
			List<Dict> lDicts=dictBIZ.getDict(" where key='"+paymentSubject+"'");
			if (!"".equals(lDicts.get(0).getValue())&&lDicts.get(0).getValue()!=null) {
//				payment.setDocumentAudit(lDicts.get(0).getValue());
				paymentBIZ.savePayment(payment);

				
				result.setMessage(Message.SAVE_MESSAGE_SUCCESS);
				result.setStatusCode("200");
				logUtil.logInfo("新增付款申请单:"+payment.getId());
			}else{
				result.setMessage(Message.SAVE_MESSAGE_PAYMENT_ERROR);
				result.setStatusCode("300");
				logUtil.logInfo("新增付款申异常:为维护对应财务人员");
			}
			
		} catch (Exception e) {
			logUtil.logInfo("新增付款申请单异常:"+e.getMessage());
			result.setMessage(e.getMessage());
			result.setStatusCode("300");
		}
		
		reslutJson=new ByteArrayInputStream(new Gson().toJson(result).getBytes("UTF-8")); 	
		return SUCCESS;
	}
	
	@Action(value="printPayment",results={@org.apache.struts2.convention.annotation.Result(type="stream",
			params={
					"inputName", "reslutJson"
			})})
	public String printPayment() throws UnsupportedEncodingException{
		try {
			Payment payment=paramToPayment();
			payment.setIsPrint("1");
			payment.setCode(paymentBIZ.getMaxCode());
			
			paymentBIZ.printPayment(payment);
			
			result.setMessage(Message.SAVE_MESSAGE_SUCCESS);
			result.setStatusCode("200");
			logUtil.logInfo("打印付款申请单:"+payment.getId());
		} catch (Exception e) {
			logUtil.logInfo("打印付款申请单异常:"+e.getMessage());
			result.setMessage(e.getMessage());
			result.setStatusCode("300");
		}
		
		reslutJson=new ByteArrayInputStream(new Gson().toJson(result).getBytes("UTF-8")); 	
		return SUCCESS;
	}
	
	@Action(value="accPayment",results={@org.apache.struts2.convention.annotation.Result(type="stream",
			params={
					"inputName", "reslutJson"
			})})
	public String accPayment() throws UnsupportedEncodingException{
		try {
			Payment payment=paymentBIZ.getPayment(" where id='"+id+"'").get(0);
			payment.setStatus(PaymentStatus.ACCPAYMENT);
			payment.setDocumentAudit(documentAudit);
			
			paymentBIZ.accPayment(payment);
			
			result.setMessage(Message.SAVE_MESSAGE_SUCCESS);
			result.setStatusCode("200");
			logUtil.logInfo("财务处理付款申请单:"+payment.getId());
		} catch (Exception e) {
			logUtil.logInfo("财务处理付款申请单异常:"+e.getMessage());
			result.setMessage(e.getMessage());
			result.setStatusCode("300");
		}
		
		reslutJson=new ByteArrayInputStream(new Gson().toJson(result).getBytes("UTF-8")); 	
		return SUCCESS;
	}
	
	
	@Action(value="assignPayment",results={@org.apache.struts2.convention.annotation.Result(type="stream",
			params={
					"inputName", "reslutJson"
			})})
	public String assignPayment() throws UnsupportedEncodingException{
		try {
			Payment payment=paymentBIZ.getPayment(" where id='"+id+"'").get(0);
			payment.setDocumentAudit(documentAudit);
			
			paymentBIZ.assignPayment(payment);
			
			result.setMessage(Message.SAVE_MESSAGE_SUCCESS);
			result.setStatusCode("200");
			logUtil.logInfo("付款申请单财务转人:"+payment.getId());
		} catch (Exception e) {
			logUtil.logInfo("付款申请单财务转人异常:"+e.getMessage());
			result.setMessage(e.getMessage());
			result.setStatusCode("300");
		}
		
		reslutJson=new ByteArrayInputStream(new Gson().toJson(result).getBytes("UTF-8")); 	
		return SUCCESS;
	}
	
	
	@Action(value="submitPayment",results={@org.apache.struts2.convention.annotation.Result(type="stream",
			params={
					"inputName", "reslutJson"
			})})
	public String submitPayment() throws UnsupportedEncodingException{
		try {
			Payment payment=paymentBIZ.getPayment(" where id='"+id+"'").get(0);
			payment.setStatus(PaymentStatus.SUBPAYMENT);
			
			paymentBIZ.submitPayment(payment);
			
			result.setMessage(Message.SAVE_MESSAGE_SUCCESS);
			result.setStatusCode("200");
			logUtil.logInfo("提交付款申请单:"+payment.getId());
		} catch (Exception e) {
			logUtil.logInfo("提交付款申请单异常:"+e.getMessage());
			result.setMessage(e.getMessage());
			result.setStatusCode("300");
		}
		
		reslutJson=new ByteArrayInputStream(new Gson().toJson(result).getBytes("UTF-8")); 	
		return SUCCESS;
	}
	
	@Action(value="approvePayment",results={@org.apache.struts2.convention.annotation.Result(type="stream",
			params={
					"inputName", "reslutJson"
			})})
	public String approvePayment() throws UnsupportedEncodingException{
		try {
			Payment payment=paymentBIZ.getPayment(" where id='"+id+"'").get(0);
			payment.setStatus(PaymentStatus.APPROVEPAYMENT);
			
			paymentBIZ.approvePayment(payment);
			
			result.setMessage(Message.SAVE_MESSAGE_SUCCESS);
			result.setStatusCode("200");
			logUtil.logInfo("付款申请单审批通过:"+payment.getId());
		} catch (Exception e) {
			logUtil.logInfo("付款申请单审批异常:"+e.getMessage());
			result.setMessage(e.getMessage());
			result.setStatusCode("300");
		}
		
		reslutJson=new ByteArrayInputStream(new Gson().toJson(result).getBytes("UTF-8")); 	
		return SUCCESS;
	}
	
	@Action(value="invalidPayment",results={@org.apache.struts2.convention.annotation.Result(type="stream",
			params={
					"inputName", "reslutJson"
			})})
	public String invalidPayment() throws UnsupportedEncodingException{
		try {
			Payment payment=paymentBIZ.getPayment(" where id='"+id+"'").get(0);
			payment.setStatus(PaymentStatus.INVALIDPAYMENT);
			payment.setInvalidDescription(invalidDescription);
			
			paymentBIZ.invalidPayment(payment);
			
			result.setMessage(Message.SAVE_MESSAGE_SUCCESS);
			result.setStatusCode("200");
			logUtil.logInfo("作废申请单:"+payment.getId());
		} catch (Exception e) {
			logUtil.logInfo("作废申请单异常:"+e.getMessage());
			result.setMessage(e.getMessage());
			result.setStatusCode("300");
		}
		
		reslutJson=new ByteArrayInputStream(new Gson().toJson(result).getBytes("UTF-8")); 	
		return SUCCESS;
	}
	
	@Action(value="returnPayment",results={@org.apache.struts2.convention.annotation.Result(type="stream",
			params={
					"inputName", "reslutJson"
			})})
	public String returnPayment() throws UnsupportedEncodingException{
		try {
			Payment payment=paymentBIZ.getPayment(" where id='"+id+"'").get(0);
			payment.setStatus(PaymentStatus.RETURNPAYMENT);
			payment.setReturnDescription(returnDescription);
			
			
			paymentBIZ.returnPayment(payment);
			
			result.setMessage(Message.SAVE_MESSAGE_SUCCESS);
			result.setStatusCode("200");
			logUtil.logInfo("作废申请单:"+payment.getId());
		} catch (Exception e) {
			logUtil.logInfo("作废申请单异常:"+e.getMessage());
			result.setMessage(e.getMessage());
			result.setStatusCode("300");
		}
		
		reslutJson=new ByteArrayInputStream(new Gson().toJson(result).getBytes("UTF-8")); 	
		return SUCCESS;
	}
	
	@Action(value="rejectPayment",results={@org.apache.struts2.convention.annotation.Result(type="stream",
			params={
					"inputName", "reslutJson"
			})})
	public String rejectPayment() throws UnsupportedEncodingException{
		try {
			Payment payment=paymentBIZ.getPayment(" where id='"+id+"'").get(0);
			payment.setStatus(PaymentStatus.REJECTPAYMENT);
			
			paymentBIZ.rejectPayment(payment);
			
			result.setMessage(Message.SAVE_MESSAGE_SUCCESS);
			result.setStatusCode("200");
			logUtil.logInfo("付款申请单拒绝:"+payment.getId());
		} catch (Exception e) {
			logUtil.logInfo("付款申请单拒绝异常:"+e.getMessage());
			result.setMessage(e.getMessage());
			result.setStatusCode("300");
		}
		
		reslutJson=new ByteArrayInputStream(new Gson().toJson(result).getBytes("UTF-8")); 	
		return SUCCESS;
	}
	
	
	@Action(value="getPaymentByID",results={@org.apache.struts2.convention.annotation.Result(type="stream",
			params={
					"inputName", "reslutJson"
			})})
	public String getPaymentByID() throws UnsupportedEncodingException{

		Payment payment=new Payment();		
		try {
			payment=paymentBIZ.getPayment(" where id='"+id+"'").get(0);
			
			result.setMessage(Message.SAVE_MESSAGE_SUCCESS);
			result.setStatusCode("200");
			logUtil.logInfo("查询付款申请单:"+payment.getId());
		} catch (Exception e) {
			logUtil.logInfo("查询付款申请单异常:"+e.getMessage());
			result.setMessage(e.getMessage());
			result.setStatusCode("300");
		}
		
		reslutJson=new ByteArrayInputStream(new Gson().toJson(payment).getBytes("UTF-8")); 	
		return SUCCESS;
	}
	
	
	@Action(value="getPayment",results={@org.apache.struts2.convention.annotation.Result(type="stream",
			params={
					"inputName", "reslutJson"
			})})
	public String getPayment() throws UnsupportedEncodingException{
	
		User user=(User)session.getAttribute("user");
		String where="";
			
		if ("new".equals(queryType)) {
			where=" where status='0' and UID='"+user.getUid()+"'";
		}
		if ("acc".equals(queryType)) {
			where=" where status='1' and documentAudit='"+user.getUid()+"'";
		}
		if ("sign".equals(queryType)) {
			where=" where status='2' and deptManager='"+user.getUid()+"'";
		}
		if ("user".equals(queryType)) {
			where=" where UID='"+user.getUid()+"'";
		}
		List<Payment> list=paymentBIZ.getPayment(where, Integer.parseInt(pageSize),Integer.parseInt(pageCurrent));
		int total=paymentBIZ.getPayment(where).size();
		
		queryResult.setList(list);
		queryResult.setTotalRow(total);
		queryResult.setFirstPage(Integer.parseInt(pageCurrent)==1?true:false);
		queryResult.setPageNumber(Integer.parseInt(pageCurrent));
		queryResult.setLastPage(total/Integer.parseInt(pageSize) +1==Integer.parseInt(pageCurrent)&&Integer.parseInt(pageCurrent)!=1?true:false);
		queryResult.setTotalPage(total/Integer.parseInt(pageSize) +1);
		queryResult.setPageSize(Integer.parseInt(pageSize));
		String r=callback+"("+new Gson().toJson(queryResult)+")";
		
		reslutJson=new ByteArrayInputStream(r.getBytes("UTF-8")); 
		logUtil.logInfo("查询付款申请单:"+where);
		return SUCCESS;
	}
	
	
	public Payment paramToPayment(){
		Payment payment=new Payment();
		User user=(User)session.getAttribute("user");
		if (!"".equals(id)&&id!=null) {
			payment.setId(id);
			
		}
		payment.setUID(user.getUid());
		payment.setUName(user.getName());
		payment.setDepartmentID(user.getDepartment().getDid());
		payment.setDepartmentName(user.getDepartment().getName());
		payment.setApplicationDate(applicationDate);
		payment.setRequestPaymentDate(requestPaymentDate);
		payment.setContacturalPaymentDate(contacturalPaymentDate);
		payment.setUrgent(urgent==null?"0":urgent);
		payment.setPayType(payType);
		payment.setBeneficiary(beneficiary);
		payment.setBeneficiaryAccountNO(beneficiaryAccountNO);
		payment.setBeneficiaryChange(beneficiaryChange==null?"0":beneficiaryChange);
		payment.setBeneficiaryAccountNOChange(beneficiaryAccountNOChange==null?"0":beneficiaryAccountNOChange);
		payment.setSupplierCode(supplierCode);
		payment.setRefNoofBank(refNoofBank);
		payment.setPaymentSubject(paymentSubject);
		payment.setPaymentTerm(paymentTerm);
		
		payment.setPaymentDays_1(paymentDays_1);
		payment.setReceivingOrApprovalDate_1(receivingOrApprovalDate_1);
		payment.setPONo_1(PONo_1);
		payment.setCurrency_1(currency_1);
		payment.setAmount_1(amount_1);
		
		payment.setPaymentDays_2(paymentDays_2);
		payment.setReceivingOrApprovalDate_2(receivingOrApprovalDate_2);
		payment.setPONo_2(PONo_2);
		payment.setCurrency_2(currency_2);
		payment.setAmount_2(amount_2);
		
		payment.setPaymentDays_3(paymentDays_3);
		payment.setReceivingOrApprovalDate_3(receivingOrApprovalDate_3);
		payment.setPONo_3(PONo_3);
		payment.setCurrency_3(currency_3);
		payment.setAmount_3(amount_3);
		
		payment.setPaymentDays_4(paymentDays_4);
		payment.setReceivingOrApprovalDate_4(receivingOrApprovalDate_4);
		payment.setPONo_4(PONo_4);
		payment.setCurrency_4(currency_4);
		payment.setAmount_4(amount_4);
		
		payment.setPaymentDays_5(paymentDays_5);
		payment.setReceivingOrApprovalDate_5(receivingOrApprovalDate_5);
		payment.setPONo_5(PONo_5);
		payment.setCurrency_5(currency_5);
		payment.setAmount_5(amount_5);
		
		payment.setPaymentDays_6(paymentDays_6);
		payment.setReceivingOrApprovalDate_6(receivingOrApprovalDate_6);
		payment.setPONo_6(PONo_6);
		payment.setCurrency_6(currency_6);
		payment.setAmount_6(amount_6);
		
		payment.setUsageDescription(usageDescription);
		payment.setAmountInFigures(amountInFigures);
		payment.setDocumentAudit(documentAudit);
		payment.setInvoice(invoice);
		payment.setContract(contract);
		payment.setOther(other);
		
		return payment;
		
		
	}
	
}
