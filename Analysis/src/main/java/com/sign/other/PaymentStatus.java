package com.sign.other;

public class PaymentStatus {

	/**
	 * 已保存状态
	 */
	public final static String SAVEPAYMENT="0";
	
	/**
	 * 提交待审批
	 */
	public final static String SUBPAYMENT="1";
	
	/**
	 * 财务待审批
	 */
	public final static String ACCPAYMENT="4";
	
	
	/**
	 * 审批通过，待打印
	 */
	public final static String APPROVEPAYMENT="2";
	
	/**
	 * 审批不通过
	 */
	public final static String REJECTPAYMENT="9";
	
	/**
	 * 打印后状态
	 */
	public final static String PRINTPAYMENT="3";
	
	/**
	 * 作废状态
	 */
	public final static String INVALIDPAYMENT="6";
	
	/**
	 * 退回状态
	 */
	public final static String RETURNPAYMENT="0";
}
