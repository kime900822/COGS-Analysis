<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function(){
	
	//初始化全部缩进
	$('tr.table-parent').each(
			function(){
				  $(this)
				  .toggleClass("table-selected") 
				  .siblings('.child_'+this.id).toggle();
	});
	
	//表格缩进展开
	$('tr.table-parent').click(function(){ 
		  $(this)
		  .toggleClass("table-selected") 
		  .siblings('.child_'+this.id).toggle(); 
	});
	
	//初始化金额
	changeAmount();
	
	BJUI.ajax('doajax', {
	    url: 'getAllBeneficiary.action',
	    loadingmask: true,
	    okCallback: function(json, options) {
            $.each(json, function (i, item) {
                $.CurrentNavtab.find('#j_payment_beneficiary').append("<option value='" + item.accno + "'>" + item.name + "</option>")           
            })
            $.CurrentNavtab.find('#j_payment_beneficiary').selectpicker('val','${param.beneficiary}');
            $.CurrentNavtab.find('#j_payment_beneficiary').selectpicker('refresh');
	    }
	});	

	$.CurrentNavtab.find('#payment-save').click(function(){		
		$.CurrentNavtab.find("#j_payment_form").attr("action", "savePayment.action").submit();
	});
	
	

	
	
	
})


function getPayment(){
	if('${param.id}'!=null&&'${param.id}'!=''){
		BJUI.ajax('doajax', {
		    url: 'getPaymentByID.action',
		    data:{id:'${param.id}',queryType:'${param.queryType}'},
		    loadingmask: true,
		    okCallback: function(json, options) {
		    	showButton(json.status);				
		    	dataToFace(json);
		    }
		});	
		
	}else{
		showButton('0');				
	}	
}


