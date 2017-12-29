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
	 * 结算天数-预付款
	 */
	@Column
	private String paymentDays_Advance;
	
	/**
	 * 收货或验收日期-预付款
	 */
	@Column
	private String receivingOrApprovalDate_Advance;
	
	/**
	 * 订单号-预付款
	 */	
	@Column
	private String PONo_Advance;
	
	/**
	 * 币种-预付款
	 */
	@Column
	private String currency_Advance;
	
	/**
	 * 金额-预付款
	 */
	@Column
	private String amount_Advance;
	
	/**
	 * 结算天数-见票即付
	 */
	@Column
	private String paymentDays_PaymentAtSight;
	
	/**
	 * 收货或验收日期-见票即付
	 */
	@Column
	private String receivingOrApprovalDate_PaymentAtSight;
	
	/**
	 * 订单号-见票即付
	 */	
	@Column
	private String PONo_PaymentAtSight;
	
	/**
	 * 币种-见票即付
	 */
	@Column
	private String currency_PaymentAtSight;
	
	/**
	 * 金额-见票即付
	 */
	@Column
	private String amount_PaymentAtSight;
	
	/**
	 * 结算天数-收货后
	 */
	@Column
	private String paymentDays_UponReceiving;
	
	/**
	 * 收货或验收日期-收货后
	 */
	@Column
	private String receivingOrApprovalDate_UponReceiving;
	
	/**
	 * 订单号-收货后
	 */	
	@Column
	private String PONo_UponReceiving;
	
	/**
	 * 币种-收货后
	 */
	@Column
	private String currency_UponReceiving;
	
	/**
	 * 金额-收货后
	 */
	@Column
	private String amount_UponReceiving;
	
	/**
	 * 结算天数-验收后
	 */
	@Column
	private String paymentDays_UponApproval;
	
	/**
	 * 收货或验收日期-验收后
	 */
	@Column
	private String receivingOrApprovalDate_UponApproval;
	
	/**
	 * 订单号-验收后
	 */	
	@Column
	private String PONo_UponApproval;
	
	/**
	 * 币种-验收后
	 */
	@Column
	private String currency_UponApproval;
	
	/**
	 * 金额-验收后
	 */
	@Column
	private String amount_UponApproval;
	
	/**
	 * 结算天数-见票后
	 */
	@Column
	private String paymentDays_UponInvoice;
	
	/**
	 * 收货或验收日期-见票后
	 */
	@Column
	private String receivingOrApprovalDate_UponInvoice;
	
	/**
	 * 订单号-见票后
	 */	
	@Column
	private String PONo_UponInvoice;
	
	/**
	 * 币种-见票后
	 */
	@Column
	private String currency_UponInvoice;
	
	/**
	 * 金额-见票后
	 */
	@Column
	private String amount_UponInvoice;
	
	/**
	 * 结算天数-其他
	 */
	@Column
	private String paymentDays_Other;
	
	/**
	 * 收货或验收日期-其他
	 */
	@Column
	private String receivingOrApprovalDate_Other;
	
	/**
	 * 订单号-其他
	 */	
	@Column
	private String PONo_Other;
	
	/**
	 * 币种-其他
	 */
	@Column
	private String currency_Other;
	
	/**
	 * 金额-其他
	 */
	@Column
	private String amount_Other;
	
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
	
	
}

