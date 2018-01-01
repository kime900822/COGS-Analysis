package com.sign.action;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.google.gson.Gson;
import com.kime.action.ActionBase;
import com.kime.infoenum.Message;
import com.kime.model.User;
import com.sign.biz.PaymentBIZ;
import com.sign.model.Payment;
import com.sign.other.FileSave;

@Controller
public class PaymentAction extends ActionBase {

	@Autowired
	private PaymentBIZ paymentBIZ;
	@Autowired
	private FileSave fileSave;
    @Autowired  
    private  HttpSession session;   
	
	private File file;
	private String fileFileName;


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
	private String advanceWriteoff;
	private String UID;
	private String departmentID;
	private String beneficiary;
	private String beneficiaryAccountNO;
	private String beneficiaryChange;
	private String beneficiaryAccountNOChange;
	private String supplierCode;
	private String refNoofBank;
	private String paymentSubject;
	
	private String paymentDays_Advance;
	private String receivingOrApprovalDate_Advance;
	private String PONo_Advance;
	private String currency_Advance;
	private String amount_Advance;
	
	private String paymentDays_PaymentAtSight;
	private String receivingOrApprovalDate_PaymentAtSight;
	private String PONo_PaymentAtSight;
	private String currency_PaymentAtSight;
	private String amount_PaymentAtSight;
	
	private String paymentDays_UponReceiving;
	private String receivingOrApprovalDate_UponReceiving;
	private String PONo_UponReceiving;
	private String currency_UponReceiving;
	private String amount_UponReceiving;
	
	private String paymentDays_UponApproval;
	private String receivingOrApprovalDate_UponApproval;
	private String PONo_UponApproval;
	private String currency_UponApproval;
	private String amount_UponApproval;
	
	private String paymentDays_UponInvoice;
	private String receivingOrApprovalDate_UponInvoice;
	private String PONo_UponInvoice;
	private String currency_UponInvoice;
	private String amount_UponInvoice;
	