function showButton(status){
	if(status=='0'){//新建
		$.CurrentNavtab.find('#payment-save').show();
		$.CurrentNavtab.find('#payment-submit').hide();
		$.CurrentNavtab.find('#payment-approve').hide();
		$.CurrentNavtab.find('#payment-Reject').hide();
		$.CurrentNavtab.find('#payment-assign').hide();
		$.CurrentNavtab.find('#payment-Print').hide();
		$.CurrentNavtab.find('#payment-invalid-tr').hide();
		$.CurrentNavtab.find('#payment-return-tr').hide();	
		$.CurrentNavtab.find('#j_file_upload2').show();
		$.CurrentNavtab.find('#j_file_upload1').show();
		$.CurrentNavtab.find('#j_file_download1').hide();
		$.CurrentNavtab.find('#j_file_download1').hide();
	}else if(status=='1'){//保存后可提交
		$.CurrentNavtab.find('#payment-save').show();
		$.CurrentNavtab.find('#payment-submit').show();
		$.CurrentNavtab.find('#payment-approve').hide();
		$.CurrentNavtab.find('#payment-Reject').hide();
		$.CurrentNavtab.find('#payment-assign').hide();
		$.CurrentNavtab.find('#payment-Print').hide();
		$.CurrentNavtab.find('#payment-invalid-tr').hide();
		$.CurrentNavtab.find('#payment-return-tr').hide();	
		$.CurrentNavtab.find('#j_file_upload2').show();
		$.CurrentNavtab.find('#j_file_upload1').show();
		$.CurrentNavtab.find('#j_file_download1').hide();
		$.CurrentNavtab.find('#j_file_download1').hide();
	}else if(status="2"){//财务处理
		$.CurrentNavtab.find('#payment-save').hide();
		$.CurrentNavtab.find('#payment-submit').hide();
		$.CurrentNavtab.find('#payment-approve').hide();
		$.CurrentNavtab.find('#payment-Reject').hide();
		$.CurrentNavtab.find('#payment-assign').show();
		$.CurrentNavtab.find('#payment-Print').hide();
		$.CurrentNavtab.find('#payment-invalid-tr').hide();
		$.CurrentNavtab.find('#payment-return-tr').hide();
		$.CurrentNavtab.find('#j_file_upload2').hide();
		$.CurrentNavtab.find('#j_file_upload1').hide();
		$.CurrentNavtab.find('#j_file_download1').show();
		$.CurrentNavtab.find('#j_file_download1').show();
		$
	}else if(status="3"){//部门经理审批
		$.CurrentNavtab.find('#payment-save').hide();
		$.CurrentNavtab.find('#payment-submit').hide();
		$.CurrentNavtab.find('#payment-approve').show();
		$.CurrentNavtab.find('#payment-Reject').show();
		$.CurrentNavtab.find('#payment-assign').hide();
		$.CurrentNavtab.find('#payment-Print').hide();
		$.CurrentNavtab.find('#payment-invalid-tr').hide();
		$.CurrentNavtab.find('#payment-return-tr').hide();		
		$.CurrentNavtab.find('#j_file_upload2').hide();
		$.CurrentNavtab.find('#j_file_upload1').hide();
		$.CurrentNavtab.find('#j_file_download1').show();
		$.CurrentNavtab.find('#j_file_download1').show();
	}else if(status="4"){//审批通过
		$.CurrentNavtab.find('#payment-save').hide();
		$.CurrentNavtab.find('#payment-submit').hide();
		$.CurrentNavtab.find('#payment-approve').hide();
		$.CurrentNavtab.find('#payment-Reject').hide();
		$.CurrentNavtab.find('#payment-assign').hide();
		$.CurrentNavtab.find('#payment-Print').show();
		$.CurrentNavtab.find('#payment-invalid-tr').hide();
		$.CurrentNavtab.find('#payment-return-tr').hide();	
		$.CurrentNavtab.find('#j_file_upload2').hide();
		$.CurrentNavtab.find('#j_file_upload1').hide();
		$.CurrentNavtab.find('#j_file_download1').show();
		$.CurrentNavtab.find('#j_file_download1').show();
	}else if(status="5"){//审批未通过，单据作废，
		$.CurrentNavtab.find('#payment-save').hide();
		$.CurrentNavtab.find('#payment-submit').hide();
		$.CurrentNavtab.find('#payment-approve').hide();
		$.CurrentNavtab.find('#payment-Reject').hide();
		$.CurrentNavtab.find('#payment-assign').hide();
		$.CurrentNavtab.find('#payment-Print').hide();
		$.CurrentNavtab.find('#payment-invalid-tr').hide();
		$.CurrentNavtab.find('#payment-return-tr').hide();	
		$.CurrentNavtab.find('#j_file_upload2').hide();
		$.CurrentNavtab.find('#j_file_upload1').hide();
		$.CurrentNavtab.find('#j_file_download1').show();
		$.CurrentNavtab.find('#j_file_download1').show();
	}else if(status="6"){//打印后
		$.CurrentNavtab.find('#payment-save').hide();
		$.CurrentNavtab.find('#payment-submit').hide();
		$.CurrentNavtab.find('#payment-approve').hide();
		$.CurrentNavtab.find('#payment-Reject').hide();
		$.CurrentNavtab.find('#payment-assign').hide();
		$.CurrentNavtab.find('#payment-Print').hide();
		$.CurrentNavtab.find('#payment-invalid-tr').show();
		$.CurrentNavtab.find('#payment-return-tr').show();	
		$.CurrentNavtab.find('#j_file_upload2').hide();
		$.CurrentNavtab.find('#j_file_upload1').hide();
		$.CurrentNavtab.find('#j_file_download1').show();
		$.CurrentNavtab.find('#j_file_download1').show();
	}else if(status="7"){//单据作废
		$.CurrentNavtab.find('#payment-save').hide();
		$.CurrentNavtab.find('#payment-submit').hide();
		$.CurrentNavtab.find('#payment-approve').hide();
		$.CurrentNavtab.find('#payment-Reject').hide();
		$.CurrentNavtab.find('#payment-assign').hide();
		$.CurrentNavtab.find('#payment-Print').hide();
		$.CurrentNavtab.find('#payment-invalid-tr').hide();
		$.CurrentNavtab.find('#payment-return-tr').hide();	
		$.CurrentNavtab.find('#j_file_upload2').hide();
		$.CurrentNavtab.find('#j_file_upload1').hide();
		$.CurrentNavtab.find('#j_file_download1').show();
		$.CurrentNavtab.find('#j_file_download1').show();
	}
	
	
	
}

function changeBeneficiary(){
	$.CurrentNavtab.find('#j_payment_beneficiaryAccountNO').val($.CurrentNavtab.find('#j_payment_beneficiary').val())
}

