package com.sign.action;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.analysis.model.Sales;
import com.google.gson.Gson;
import com.kime.action.ActionBase;
import com.kime.infoenum.Message;
import com.kime.utils.ExcelUtil;
import com.sign.biz.PaymentBIZ;
import com.sign.other.FileSave;

@Controller
public class PaymentAction extends ActionBase {

	@Autowired
	private PaymentBIZ paymentBIZ;
	@Autowired
	private FileSave fileSave;
	
	
	private File file;
	private String fileFileName;


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

	private String id;
	private String applicationDate;
	private String requestPaymentDate;
	private String contacturalPaymentDate;
	private String code;
	private String urgent;
	private String payType;
	private String advanceWriteoff;
	private String UID;
	private String UName;
	private String departmentID;
	private String departmentName;
	private String beneficiary;
	private String beneficiaryAccountNO;
	private String beneficiaryChange;
	private String beneficiaryAccountNOChange;
	private String supplierCode;
	private String refNoofBank;
	private String paymentSubject;
	private String paymentTerm;
	private String paymentDays;
	private String receivingOrApprovalDate;
	private String PONo;
	private String currency;
	private String amount;
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
	public String getUName() {
		return UName;
	}
	public void setUName(String uName) {
		UName = uName;
	}
	public String getDepartmentID() {
		return departmentID;
	}
	public void setDepartmentID(String departmentID) {
		this.departmentID = departmentID;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
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
	public String getPaymentTerm() {
		return paymentTerm;
	}
	public void setPaymentTerm(String paymentTerm) {
		this.paymentTerm = paymentTerm;
	}
	public String getPaymentDays() {
		return paymentDays;
	}
	public void setPaymentDays(String paymentDays) {
		this.paymentDays = paymentDays;
	}
	public String getReceivingOrApprovalDate() {
		return receivingOrApprovalDate;
	}
	public void setReceivingOrApprovalDate(String receivingOrApprovalDate) {
		this.receivingOrApprovalDate = receivingOrApprovalDate;
	}
	public String getPONo() {
		return PONo;
	}
	public void setPONo(String pONo) {
		PONo = pONo;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
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
    public String  savefile() throws FileNotFoundException, IOException{
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
	
	
	
	
	
}
