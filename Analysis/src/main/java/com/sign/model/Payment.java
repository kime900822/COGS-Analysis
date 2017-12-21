package com.sign.model;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.springframework.stereotype.Component;


public class Payment {
	
	/**
	 * id
	 */
	private String id;
	
	/**
	 * 申请日期
	 */
	private String applicationDate;
	
	/**
	 * 要求付款日期
	 */
	private String requestPaymentDate;
	
	/**
	 * 合同付款日期
	 */
	private String contacturalPaymentDate;
	
	/**
	 * 流水码
	 */
	private String code;
	
	/**
	 * urgent
	 */
	private String urgent;
	
	/**
	 * 支付类型
	 */
	private String payType;
	
	/**
	 * 核心预付
	 */
	private String advanceWriteoff;
	
	/**
	 * 申请人ID
	 */
	private String UID;
	
	/**
	 * 申请人姓名
	 */
	private String UName;
	
	/**
	 * 申请部门ID
	 */
	private String departmentID;
	
	/**
	 * 申请部门名称
	 */
	private String departmentName;
	
	/**
	 * 收款人全称
	 */
	private String beneficiary;
	
	/**
	 * 银行账号
	 */
	private String beneficiaryAccountNO;
	
	/**
	 * 收款人变更标志
	 */
	private String beneficiaryChange;
	
	/**
	 * 银行账号变更标志
	 */
	private String beneficiaryAccountNOChange;
	
	/**
	 * 供应商代码
	 */
	private String supplierCode;
	
	/**
	 * 银行交易编码
	 */
	private String refNoofBank;
	
	/**
	 * 付款项目
	 */
	private String paymentSubject;
	
	/**
	 * 结算期
	 */
	private String paymentTerm;
	
	/**
	 * 结算天数
	 */
	private String paymentDays;
	
	/**
	 * 收货或验收日期
	 */
	private String receivingOrApprovalDate;
	
	/**
	 * 订单号
	 */	
	private String PONo;
	
	/**
	 * 币种
	 */
	private String currency;
	
	/**
	 * 金额
	 */
	private String amount;
	
	/**
	 * 支付用途
	 */
	private String usageDescription;
	
	/**
	 * 金额小写
	 */
	private String amountInFigures;
	
	/**
	 * 单据审核人
	 */
	private String documentAudit;
	
	/**
	 * 单据状态
	 */
	private String status;
	
	/**
	 * 发票地址
	 */
	private String invoice;
	
	/**
	 * 合同地址
	 */
	private String contract;
	
	/**
	 * 其他附件地址
	 */
	private String other;
	
	/**
	 * 作废原因
	 */
	private String invalidDescription;
	
	/**
	 * 回退原因
	 */
	private String rReturnDescription;
	
	/**
	 * 部门经理
	 */
	private String deptManager;
	
	/**
	 * 财务主管
	 */
	private String financeSupervisor;
	
	/**
	 * 财务经理
	 */
	private String financeManager;
	
	/**
	 * 总经理
	 */
	private String generalManager;
}