function dataToFace(o){
	$.CurrentNavtab.find("#j_payment_applicationDate").val(o.applicationDate);
	$.CurrentNavtab.find("#j_payment_requestPaymentDate").val(o.requestPaymentDate);
	$.CurrentNavtab.find("#j_payment_contacturalPaymentDate").val(o.contacturalPaymentDate);
	$.CurrentNavtab.find("#j_payment_code").val(o.code);
	if(o.payType=='Cash'){
		$.CurrentNavtab.find("#j_payment_cash").get(0).checked=true; 
	}else if(o.payType=='Banking'){
		$.CurrentNavtab.find("#j_payment_banking").get(0).checked=true; 
	}
	if(o.advanceWriteoff=='1'){
		$.CurrentNavtab.find("#j_payment_advanceWriteoff").get(0).checked=true; 
	}
	if(o.urgent=='1'){
		$.CurrentNavtab.find("#j_payment_urgent").get(0).checked=true; 
	}
	$.CurrentNavtab.find("#j_payment_UID").val(o.uid+'-'+o.uname);
	$.CurrentNavtab.find("#j_payment_departmentID").val(o.departmentName+'-'+o.departmentID);
	$.CurrentNavtab.find("#j_payment_beneficiary").selectpicker('val',o.beneficiary);
    $.CurrentNavtab.find('#j_payment_beneficiary').selectpicker('refresh');
    if(o.beneficiaryChange=='1'){
		$.CurrentNavtab.find("#j_payment_beneficiaryChange").get(0).checked=true; 
	}
    if(o.beneficiaryAccountNOChange=='1'){
		$.CurrentNavtab.find("#j_payment_beneficiaryAccountNOChange").get(0).checked=true; 
	}
    $.CurrentNavtab.find("#j_payment_paymentSubject").selectpicker('val',o.paymentSubject);
    $.CurrentNavtab.find('#j_payment_paymentSubject').selectpicker('refresh');
    
	$.CurrentNavtab.find("#j_payment_paymentDays_Advance").val(o.paymentDays_Advance);
	$.CurrentNavtab.find("#j_payment_receivingOrApprovalDate_Advance").val(o.receivingOrApprovalDate_Advance);
	$.CurrentNavtab.find("#j_payment_PONo_Advance").val(o.PONo_Advance);
	$.CurrentNavtab.find("#j_payment_currency_Advance").selectpicker('val',o.currency_Advance);
    $.CurrentNavtab.find('#j_payment_currency_Advance').selectpicker('refresh');
	$.CurrentNavtab.find("#j_payment_amount_Advance").val(o.amount_Advance);
	
	$.CurrentNavtab.find("#j_payment_paymentDays_PaymentAtSight").val(o.paymentDays_PaymentAtSight);
	$.CurrentNavtab.find("#j_payment_receivingOrApprovalDate_PaymentAtSight").val(o.receivingOrApprovalDate_PaymentAtSight);
	$.CurrentNavtab.find("#j_payment_PONo_PaymentAtSight").val(o.PONo_PaymentAtSight);
	$.CurrentNavtab.find("#j_payment_currency_PaymentAtSight").selectpicker('val',o.currency_PaymentAtSight);
	$.CurrentNavtab.find('#j_payment_currency_PaymentAtSight').selectpicker('refresh');
	$.CurrentNavtab.find("#j_payment_amount_PaymentAtSight").val(o.amount_PaymentAtSight);
	
	$.CurrentNavtab.find("#j_payment_paymentDays_UponReceiving").val(o.paymentDays_UponReceiving);
	$.CurrentNavtab.find("#j_payment_receivingOrApprovalDate_UponReceiving").val(o.receivingOrApprovalDate_UponReceiving);
	$.CurrentNavtab.find("#j_payment_PONo_UponReceiving").val(o.PONo_UponReceiving);
	$.CurrentNavtab.find("#j_payment_currency_UponReceiving").selectpicker('val',o.currency_UponReceiving);
	$.CurrentNavtab.find('#j_payment_currency_UponReceiving').selectpicker('refresh');
	$.CurrentNavtab.find("#j_payment_amount_UponReceiving").val(o.amount_UponReceiving);
	
	$.CurrentNavtab.find("#j_payment_paymentDays_UponApproval").val(o.paymentDays_UponApproval);
	$.CurrentNavtab.find("#j_payment_receivingOrApprovalDate_UponApproval").val(o.receivingOrApprovalDate_UponApproval);
	$.CurrentNavtab.find("#j_payment_PONo_UponApproval").val(o.PONo_UponApproval);
	$.CurrentNavtab.find("#j_payment_currency_UponApproval").selectpicker('val',o.currency_UponApproval);
	$.CurrentNavtab.find('#j_payment_currency_UponApproval').selectpicker('refresh');
	$.CurrentNavtab.find("#j_payment_amount_UponApproval").val(o.amount_UponApproval);
	
	$.CurrentNavtab.find("#j_payment_paymentDays_UponInvoice").val(o.paymentDays_UponInvoice);
	$.CurrentNavtab.find("#j_payment_receivingOrApprovalDate_UponInvoice").val(o.receivingOrApprovalDate_UponInvoice);
	$.CurrentNavtab.find("#j_payment_PONo_UponInvoice").val(o.PONo_UponInvoice);
	$.CurrentNavtab.find("#j_payment_currency_UponInvoice").selectpicker('val',o.currency_UponInvoice);
	$.CurrentNavtab.find('#j_payment_currency_UponInvoice').selectpicker('refresh');
	$.CurrentNavtab.find("#j_payment_amount_UponInvoice").val(o.amount_UponInvoice);
	
	$.CurrentNavtab.find("#j_payment_paymentDays_UponInvoice").val(o.paymentDays_UponInvoice);
	$.CurrentNavtab.find("#j_payment_receivingOrApprovalDate_UponInvoice").val(o.receivingOrApprovalDate_UponInvoice);
	$.CurrentNavtab.find("#j_payment_PONo_UponInvoice").val(o.PONo_UponInvoice);
	$.CurrentNavtab.find("#j_payment_currency_UponInvoice").selectpicker('val',o.currency_UponInvoice);
	$.CurrentNavtab.find('#j_payment_currency_UponInvoice').selectpicker('refresh');
	$.CurrentNavtab.find("#j_payment_amount_UponInvoice").val(o.amount_UponInvoice);
	
	$.CurrentNavtab.find("#j_payment_paymentDays_Other").val(o.paymentDays_Other);
	$.CurrentNavtab.find("#j_payment_receivingOrApprovalDate_Other").val(o.receivingOrApprovalDate_Other);
	$.CurrentNavtab.find("#j_payment_PONo_Other").val(o.PONo_Other);
	$.CurrentNavtab.find("#j_payment_currency_Other").selectpicker('val',o.currency_Other);
	$.CurrentNavtab.find('#j_payment_currency_Other').selectpicker('refresh');
	$.CurrentNavtab.find("#j_payment_amount_Other").val(o.amount_Other);
	
	$.CurrentNavtab.find("#j_payment_supplierCode").val(o.supplierCode);
	$.CurrentNavtab.find("#j_payment_refNoofBank").val(o.refNoofBank);
	$.CurrentNavtab.find("#j_payment_usageDescription").val(o.usageDescription);
	$.CurrentNavtab.find("#j_payment_amountInFigures").val(o.amountInFigures);
	$.CurrentNavtab.find("#j_payment_documentAudit").val(o.documentAudit);
	$.CurrentNavtab.find("#j_payment_deptManager").val(o.deptManager);
	
	$.CurrentNavtab.find("#j_file_Invoice").attr("href",o.invoice).html(o.invoice);
	$.CurrentNavtab.find("#j_file_Contract").attr("href",o.contract).html(o.contract);
	$.CurrentNavtab.find("#j_file_Other").attr("href",o.other).html(o.other);
	
	$.CurrentNavtab.find("#j_payment_id").val(o.id);
	$.CurrentNavtab.find("#j_payment_status").val(o.status);
	
}