	private String paymentDays_Other;
	private String receivingOrApprovalDate_Other;
	private String PONo_Other;
	private String currency_Other;
	private String amount_Other;
	
	
	private String usageDescription;
	private String amountInFigures;
	private String documentAudit;
	private String status;
	private String invoice;
	private String contract;
	private String other;
	private String invalidDescription;
	private String rReturnDescription;
	private String deptManager;
	private String financeSupervisor;
	private String financeManager;
	private String generalManager;
	
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
	public String getAdvanceWriteoff() {
		return advanceWriteoff;
	}
	public void setAdvanceWriteoff(String advanceWriteoff) {
		this.advanceWriteoff = advanceWriteoff;
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

	public String getPaymentDays_Advance() {
		return paymentDays_Advance;
	}
	public void setPaymentDays_Advance(String paymentDays_Advance) {
		this.paymentDays_Advance = paymentDays_Advance;
	}
	public String getReceivingOrApprovalDate_Advance() {
		return receivingOrApprovalDate_Advance;
	}
	public void setReceivingOrApprovalDate_Advance(String receivingOrApprovalDate_Advance) {
		this.receivingOrApprovalDate_Advance = receivingOrApprovalDate_Advance;
	}
	public String getPONo_Advance() {
		return PONo_Advance;
	}
	public void setPONo_Advance(String pONo_Advance) {
		PONo_Advance = pONo_Advance;
	}
	public String getCurrency_Advance() {
		return currency_Advance;
	}
	public void setCurrency_Advance(String currency_Advance) {
		this.currency_Advance = currency_Advance;
	}
	public String getAmount_Advance() {
		return amount_Advance;
	}
	public void setAmount_Advance(String amount_Advance) {
		this.amount_Advance = amount_Advance;
	}
	public String getPaymentDays_PaymentAtSight() {
		return paymentDays_PaymentAtSight;
	}
	public void setPaymentDays_PaymentAtSight(String paymentDays_PaymentAtSight) {
		this.paymentDays_PaymentAtSight = paymentDays_PaymentAtSight;
	}
	public String getReceivingOrApprovalDate_PaymentAtSight() {
		return receivingOrApprovalDate_PaymentAtSight;
	}
	public void setReceivingOrApprovalDate_PaymentAtSight(String receivingOrApprovalDate_PaymentAtSight) {
		this.receivingOrApprovalDate_PaymentAtSight = receivingOrApprovalDate_PaymentAtSight;
	}
	public String getPONo_PaymentAtSight() {
		return PONo_PaymentAtSight;
	}
	public void setPONo_PaymentAtSight(String pONo_PaymentAtSight) {
		PONo_PaymentAtSight = pONo_PaymentAtSight;
	}
	public String getCurrency_PaymentAtSight() {
		return currency_PaymentAtSight;
	}
	public void setCurrency_PaymentAtSight(String currency_PaymentAtSight) {
		this.currency_PaymentAtSight = currency_PaymentAtSight;
	}
	public String getAmount_PaymentAtSight() {
		return amount_PaymentAtSight;
	}
	public void setAmount_PaymentAtSight(String amount_PaymentAtSight) {
		this.amount_PaymentAtSight = amount_PaymentAtSight;
	}
	public String getPaymentDays_UponReceiving() {
		return paymentDays_UponReceiving;
	}
	public void setPaymentDays_UponReceiving(String paymentDays_UponReceiving) {
		this.paymentDays_UponReceiving = paymentDays_UponReceiving;
	}
	public String getReceivingOrApprovalDate_UponReceiving() {
		return receivingOrApprovalDate_UponReceiving;
	}
	public void setReceivingOrApprovalDate_UponReceiving(String receivingOrApprovalDate_UponReceiving) {
		this.receivingOrApprovalDate_UponReceiving = receivingOrApprovalDate_UponReceiving;
	}
	public String getPONo_UponReceiving() {
		return PONo_UponReceiving;
	}
	public void setPONo_UponReceiving(String pONo_UponReceiving) {
		PONo_UponReceiving = pONo_UponReceiving;
	}
	public String getCurrency_UponReceiving() {
		return currency_UponReceiving;
	}
	public void setCurrency_UponReceiving(String currency_UponReceiving) {
		this.currency_UponReceiving = currency_UponReceiving;
	}
	public String getAmount_UponReceiving() {
		return amount_UponReceiving;
	}
	public void setAmount_UponReceiving(String amount_UponReceiving) {
		this.amount_UponReceiving = amount_UponReceiving;
	}
	public String getPaymentDays_UponApproval() {
		return paymentDays_UponApproval;
	}
	public void setPaymentDays_UponApproval(String paymentDays_UponApproval) {
		this.paymentDays_UponApproval = paymentDays_UponApproval;
	}
	public String getReceivingOrApprovalDate_UponApproval() {
		return receivingOrApprovalDate_UponApproval;
	}
	public void setReceivingOrApprovalDate_UponApproval(String receivingOrApprovalDate_UponApproval) {
		this.receivingOrApprovalDate_UponApproval = receivingOrApprovalDate_UponApproval;
	}
	public String getPONo_UponApproval() {
		return PONo_UponApproval;
	}
	public void setPONo_UponApproval(String pONo_UponApproval) {
		PONo_UponApproval = pONo_UponApproval;
	}
	public String getCurrency_UponApproval() {
		return currency_UponApproval;
	}
	public void setCurrency_UponApproval(String currency_UponApproval) {
		this.currency_UponApproval = currency_UponApproval;
	}
	public String getAmount_UponApproval() {
		return amount_UponApproval;
	}
	public void setAmount_UponApproval(String amount_UponApproval) {
		this.amount_UponApproval = amount_UponApproval;
	}
	public String getPaymentDays_UponInvoice() {
		return paymentDays_UponInvoice;
	}
	public void setPaymentDays_UponInvoice(String paymentDays_UponInvoice) {
		this.paymentDays_UponInvoice = paymentDays_UponInvoice;
	}
	public String getReceivingOrApprovalDate_UponInvoice() {
		return receivingOrApprovalDate_UponInvoice;
	}
	public void setReceivingOrApprovalDate_UponInvoice(String receivingOrApprovalDate_UponInvoice) {
		this.receivingOrApprovalDate_UponInvoice = receivingOrApprovalDate_UponInvoice;
	}
	public String getPONo_UponInvoice() {
		return PONo_UponInvoice;
	}
	public void setPONo_UponInvoice(String pONo_UponInvoice) {
		PONo_UponInvoice = pONo_UponInvoice;
	}
	public String getCurrency_UponInvoice() {
		return currency_UponInvoice;
	}
	public void setCurrency_UponInvoice(String currency_UponInvoice) {
		this.currency_UponInvoice = currency_UponInvoice;
	}
	public String getAmount_UponInvoice() {
		return amount_UponInvoice;
	}
	public void setAmount_UponInvoice(String amount_UponInvoice) {
		this.amount_UponInvoice = amount_UponInvoice;
	}
	public String getPaymentDays_Other() {
		return paymentDays_Other;
	}
	public void setPaymentDays_Other(String paymentDays_Other) {
		this.paymentDays_Other = paymentDays_Other;
	}
	public String getReceivingOrApprovalDate_Other() {
		return receivingOrApprovalDate_Other;
	}
	public void setReceivingOrApprovalDate_Other(String receivingOrApprovalDate_Other) {
		this.receivingOrApprovalDate_Other = receivingOrApprovalDate_Other;
	}
	public String getPONo_Other() {
		return PONo_Other;
	}
	public void setPONo_Other(String pONo_Other) {
		PONo_Other = pONo_Other;
	}
	public String getCurrency_Other() {
		return currency_Other;
	}
	public void setCurrency_Other(String currency_Other) {
		this.currency_Other = currency_Other;
	}
	public String getAmount_Other() {
		return amount_Other;
	}
	public void setAmount_Other(String amount_Other) {
		this.amount_Other = amount_Other;
	}
	public String getUsageDescription() {
		return usageDescription;
	}
	public void setUsageDescription(String usageDescription) {
		this.usageDescription = usageDescription;
	}
	public String getAmountInFigures() {
		return amountInFigures;
	}
	public void setAmountInFigures(String amountInFigures) {
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
	public String getrReturnDescription() {
		return rReturnDescription;
	}
	public void setrReturnDescription(String rReturnDescription) {
		this.rReturnDescription = rReturnDescription;
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
			payment.setStatus("0");
			
			paymentBIZ.savePayment(payment);
			
			result.setMessage(Message.SAVE_MESSAGE_SUCCESS);
			result.setStatusCode("200");
			logUtil.logInfo("新增付款申请单:"+payment.getId());
		} catch (Exception e) {
			logUtil.logInfo("新增付款申请单异常:"+e.getMessage());
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
			payment.setStatus("2");
			
			paymentBIZ.savePayment(payment);
			
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
			
			paymentBIZ.savePayment(payment);
			
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
	
	
	@Action(value="submitPayment",results={@org.apache.struts2.convention.annotation.Result(type="stream",
			params={
					"inputName", "reslutJson"
			})})
	public String submitPayment() throws UnsupportedEncodingException{
		try {
			Payment payment=paymentBIZ.getPayment(" where id='"+id+"'").get(0);
			payment.setStatus("1");
			
			paymentBIZ.savePayment(payment);
			
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
			payment.setStatus("5");
			
			paymentBIZ.savePayment(payment);
			
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
	
	@Action(value="rejectPayment",results={@org.apache.struts2.convention.annotation.Result(type="stream",
			params={
					"inputName", "reslutJson"
			})})
	public String rejectPayment() throws UnsupportedEncodingException{
		try {
			Payment payment=paymentBIZ.getPayment(" where id='"+id+"'").get(0);
			payment.setStatus("9");
			
			paymentBIZ.savePayment(payment);
			
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

		Payment payment=new Payment();		
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
		if ("".equals(id)||id==null) {
			payment.setId(id);
			
		}
		payment.setUID(user.getUid());
		payment.setUName(user.getName());
		payment.setDepartmentID(user.getDepartment().getDid());
		payment.setDepartmentName(user.getDepartment().getName());
		payment.setApplicationDate(applicationDate);
		payment.setRequestPaymentDate(requestPaymentDate);
		payment.setContacturalPaymentDate(contacturalPaymentDate);
		payment.setUrgent(urgent);
		payment.setPayType(payType);
		payment.setAdvanceWriteoff(advanceWriteoff);
		payment.setBeneficiary(beneficiary);
		payment.setBeneficiaryAccountNO(beneficiaryAccountNO);
		payment.setBeneficiaryChange(beneficiaryChange);
		payment.setBeneficiaryAccountNOChange(beneficiaryAccountNOChange);
		payment.setSupplierCode(supplierCode);
		payment.setRefNoofBank(refNoofBank);
		payment.setPaymentSubject(paymentSubject);
		
		payment.setPaymentDays_Advance(paymentDays_Advance);
		payment.setReceivingOrApprovalDate_Advance(receivingOrApprovalDate_Advance);
		payment.setPONo_Advance(PONo_Advance);
		payment.setCurrency_Advance(currency_Advance);
		payment.setAmount_Advance(amount_Advance);
		
		payment.setPaymentDays_PaymentAtSight(paymentDays_PaymentAtSight);
		payment.setReceivingOrApprovalDate_PaymentAtSight(receivingOrApprovalDate_PaymentAtSight);
		payment.setPONo_PaymentAtSight(PONo_PaymentAtSight);
		payment.setCurrency_PaymentAtSight(currency_PaymentAtSight);
		payment.setAmount_PaymentAtSight(amount_PaymentAtSight);
		
		payment.setPaymentDays_UponReceiving(paymentDays_UponReceiving);
		payment.setReceivingOrApprovalDate_UponReceiving(receivingOrApprovalDate_UponReceiving);
		payment.setPONo_UponReceiving(PONo_UponReceiving);
		payment.setCurrency_UponReceiving(currency_UponReceiving);
		payment.setAmount_UponReceiving(amount_UponReceiving);
		
		payment.setPaymentDays_UponApproval(paymentDays_UponApproval);
		payment.setReceivingOrApprovalDate_UponApproval(receivingOrApprovalDate_UponApproval);
		payment.setPONo_UponApproval(PONo_UponApproval);
		payment.setCurrency_UponApproval(currency_UponApproval);
		payment.setAmount_UponApproval(amount_UponApproval);
		
		payment.setPaymentDays_UponInvoice(paymentDays_UponInvoice);
		payment.setReceivingOrApprovalDate_UponInvoice(receivingOrApprovalDate_UponInvoice);
		payment.setPONo_UponInvoice(PONo_UponInvoice);
		payment.setCurrency_UponInvoice(currency_UponInvoice);
		payment.setAmount_UponInvoice(amount_UponInvoice);
		
		payment.setPaymentDays_Other(paymentDays_Other);
		payment.setReceivingOrApprovalDate_Other(receivingOrApprovalDate_Other);
		payment.setPONo_Other(PONo_Other);
		payment.setCurrency_Other(currency_Other);
		payment.setAmount_Other(amount_Other);
		
		payment.setUsageDescription(usageDescription);
		payment.setAmountInFigures(amountInFigures);
		payment.setDocumentAudit(documentAudit);
		payment.setInvoice(invoice);
		payment.setContract(contract);
		payment.setOther(other);
		
		return payment;
		
		
	}
	
}
