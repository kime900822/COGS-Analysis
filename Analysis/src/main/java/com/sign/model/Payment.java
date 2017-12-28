package com.sign.model;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.stereotype.Component;

@Component
@Entity@Table(name="t_payment")
public class Payment {
	
	/**
	 * id
	 */
	@Id
	@GeneratedValue(generator="uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	private String id;
	
	/**
	 * 申请日期
	 */
	@Column
	private String applicationDate;
	
	/**
	 * 要求付款日期
	 */
	@Column
	private String requestPaymentDate;
	
	/**
	 * 合同付款日期
	 */
	@Column
	private String contacturalPaymentDate;
	
	/**
	 * 流水码
	 */
	@Column
	private String code;
	
	/**
	 * urgent
	 */
	@Column
	private String urgent;
	
	/**
	 * 支付类型
	 */
	@Column
	private String payType;
	
	/**
	 * 核销预付
	 */
	@Column
	private String advanceWriteoff;
	
	/**
	 * 申请人ID
	 */
	@Column
	private String UID;
	
	/**
	 * 申请人姓名
	 */
	@Column
	private String UName;
	
	/**
	 * 申请部门ID
	 */
	@Column
	private String departmentID;
	
	/**
	 * 申请部门名称
	 */
	@Column
	private String departmentName;
	
	/**
	 * 收款人全称
	 */
	@Column
	private String beneficiary;
	
	/**
	 * 银行账号
	 */
	@Column
	private String beneficiaryAccountNO;
	
	/**
	 * 收款人变更标志
	 */
	@Column
	private String beneficiaryChange;
	
	/**
	 * 银行账号变更标志
	 */
	@Column
	private String beneficiaryAccountNOChange;
	
	/**
	 * 供应商代码
	 */
	@Column
	private String supplierCode;
	
	/**
	 * 银行交易编码
	 */
	@Column
	private String refNoofBank;
	
	/**
	 * 付款项目
	 */
	@Column
	private String paymentSubject;
	
	/**
	 * 结算期
	 */
	@Column
	private String paymentTerm;
	
	/**
	 * 结算天数
	 */
	@Column
	private String paymentDays;
	
	/**
	 * 收货或验收日期
	 */
	@Column
	private String receivingOrApprovalDate;
	
	/**
	 * 订单号
	 */	
	@Column
	private String PONo;
	
	/**
	 * 币种
	 */
	@Column
	private String currency;
	
	/**
	 * 金额
	 */
	@Column
	private String amount;
	
	/**
	 * 支付用途
	 */
	@Column
	private String usageDescription;
	
	/**
	 * 金额小写
	 */
	@Column
	private String amountInFigures;
	
	/**
	 * 单据审核人
	 */
	@Column
	private String documentAudit;
	
	/**
	 * 单据状态
	 */
	@Column
	private String status;
	
	/**
	 * 发票地址
	 */
	@Column
	private String invoice;
	
	/**
	 * 合同地址
	 */
	@Column
	private String contract;
	
	/**
	 * 其他附件地址
	 */
	@Column
	private String other;
	
	/**
	 * 作废原因
	 */
	@Column
	private String invalidDescription;
	
	/**
	 * 回退原因
	 */
	@Column
	private String rReturnDescription;
	
	/**
	 * 部门经理
	 */
	@Column
	private String deptManager;
	
	/**
	 * 财务主管
	 */
	@Column
	private String financeSupervisor;
	
	/**
	 * 财务经理
	 */
	@Column
	private String financeManager;
	
	/**
	 * 总经理
	 */
	@Column
	private String generalManager;

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
	
	
}