//金额变动
function changeAmount(){
	var amount1=$.CurrentNavtab.find("#j_payment_amount_Advance").val();
	var amount2=$.CurrentNavtab.find("#j_payment_amount_PaymentAtSight").val();
	var amount3=$.CurrentNavtab.find("#j_payment_amount_UponReceiving").val();
	var amount4=$.CurrentNavtab.find("#j_payment_amount_UponApproval").val();
	var amount5=$.CurrentNavtab.find("#j_payment_amount_UponInvoice").val();
	var amount6=$.CurrentNavtab.find("#j_payment_amount_Other").val();
	var total=0;
	if(amount1!=""){
		total+=parseFloat(amount1);
	}
	if(amount2!=""){
		total+=parseFloat(amount2);
	}
	if(amount3!=""){
		total+=parseFloat(amount3);
	}
	if(amount4!=""){
		total+=parseFloat(amount4);
	}
	if(amount5!=""){
		total+=parseFloat(amount5);
	}
	if(amount6!=""){
		total+=parseFloat(amount6);
	}
	$.CurrentNavtab.find("#j_payment_amountInFigures").val(total);
	$.CurrentNavtab.find("#j_payment_amountInWords").val(smalltoBIG(total));
	
	$.CurrentNavtab.find("#row_01_title").html("Advance预付款 &nbsp&nbsp&nbsp&nbsp Amount(金额):"+amount1);
	$.CurrentNavtab.find("#row_02_title").html("Payment at sight 见票即付 &nbsp&nbsp&nbsp&nbsp Amount(金额):"+amount2);
	$.CurrentNavtab.find("#row_03_title").html("Upon receiving 收货后 &nbsp&nbsp&nbsp&nbsp  Amount(金额):"+amount3);
	$.CurrentNavtab.find("#row_04_title").html("Upon Approval 验收后 &nbsp&nbsp&nbsp&nbsp  Amount(金额):"+amount4);
	$.CurrentNavtab.find("#row_05_title").html("Upon invoice 见票后 &nbsp&nbsp&nbsp&nbsp  Amount(金额):"+amount5);
	$.CurrentNavtab.find("#row_06_title").html("Other 其他 &nbsp&nbsp&nbsp&nbsp  Amount(金额):"+amount6);
	
	
	
}


</script>
<div class="bjui-pageContent">
    <div class="bs-example" style="width:800px">
        <form id="j_payment_form" data-toggle="ajaxform">
			<input type="hidden" name="id" id="j_payment_id" value="">
			<input type="hidden" name="status" id="j_payment_status" value="">
            <div class="bjui-row-0" align="center">
            <h2 class="row-label">Payment Application Form 付款申请单</h2><br> 
            </div>
			<table class="table" style="font-size:8px;">
				<tr>
					<td width="200px">Application Date<br>申请日期）</td>
					<td width="200px"><input type="text" name="applicationDate" id="j_payment_applicationDate" value="" data-toggle="datepicker" data-rule="required;date"></td>
					<td width="200px">Request Payment Date<br>(要求付款日期）</td>
					<td width="200px"><input type="text" name="requestPaymentDate" id="j_payment_requestPaymentDate" value="" data-toggle="datepicker" data-rule="required;date"></td>					
				</tr>
				<tr>
					<td>
						Contactural Payment Date<br>（合同付款日期）
					</td>
					<td>
						<input type="text" name="contacturalPaymentDate" value="" id="j_payment_contacturalPaymentDate"  data-toggle="datepicker" data-rule="required;date">
					</td>
					<td>
						CODE(流水码)
					</td>
					<td>
						<input type="text" name="code" value="" readonly="" id="j_payment_code" size="17">
					</td>					
				</tr>
				<tr>
					<td>
						支付现金 <br>Cash
					</td>
					<td>
						<input type="radio" name="payType" data-toggle="icheck" id="j_payment_cash" value="Cash" data-label="">
					</td>
					<td>
						银行支付<br> Banking
					</td>
					<td>
						<input type="radio" name="payType" data-toggle="icheck" id="j_payment_banking" value="Banking" data-label="">
					</td>					
				</tr>
				<tr>
					<td>
						核销预付 <br>Advance Write-off (Amount) .
					</td>
					<td>
						<input type="checkbox" name="advanceWriteoff" data-toggle="icheck" id="j_payment_advanceWriteoff" value="1" data-label="">
					</td>
					<td>
						Urgent
					</td>
					<td>
						<input type="checkbox" name="urgent"  data-toggle="icheck" id="j_payment_urgent" value="1" data-label="">
					</td>					
				</tr>
				<tr>
					<td>
						申请人<br>Applicant:
					</td>
					<td>
						<input type="text" name="UID" value="${user.uid}-${user.name}" id="j_payment_UID" readonly="" data-rule="required" size="17">
					</td>
					<td>
						所属部门<br>Department of Applicant:
					</td>
					<td>
						<input type="text" name="departmentID" value="${user.department.name}-${user.department.did}" id="j_payment_departmentID" readonly="" data-rule="required" size="17">
					</td>					
				</tr>
				<tr>
					<td>
						收款人（全称）<br>Beneficiary:
					</td>
					<td>
						<select name="beneficiary" id="j_payment_beneficiary" data-toggle="selectpicker" data-rule="required" onchange="changeBeneficiary()" data-width="170px">
                        	<option value=""></option>
                    	</select>
					</td>
					<td>
						银行及帐号<br>Beneficiary Account NO.
					</td>
					<td>
						<input type="text" name="beneficiaryAccountNO" id="j_payment_beneficiaryAccountNO" value="" readonly="" data-rule="required" size="17">
					</td>					
				</tr>
				<tr>
					<td>
						变更<br>Change
					</td>
					<td>
						<input type="checkbox" name="beneficiaryChange" id="j_payment_beneficiaryChange" data-toggle="icheck" value="1" data-label="">
					</td>
					<td>
						变更<br>Change
					</td>
					<td>
						<input type="checkbox" name="beneficiaryAccountNOChange" id="j_payment_beneficiaryAccountNOChange" data-toggle="icheck" value="1" data-label="">
					</td>					
				</tr>
				
				<!-- 付款   -->
				<tr>
					<td>
						付款项目<br>Payment Subject
					</td>
					<td>
						<select name="paymentSubject" data-toggle="selectpicker" id="j_payment_paymentSubject"  data-rule="required" data-width="170px">
	                        <option value=""></option>
	                        <option value="1">Fixed Asset 固定资产</option>
	                        <option value="2">Raw Material 原材料</option>
	                        <option value="3">Consumable 消耗品</option>
	                        <option value="4">Subcontractor 外包</option>
	                        <option value="5">Service 服务</option>
	                        <option value="6">Petty Cash备用金</option>
	                        <option value="7">Other 其他</option>
                    	</select>
					</td>
					<td colspan="2">
					</td>					
				</tr>
				
				<!-- Advance预付款 -->
				<tr class="table-parent" id="row_01">
					<td colspan="4">
						<label id="row_01_title">Advance预付款</label>
					</td>
				</tr>
				<tr class="child_row_01">
					<td>
						结算期 <br>Payment Term
					</td>
					<td>
						<input type="text" name="paymentDays_Advance" id="j_payment_paymentDays_Advance" value="" size="17">
					</td>
					<td>
						收货或验收日期<br>Receiving or Approval date
					</td>
					<td>
						<input type="text" name="receivingOrApprovalDate_Advance" id="j_payment_receivingOrApprovalDate_Advance" value="" data-toggle="datepicker" data-rule="date">
					</td>
				</tr>
				<tr class="child_row_01">
					<td>
						订单号<br>PO No.
					</td>
					<td>
						<input type="text" name="PONo_Advance" id="j_payment_PONo_Advance"  value="" size="17" >
					</td>
					<td>
						<label class="row-label">币别<br>Currency</label>
					</td>
					<td>
						<select name="currency_Advance" data-toggle="selectpicker" id="j_payment_currency_Advance" data-width="170px">
	                        <option value=""></option>
	                        <option value="RMB">RMB</option>
	                        <option value="USD">USD</option>
	                        <option value="EUR">EUR</option>
	                        <option value="GBP">GBP</option>
                    	</select>
					</td>
				</tr>
				<tr class="child_row_01">
					<td>
						金额<br>Amount
					</td>
					<td>
						<input type="text" name="amount_Advance" id="j_payment_amount_Advance" value="" data-rule="number" onchange="changeAmount()" size="17">
					</td>
					<td colspan="2">
					</td>
				</tr>
				
				
				<!-- Payment at sight 见票即付-->
				<tr class="table-parent" id="row_02">
					<td colspan="4">
						<label id="row_02_title">Payment at sight 见票即付</label>					
					</td>
				</tr>
				<tr class="child_row_02">
					<td>
						结算期 <br>Payment Term
					</td>
					<td>
						<input type="text" name="paymentDays_PaymentAtSight" id="j_payment_paymentDays_PaymentAtSight" value="" size="17">
					</td>
					<td>
						收货或验收日期<br>Receiving or Approval date
					</td>
					<td>
						<input type="text" name="receivingOrApprovalDate_PaymentAtSight" id="j_payment_receivingOrApprovalDate_PaymentAtSight" value="" size="17" data-toggle="datepicker" data-rule="date">
					</td>
				</tr>
				<tr class="child_row_02">
					<td>
						订单号<br>PO No.
					</td>
					<td>
						<input type="text" name="PONo"  value="" size="17">
					</td>
					<td>
						<label class="row-label">币别<br>Currency</label>
					</td>
					<td>
						<select name="currency_PaymentAtSight" id="j_payment_currency_PaymentAtSight" data-toggle="selectpicker" data-width="170px">
	                        <option value=""></option>
	                        <option value="RMB">RMB</option>
	                        <option value="USD">USD</option>
	                        <option value="EUR">EUR</option>
	                        <option value="GBP">GBP</option>
                    	</select>
					</td>
				</tr>
				<tr class="child_row_02">
					<td>
						金额<br>Amount
					</td>
					<td>
						<input type="text" name="amount_PaymentAtSight" id="j_payment_amount_PaymentAtSight" value="" data-rule="number" size="17" onchange="changeAmount()">
					</td>
					<td colspan="2">
					</td>
				</tr>
				
				<!-- Upon receiving 收货后 -->
				<tr class="table-parent" id="row_03">
					<td colspan="4">
						<label id="row_03_title">Upon receiving 收货后</label>						
					</td>
				</tr>
				<tr class="child_row_03">
					<td>
						结算期 <br>Payment Term
					</td>
					<td>
						<input type="text" name="paymentDays_UponReceiving" id="j_payment_paymentDays_UponReceiving" value="" size="17">
					</td>
					<td>
						收货或验收日期<br>Receiving or Approval date
					</td>
					<td>
						<input type="text" name="receivingOrApprovalDate_UponReceiving" id="j_payment_receivingOrApprovalDate_UponReceiving" size="17"  value="" data-toggle="datepicker" data-rule="date">
					</td>
				</tr>
				<tr class="child_row_03">
					<td>
						订单号<br>PO No.
					</td>
					<td>
						<input type="text" name="PONo_UponReceiving" id="j_payment_PONo_UponReceiving" size="17" value="" >
					</td>
					<td>
						<label class="row-label">币别<br>Currency</label>
					</td>
					<td>
						<select name="currency_UponReceiving" id="j_payment_currency_UponReceiving" data-width="170px" data-toggle="selectpicker" >
	                        <option value=""></option>
	                        <option value="RMB">RMB</option>
	                        <option value="USD">USD</option>
	                        <option value="EUR">EUR</option>
	                        <option value="GBP">GBP</option>
                    	</select>
					</td>
				</tr>
				<tr class="child_row_03">
					<td>
						金额<br>Amount
					</td>
					<td>
						<input type="text" name="amount_UponReceiving" id="j_payment_amount_UponReceiving" value="" size="17" data-rule="number" onchange="changeAmount()" >
					</td>
					<td colspan="2">
					</td>
				</tr>
				
				<!-- Upon Approval 验收后 -->
				<tr class="table-parent" id="row_04">
					<td colspan="4">
						<label id="row_04_title">Upon Approval 验收后</label>				
					</td>
				</tr>
				<tr class="child_row_04">
					<td>
						结算期 <br>Payment Term
					</td>
					<td>
						<input type="text" name="paymentDays_UponApproval" id="j_payment_paymentDays_UponApproval" value="" size="17">
					</td>
					<td>
						收货或验收日期<br>Receiving or Approval date
					</td>
					<td>
						<input type="text" name="receivingOrApprovalDate_UponApproval" size="17" id="j_payment_receivingOrApprovalDate_UponApproval" value="" data-toggle="datepicker" data-rule="date">
					</td>
				</tr>
				<tr class="child_row_04">
					<td>
						订单号<br>PO No.
					</td>
					<td>
						<input type="text" name="PONo_UponApproval" id="j_payment_PONo_UponApproval" size="17" value="" >
					</td>
					<td>
						<label class="row-label">币别<br>Currency</label>
					</td>
					<td>
						<select name="currency_UponApproval" id="j_payment_currency_UponApproval" data-width="170px" data-toggle="selectpicker" >
	                        <option value=""></option>
	                        <option value="RMB">RMB</option>
	                        <option value="USD">USD</option>
	                        <option value="EUR">EUR</option>
	                        <option value="GBP">GBP</option>
                    	</select>
					</td>
				</tr>
				<tr class="child_row_04">
					<td>
						金额<br>Amount
					</td>
					<td>
						<input type="text" name="amount_UponApproval" id="j_payment_amount_UponApproval" size="17" value="" data-rule="number" onchange="changeAmount()" >
					</td>
					<td colspan="2">
					</td>
				</tr>
				
				<!-- Upon invoice 见票后 -->
				<tr class="table-parent" id="row_05">
					<td colspan="4">
						<label id="row_05_title">Upon invoice 见票后</label>							 
					</td>
				</tr>
				<tr class="child_row_05">
					<td>
						结算期 <br>Payment Term
					</td>
					<td>
						<input type="text" name="paymentDays_UponInvoice" id="j_payment_paymentDays_UponInvoice" value="" size="17">
					</td>
					<td>
						收货或验收日期<br>Receiving or Approval date
					</td>
					<td>
						<input type="text" name="receivingOrApprovalDate_UponInvoice" id="j_payment_receivingOrApprovalDate_UponInvoice" size="17" value="" data-toggle="datepicker" data-rule="date">
					</td>
				</tr>
				<tr class="child_row_05">
					<td>
						订单号<br>PO No.
					</td>
					<td>
						<input type="text" name="PONo_UponInvoice" id="j_payment_PONo_UponInvoice" size="17" value="" >
					</td>
					<td>
						<label class="row-label">币别<br>Currency</label>
					</td>
					<td>
						<select name="currency_UponInvoice" id="j_payment_currency_UponInvoice" data-width="170px" data-toggle="selectpicker" >
	                        <option value=""></option>
	                        <option value="RMB">RMB</option>
	                        <option value="USD">USD</option>
	                        <option value="EUR">EUR</option>
	                        <option value="GBP">GBP</option>
                    	</select>
					</td>
				</tr>
				<tr class="child_row_05">
					<td>
						金额<br>Amount
					</td>
					<td>
						<input type="text" name="amount_UponInvoice" id="j_payment_amount_UponInvoice" size="17" value="" data-rule="number" onchange="changeAmount()" >
					</td>
					<td colspan="2">
					</td>
				</tr>
				
				<!-- Other 其他 -->
				<tr class="table-parent" id="row_06">
					<td colspan="4">
						<label id="row_06_title">Other 其他</label>						
					</td>
				</tr>
				<tr class="child_row_06">
					<td>
						结算期 <br>Payment Term
					</td>
					<td>
						<input type="text" name="paymentDays_Other" id="j_payment_paymentDays_Other" value="" size="17">
					</td>
					<td>
						收货或验收日期<br>Receiving or Approval date
					</td>
					<td>
						<input type="text" name="receivingOrApprovalDate_Other" id="j_payment_receivingOrApprovalDate_Other" size="17" value="" data-toggle="datepicker" data-rule="date">
					</td>
				</tr>
				<tr class="child_row_06">
					<td>
						订单号<br>PO No.
					</td>
					<td>
						<input type="text" name="PONo_Other" id="j_payment_PONo_Other" size="17" value="" >
					</td>
					<td>
						<label class="row-label">币别<br>Currency</label>
					</td>
					<td>
						<select name="currency_Other" id="j_payment_currency_Other" data-toggle="selectpicker" data-width="170px" >
	                        <option value=""></option>
	                        <option value="RMB">RMB</option>
	                        <option value="USD">USD</option>
	                        <option value="EUR">EUR</option>
	                        <option value="GBP">GBP</option>
                    	</select>
					</td>
				</tr>
				<tr class="child_row_06">
					<td>
						金额<br>Amount
					</td>
					<td>
						<input type="text" name="amount_Other" id="j_payment_amount_Other" value="" data-rule="number" size="17" onchange="changeAmount()" >
					</td>
					<td colspan="2">
					</td>
				</tr>
				
				<tr>
					<td>
						供应商代码<br>Supplier Code
					</td>
					<td>
						<input type="text" name="supplierCode" id="j_payment_supplierCode" value="" size="17" data-rule="required">
					</td>
					<td>
						银行交易编码<br>Ref. No. of Bank
					</td>
					<td>
						<input type="text" name="refNoofBank" value="" id="j_payment_refNoofBank" size="17" data-rule="required">
					</td>
				</tr>
				<tr>
					<td>
						支付用途 <br>Usage Description
					</td>
					<td colspan="3">
						<textarea name="usageDescription" cols="60" rows="1" id="j_payment_usageDescription" data-toggle="autoheight"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						金额(小写)<br>Amount in figures:
					</td>
					<td>
						<input type="text" name="amountInFigures" size="17" id="j_payment_amountInFigures" value="" readonly="" >
					</td>
					<td>
						金额（大写）<br>Amount in words:
					</td>
					<td>
						<input type="text" name="amountInWords" size="17" id="j_payment_amountInWords" value="" readonly="" >
					</td>
				</tr>
				<tr>
					<td>
						单据审核<br>Document Audit:
					</td>
					<td>
						<input type="text" name="documentAudit" size="17" id="j_payment_documentAudit" value="" readonly=""  >
					</td>
					<td>
						部门经理<br>Dept. Manager:
					</td>
					<td>
						<input type="text" name="deptManager" size="17" id="j_payment_deptManager" value="" readonly="" >
					</td>  
				</tr>
				<tr id="j_file_upload1">
					<td>
						Attachment1 Invoice<br>（附件：发票）
					</td>
					<td>
						<input name="file_Invoice" data-name="custom.pic" data-toggle="webuploader" data-options="
	                        {
	                            pick: {label: '点击选择文件'},
	                            server: 'savefile.action',
	                            fileNumLimit: 1,
	                            formData: {},
	                            required: false,
	                            uploaded: '',
	                            basePath: '',
	                            accept: {
	                                title: '发票',
	                                extensions: 'xls,xlsx,doc,docx',
	                                mimeTypes: '.xls,.xlsx,.doc,.docx'
	                            }
	                        }"
                    	>
					</td>
					<td>
						Attachment2 Contract<br>（附件：合同）
					</td>
					<td>
						<input name="file_Contract" data-name="custom.pic" data-toggle="webuploader" data-options="
	                        {
	                            pick: {label: '点击选择文件'},
	                            server: 'savefile.action',
	                            fileNumLimit: 1,
	                            formData: {},
	                            required: false,
	                            uploaded: '',
	                            basePath: '',
	                            accept: {
	                                title: '发票',
	                                extensions: 'xls,xlsx,doc,docx',
	                                mimeTypes: '.xls,.xlsx,.doc,.docx'
	                            }
	                        }"
                    	>
					</td>
				</tr>
				<tr id="j_file_upload2">
					<td>
						Attachment3 Other<br>（附件：其他）
					</td>
					<td>
						<input name="file_Other" data-name="custom.pic" data-toggle="webuploader" data-options="
	                        {
	                            pick: {label: '点击选择文件'},
	                            server: 'savefile.action',
	                            fileNumLimit: 1,
	                            formData: {},
	                            required: false,
	                            uploaded: '',
	                            basePath: '',
	                            accept: {
	                                title: '发票',
	                                extensions: 'xls,xlsx,doc,docx',
	                                mimeTypes: '.xls,.xlsx,.doc,.docx'
	                            }
	                        }"
                    	>
					</td>
					<td colspan="2">
					</td>
				</tr>
				<tr id="j_file_download1">
					<td>
						Attachment1 Invoice<br>（附件：发票）
					</td>
					<td>
						<a id ="j_file_Invoice"></a>
					</td>
					<td>
						Attachment2 Contract<br>（附件：合同）
					</td>
					<td>
						<a id ="j_file_Contract"></a>
					</td>
				
				</tr>
				<tr id="j_file_download2">
					<td>
						Attachment3 Other<br>（附件：其他）
					</td>
					<td>
						<a id ="j_file_Other"></a>
					</td>
					<td colspan="2">
					</td>
				
				</tr>
				
				
				
				<tr>
					<td colspan="4" align="center">
	            		<button type="button" id="payment-save" class="btn-default" data-icon="save" >Save(保存)</button>
	            		<button type="button" id="payment-submit" class="btn-default" data-icon="arrow-up" >Submit(送审)</button>
	            		<button type="button" id="payment-approve" class="btn-default" data-icon="check" >Approve(同意)</button>
	            		<button type="button" id="payment-Reject" class="btn-default" data-icon="close" >Reject(拒绝)</button>
	            		<button type="button" id="payment-assign" class="btn-default" data-icon="undo" >Assign(转交)</button>
	            		<button type="button" id="payment-Print" class="btn-default" data-icon="print" >Print Out(打印)</button><br>
            		</td>				
				</tr>
				<tr id="payment-invalid-tr">
            		<td colspan="4" align="center">
            			<button type="button" id="payment-invalid" class="btn-default" data-icon="close">Doc. Invalid(作废)</button>
            			<textarea name="invalidDescription" cols="30" rows="1" data-toggle="autoheight"></textarea><br><br>
            		</td>
            	</tr>
            	<tr id="payment-return-tr">
            		<td colspan="4" align="center">
            			<button type="button" id="payment-return" class="btn-default" data-icon="arrow-down">Doc. Return(退回)</button>
            			<textarea name="rReturnDescription" cols="30" rows="1" data-toggle="autoheight"></textarea>
            		</td>
            	</tr>
				
			</table>		






        </form>
    </div>
</div>