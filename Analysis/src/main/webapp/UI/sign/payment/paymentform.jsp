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
            
	    }
	});	

	$.CurrentNavtab.find('#payment-save').click(function(){		
		$.CurrentNavtab.find("#j_payment_form").attr("action", "savePayment.action").submit();
	});
	
		
	if('${param.id}'!=null&&'${param.id}'!=''){
		dataToFace();
	}
	
	isChange();
})

function isChange(){
	$.CurrentNavtab.find("#j_payment_beneficiaryChange").on('ifChecked',function(){
		$.CurrentNavtab.find("#j_payment_beneficiary_tr").attr("style","background-color: #9ACD32");
	})
	$.CurrentNavtab.find("#j_payment_beneficiaryChange").on('ifUnchecked',function(){
		$.CurrentNavtab.find("#j_payment_beneficiary_tr").removeAttr("style");
	})
	$.CurrentNavtab.find("#j_payment_beneficiaryAccountNOChange").on('ifChecked',function(){
		$.CurrentNavtab.find("#j_payment_beneficiaryAccountNO_tr").attr("style","background-color: #EEC900");
	})
	$.CurrentNavtab.find("#j_payment_beneficiaryAccountNOChange").on('ifUnchecked',function(){
		$.CurrentNavtab.find("#j_payment_beneficiaryAccountNO_tr").removeAttr("style");
	})
	
}



function showButton(status,print){
	if(status=='-1'){//新建
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
	}else if(status=='0'){//保存后可提交
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
	}else if(status="4"){//财务处理
		$.CurrentNavtab.find('#payment-save').hide();
		$.CurrentNavtab.find('#payment-submit').hide();
		$.CurrentNavtab.find('#payment-approve').hide();
		$.CurrentNavtab.find('#payment-Reject').hide();
		$.CurrentNavtab.find('#payment-assign').show();
		$.CurrentNavtab.find('#payment-Print').hide();
		if(print=='1'){
			$.CurrentNavtab.find('#payment-invalid-tr').show();
			$.CurrentNavtab.find('#payment-return-tr').show();		
		}else{
			$.CurrentNavtab.find('#payment-invalid-tr').hide();
			$.CurrentNavtab.find('#payment-return-tr').hide();					
		}
		$.CurrentNavtab.find('#j_payment_refNoofBank').removeAttr('readonly').attr('data-rule','required');
		$.CurrentNavtab.find('#j_file_upload2').hide();
		$.CurrentNavtab.find('#j_file_upload1').hide();
		$.CurrentNavtab.find('#j_file_download1').show();
		$.CurrentNavtab.find('#j_file_download1').show();
		$
	}else if(status="1"){//部门经理审批
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
	}else if(status="2"){//审批通过
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
	}else if(status="3"){//审批未通过，单据作废，
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
	}else if(status="5"){//单据作废
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

function dataToFace(){
	$.CurrentNavtab.find("#j_payment_applicationDate").val('${param.applicationDate}');
	$.CurrentNavtab.find("#j_payment_requestPaymentDate").val('${param.requestPaymentDate}');
	$.CurrentNavtab.find("#j_payment_contacturalPaymentDate").val('${param.contacturalPaymentDate}');
	$.CurrentNavtab.find("#j_payment_code").val('${param.code}');
	if('${param.payType}'=='Cash'){
		$.CurrentNavtab.find("#j_payment_cash").iCheck('check'); 
	}else if('${param.payType}'=='Banking'){
		$.CurrentNavtab.find("#j_payment_banking").iCheck('check'); 
	}else if('${param.payType}'=='Advance'){
		$.CurrentNavtab.find("#j_payment_advanceWriteoff").iCheck('check'); 
	}
	if('${param.urgent}'=='1'){
		$.CurrentNavtab.find("#j_payment_urgent").iCheck('check'); 
	}
	$.CurrentNavtab.find("#j_payment_UID").val('${param.UID}'+'-'+'${param.UName}');
	$.CurrentNavtab.find("#j_payment_departmentID").val('${param.departmentName}'+'-'+'${param.departmentID}');
	$.CurrentNavtab.find('#j_payment_beneficiary').selectpicker().selectpicker('val','${param.beneficiary}').selectpicker('refresh');
    changeBeneficiary();
    if('${param.beneficiaryChange}'=='1'){
		$.CurrentNavtab.find("#j_payment_beneficiaryChange").iCheck('check'); 
		$.CurrentNavtab.find("#j_payment_beneficiary_tr").attr("style","background-color: #9ACD32");
	}
    if('${param.beneficiaryAccountNOChange}'=='1'){
		$.CurrentNavtab.find("#j_payment_beneficiaryAccountNOChange").iCheck('check'); 
		$.CurrentNavtab.find("#j_payment_beneficiaryAccountNO_tr").attr("style","background-color: #EEC900");
	}
    $.CurrentNavtab.find("#j_payment_paymentSubject").selectpicker().selectpicker('val','${param.paymentSubject}').selectpicker('refresh');
    $.CurrentNavtab.find("#j_payment_paymentTerm").selectpicker().selectpicker('val','${param.paymentTerm}').selectpicker('refresh');
    
	$.CurrentNavtab.find("#j_payment_paymentDays_1").selectpicker('val','${param.paymentDays_1}');
    $.CurrentNavtab.find('#j_payment_paymentDays_1').selectpicker('refresh');
	$.CurrentNavtab.find("#j_payment_receivingOrApprovalDate_1").val('${param.receivingOrApprovalDate_1}');
	$.CurrentNavtab.find("#j_payment_PONo_1").val('${param.PONo_1}');
	$.CurrentNavtab.find("#j_payment_currency_1").selectpicker('val','${param.currency_1}').selectpicker('refresh');
	$.CurrentNavtab.find("#j_payment_amount_1").val('${param.amount_1}');
		
	$.CurrentNavtab.find("#j_payment_paymentDays_2").selectpicker().selectpicker('val','${param.paymentDays_2}').selectpicker('refresh');
	$.CurrentNavtab.find("#j_payment_receivingOrApprovalDate_2").val('${param.receivingOrApprovalDate_2}');
	$.CurrentNavtab.find("#j_payment_PONo_2").val('${param.PONo_2}');
	$.CurrentNavtab.find("#j_payment_currency_2").selectpicker().selectpicker('val','${param.currency_2}').selectpicker('refresh');
	$.CurrentNavtab.find("#j_payment_amount_2").val('${param.amount_2}');
		
	$.CurrentNavtab.find("#j_payment_paymentDays_3").selectpicker().selectpicker('val','${param.paymentDays_3}').selectpicker('refresh');
	$.CurrentNavtab.find("#j_payment_receivingOrApprovalDate_3").val('${param.receivingOrApprovalDate_3}');
	$.CurrentNavtab.find("#j_payment_PONo_3").val('${param.PONo_3}');
	$.CurrentNavtab.find("#j_payment_currency_3").selectpicker().selectpicker('val','${param.currency_3}').selectpicker('refresh');
	$.CurrentNavtab.find("#j_payment_amount_3").val('${param.amount_3}');
		
	$.CurrentNavtab.find("#j_payment_paymentDays_4").selectpicker().selectpicker('val','${param.paymentDays_4}').selectpicker('refresh');
	$.CurrentNavtab.find("#j_payment_receivingOrApprovalDate_4").val('${param.receivingOrApprovalDate_4}');
	$.CurrentNavtab.find("#j_payment_PONo_4").val('${param.PONo_4}');
	$.CurrentNavtab.find("#j_payment_currency_4").selectpicker().selectpicker('val','${param.currency_4}').selectpicker('refresh');
	$.CurrentNavtab.find("#j_payment_amount_4").val('${param.amount_4}');
		
	$.CurrentNavtab.find("#j_payment_paymentDays_5").selectpicker().selectpicker('val','${param.paymentDays_5}').selectpicker('refresh');
	$.CurrentNavtab.find("#j_payment_receivingOrApprovalDate_5").val('${param.receivingOrApprovalDate_5}');
	$.CurrentNavtab.find("#j_payment_PONo_5").val('${param.PONo_5}');
	$.CurrentNavtab.find("#j_payment_currency_5").selectpicker().selectpicker('val','${param.currency_5}').selectpicker('refresh');
	$.CurrentNavtab.find("#j_payment_amount_5").val('${param.amount_5}');
		
	$.CurrentNavtab.find("#j_payment_paymentDays_6").selectpicker().selectpicker('val','${param.paymentDays_6}').selectpicker('refresh');
	$.CurrentNavtab.find("#j_payment_receivingOrApprovalDate_6").val('${param.receivingOrApprovalDate_6}');
	$.CurrentNavtab.find("#j_payment_PONo_6").val('${param.PONo_6}');
	$.CurrentNavtab.find("#j_payment_currency_6").selectpicker().selectpicker('val','${param.currency_6}').selectpicker('refresh');
	$.CurrentNavtab.find("#j_payment_amount_6").val('${param.amount_6}');
		
	$.CurrentNavtab.find("#j_payment_supplierCode").val('${param.supplierCode}');
	$.CurrentNavtab.find("#j_payment_refNoofBank").val('${param.refNoofBank}');
	$.CurrentNavtab.find("#j_payment_usageDescription").val('${param.usageDescription}');
	$.CurrentNavtab.find("#j_payment_amountInFigures").val('${param.amountInFigures}');

	$.CurrentNavtab.find("#j_payment_documentAudit").val('${param.documentAudit}');
	$.CurrentNavtab.find("#j_payment_deptManager").val('${param.deptManager}');
		
	$.CurrentNavtab.find("#j_file_Invoice").attr("href",'${param.invoice}').html('${param.invoice}');
	$.CurrentNavtab.find("#j_file_Contract").attr("href",'${param.contract}').html('${param.contract}');
	$.CurrentNavtab.find("#j_file_Other").attr("href",'${param.other}').html('${param.other}');
		
	$.CurrentNavtab.find("#j_payment_id").val('${param.id}');
	$.CurrentNavtab.find("#j_payment_status").val('${param.status}');
	
}

//金额变动
function changeAmount(){
	var amount1=$.CurrentNavtab.find("#j_payment_amount_1").val();
	var amount2=$.CurrentNavtab.find("#j_payment_amount_2").val();
	var amount3=$.CurrentNavtab.find("#j_payment_amount_3").val();
	var amount4=$.CurrentNavtab.find("#j_payment_amount_4").val();
	var amount5=$.CurrentNavtab.find("#j_payment_amount_5").val();
	var amount6=$.CurrentNavtab.find("#j_payment_amount_6").val();
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
	
	$.CurrentNavtab.find("#row_01_title").html("PO&nbsp1 &nbsp&nbsp&nbsp&nbsp Amount(金额):"+amount1);
	$.CurrentNavtab.find("#row_02_title").html("PO&nbsp2 &nbsp&nbsp&nbsp&nbsp Amount(金额):"+amount2);
	$.CurrentNavtab.find("#row_03_title").html("PO&nbsp3 &nbsp&nbsp&nbsp&nbsp  Amount(金额):"+amount3);
	$.CurrentNavtab.find("#row_04_title").html("PO&nbsp4 &nbsp&nbsp&nbsp&nbsp  Amount(金额):"+amount4);
	$.CurrentNavtab.find("#row_05_title").html("PO&nbsp5 &nbsp&nbsp&nbsp&nbsp  Amount(金额):"+amount5);
	$.CurrentNavtab.find("#row_06_title").html("PO&nbsp6 &nbsp&nbsp&nbsp&nbsp  Amount(金额):"+amount6);
	
	
	
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
						支付方式
					</td>
					<td>
						<input type="radio" name="payType" data-toggle="icheck" id="j_payment_cash" value="Cash" data-label="支付现金 <br>Cash">
					</td>
					<td>
						<input type="radio" name="payType" data-toggle="icheck" id="j_payment_banking" value="Banking" data-label="银行支付 <br>Banking">
					</td>	
					<td>
						<input type="radio" name="payType" data-toggle="icheck" id="j_payment_advanceWriteoff" value="Advance" data-label="核销预付  <br>Advance Write-off (Amount)">
					</td>				
				</tr>
				<tr>

					<td>
						Urgent
					</td>
					<td>
						<input type="checkbox" name="urgent"  data-toggle="icheck" id="j_payment_urgent" value="1" data-label="">
					</td>		
					<td colspan="2"></td>			
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
					<td id="j_payment_beneficiary_tr">
						<select name="beneficiary" id="j_payment_beneficiary" data-toggle="selectpicker" data-rule="required" onchange="changeBeneficiary()" data-width="170px">
                        	<option value=""></option>
                    	</select>
					</td>
					<td>
						银行及帐号<br>Beneficiary Account NO.
					</td>
					<td id="j_payment_beneficiaryAccountNO_tr">
						<input type="text" name="beneficiaryAccountNO" id="j_payment_beneficiaryAccountNO" value="" readonly=""  size="17">
					</td>					
				</tr>
				<tr>
					<td>
						收款人变更<br>Change
					</td>
					<td>
						<input onclick="alert(11);" type="checkbox" name="beneficiaryChange" id="j_payment_beneficiaryChange" data-toggle="icheck" value="1" data-label="">
					</td>
					<td>
						银行及账号变更<br>Change
					</td>
					<td>
						<input onclick="changAccAndBank();" type="checkbox" name="beneficiaryAccountNOChange" id="j_payment_beneficiaryAccountNOChange" data-toggle="icheck" value="1" data-label="">
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
					<td>
						结算期<br>Payment Term
					</td>	
					<td>
						<select name="paymentTerm" data-toggle="selectpicker" id="j_payment_paymentTerm"  data-rule="required" data-width="170px" >
	                        <option value=""></option>
	                        <option value="1">Advance预付款</option>
	                        <option value="2">Payment at sight 见票即付</option>
	                        <option value="3">Upon receiving 收货后</option>
	                        <option value="4">Upon Approval 验收后</option>
	                        <option value="5">Upon invoice 见票后</option>
	                        <option value="6">Other 其他</option>
                    	</select>
					</td>				
				</tr>
				<tr>
					<td colspan="4">
						<table id="payterm" class="table" width="100%">
							<!-- Advance预付款 -->
							<tr class="table-parent" id="row_01">
								<td colspan="4">
									<label id="row_01_title">Advance预付款</label>
								</td>
							</tr>
							<tr class="child_row_01 child_row">
								<td>
									结算期 <br>Payment Term
								</td>
								<td>
									<select name="paymentDays_1" id="j_payment_paymentDays_1" data-toggle="selectpicker" data-width="170px" >
				                        <option value=""></option>
				                        <option value="30">30Days</option>
				                        <option value="45">45Days</option>
				                        <option value="60">60Days</option>
				                        <option value="90">90Days</option>
				                        <option value="120">120Days</option>
			                    	</select>
								</td>
								<td>
									收货或验收日期<br>Receiving or Approval date
								</td>
								<td>
									<input type="text" name="receivingOrApprovalDate_1" id="j_payment_receivingOrApprovalDate_1" value="" data-toggle="datepicker" data-rule="date">
								</td>
							</tr>
							<tr class="child_row_01 child_row">
								<td>
									订单号<br>PO No.
								</td>
								<td>
									<input type="text" name="PONo_1" id="j_payment_PONo_1"  value="" size="17" >
								</td>
								<td>
									<label class="row-label">币别<br>Currency</label>
								</td>
								<td>
									<select name="currency_1" data-toggle="selectpicker" id="j_payment_currency_1" data-width="170px">
				                        <option value=""></option>
				                        <option value="RMB">RMB</option>
				                        <option value="USD">USD</option>
				                        <option value="EUR">EUR</option>
				                        <option value="GBP">GBP</option>
			                    	</select>
								</td>
							</tr>
							<tr class="child_row_01 child_row">
								<td>
									金额<br>Amount
								</td>
								<td>
									<input type="text" name="amount_1" id="j_payment_amount_1" value="" data-rule="number" onchange="changeAmount()" size="17">
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
							<tr class="child_row_02 child_row">
								<td>
									结算期 <br>Payment Term
								</td>
								<td>
									<select name="paymentDays_2" id="j_payment_paymentDays_2" data-toggle="selectpicker" data-width="170px" >
				                        <option value=""></option>
				                        <option value="30">30Days</option>
				                        <option value="45">45Days</option>
				                        <option value="60">60Days</option>
				                        <option value="90">90Days</option>
				                        <option value="120">120Days</option>
			                    	</select>
								</td>
								<td>
									收货或验收日期<br>Receiving or Approval date
								</td>
								<td>
									<input type="text" name="receivingOrApprovalDate_2" id="j_payment_receivingOrApprovalDate_2" value="" size="17" data-toggle="datepicker" data-rule="date">
								</td>
							</tr>
							<tr class="child_row_02 child_row">
								<td>
									订单号<br>PO No.
								</td>
								<td>
									<input type="text" name="PONo"  value="" size="17" >
								</td>
								<td>
									<label class="row-label">币别<br>Currency</label>
								</td>
								<td>
									<select name="currency_2" id="j_payment_currency_2" data-toggle="selectpicker" data-width="170px">
				                        <option value=""></option>
				                        <option value="RMB">RMB</option>
				                        <option value="USD">USD</option>
				                        <option value="EUR">EUR</option>
				                        <option value="GBP">GBP</option>
			                    	</select>
								</td>
							</tr>
							<tr class="child_row_02 child_row">
								<td>
									金额<br>Amount
								</td>
								<td>
									<input type="text" name="amount_2" id="j_payment_amount_2" value="" data-rule="number" size="17" onchange="changeAmount()">
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
							<tr class="child_row_03 child_row">
								<td>
									结算期 <br>Payment Term
								</td>
								<td>
									<select name="paymentDays_3" id="j_payment_paymentDays_3" data-toggle="selectpicker" data-width="170px" >
				                        <option value=""></option>
				                        <option value="30">30Days</option>
				                        <option value="45">45Days</option>
				                        <option value="60">60Days</option>
				                        <option value="90">90Days</option>
				                        <option value="120">120Days</option>
			                    	</select>
								</td>
								<td>
									收货或验收日期<br>Receiving or Approval date
								</td>
								<td>
									<input type="text" name="receivingOrApprovalDate_3" id="j_payment_receivingOrApprovalDate_3" size="17"  value="" data-toggle="datepicker" data-rule="date">
								</td>
							</tr>
							<tr class="child_row_03 child_row">
								<td>
									订单号<br>PO No.
								</td>
								<td>
									<input type="text" name="PONo_3" id="j_payment_PONo_3" size="17" value="" >
								</td>
								<td>
									<label class="row-label">币别<br>Currency</label>
								</td>
								<td>
									<select name="currency_3" id="j_payment_currency_3" data-width="170px" data-toggle="selectpicker" >
				                        <option value=""></option>
				                        <option value="RMB">RMB</option>
				                        <option value="USD">USD</option>
				                        <option value="EUR">EUR</option>
				                        <option value="GBP">GBP</option>
			                    	</select>
								</td>
							</tr>
							<tr class="child_row_03 child_row">
								<td>
									金额<br>Amount
								</td>
								<td>
									<input type="text" name="amount_3" id="j_payment_amount_3" value="" size="17" data-rule="number" onchange="changeAmount();" >
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
							<tr class="child_row_04 child_row">
								<td>
									结算期 <br>Payment Term
								</td>
								<td>
									<select name="paymentDays_4" id="j_payment_paymentDays_4" data-toggle="selectpicker" data-width="170px" >
				                        <option value=""></option>
				                        <option value="30">30Days</option>
				                        <option value="45">45Days</option>
				                        <option value="60">60Days</option>
				                        <option value="90">90Days</option>
				                        <option value="120">120Days</option>
			                    	</select>
								</td>
								<td>
									收货或验收日期<br>Receiving or Approval date
								</td>
								<td>
									<input type="text" name="receivingOrApprovalDate_4" size="17" id="j_payment_receivingOrApprovalDate_4" value="" data-toggle="datepicker" data-rule="date">
								</td>
							</tr>
							<tr class="child_row_04 child_row">
								<td>
									订单号<br>PO No.
								</td>
								<td>
									<input type="text" name="PONo_4" id="j_payment_PONo_4" size="17" value="" >
								</td>
								<td>
									<label class="row-label">币别<br>Currency</label>
								</td>
								<td>
									<select name="currency_4" id="j_payment_currency_4" data-width="170px" data-toggle="selectpicker" >
				                        <option value=""></option>
				                        <option value="RMB">RMB</option>
				                        <option value="USD">USD</option>
				                        <option value="EUR">EUR</option>
				                        <option value="GBP">GBP</option>
			                    	</select>
								</td>
							</tr>
							<tr class="child_row_04 child_row">
								<td>
									金额<br>Amount
								</td>
								<td>
									<input type="text" name="amount_4" id="j_payment_amount_4" size="17" value="" data-rule="number" onchange="changeAmount()" >
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
							<tr class="child_row_05 child_row">
								<td>
									结算期 <br>Payment Term
								</td>
								<td>
									<select name="paymentDays_5" id="j_payment_paymentDays_5" data-toggle="selectpicker" data-width="170px" >
				                        <option value=""></option>
				                        <option value="30">30Days</option>
				                        <option value="45">45Days</option>
				                        <option value="60">60Days</option>
				                        <option value="90">90Days</option>
				                        <option value="120">120Days</option>
			                    	</select>
								</td>
								<td>
									收货或验收日期<br>Receiving or Approval date
								</td>
								<td>
									<input type="text" name="receivingOrApprovalDate_5" id="j_payment_receivingOrApprovalDate_5" size="17" value="" data-toggle="datepicker" data-rule="date">
								</td>
							</tr>
							<tr class="child_row_05 child_row">
								<td>
									订单号<br>PO No.
								</td>
								<td>
									<input type="text" name="PONo_5" id="j_payment_PONo_5" size="17" value="" >
								</td>
								<td>
									<label class="row-label">币别<br>Currency</label>
								</td>
								<td>
									<select name="currency_5" id="j_payment_currency_5" data-width="170px" data-toggle="selectpicker" >
				                        <option value=""></option>
				                        <option value="RMB">RMB</option>
				                        <option value="USD">USD</option>
				                        <option value="EUR">EUR</option>
				                        <option value="GBP">GBP</option>
			                    	</select>
								</td>
							</tr>
							<tr class="child_row_05 child_row">
								<td>
									金额<br>Amount
								</td>
								<td>
									<input type="text" name="amount_5" id="j_payment_amount_5" size="17" value="" data-rule="number" onchange="changeAmount()" >
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
							<tr class="child_row_06 child_row">
								<td>
									结算期 <br>Payment Term
								</td>
								<td>
									<select name="paymentDays_6" id="j_payment_paymentDays_6" data-toggle="selectpicker" data-width="170px" >
				                        <option value=""></option>
				                        <option value="30">30Days</option>
				                        <option value="45">45Days</option>
				                        <option value="60">60Days</option>
				                        <option value="90">90Days</option>
				                        <option value="120">120Days</option>
			                    	</select>
								</td>
								<td>
									收货或验收日期<br>Receiving or Approval date
								</td>
								<td>
									<input type="text" name="receivingOrApprovalDate_6" id="j_payment_receivingOrApprovalDate_6" size="17" value="" data-toggle="datepicker" data-rule="date">
								</td>
							</tr>
							<tr class="child_row_06 child_row">
								<td>
									订单号<br>PO No.
								</td>
								<td>
									<input type="text" name="PONo_6" id="j_payment_PONo_6" size="17" value="" >
								</td>
								<td>
									<label class="row-label">币别<br>Currency</label>
								</td>
								<td>
									<select name="currency_6" id="j_payment_currency_6" data-toggle="selectpicker" data-width="170px" >
				                        <option value=""></option>
				                        <option value="RMB">RMB</option>
				                        <option value="USD">USD</option>
				                        <option value="EUR">EUR</option>
				                        <option value="GBP">GBP</option>
			                    	</select>
								</td>
							</tr>
							<tr class="child_row_06 child_row">
								<td>
									金额<br>Amount
								</td>
								<td>
									<input type="text" name="amount_6" id="j_payment_amount_6" value="" data-rule="number" size="17" onchange="changeAmount()" >
								</td>
								<td colspan="2">
								</td>
							</tr>
							


						</table>						
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
						<input type="text" name="refNoofBank" value="" id="j_payment_refNoofBank" size="17"  readonly="">
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
						<a id ="j_file_other"></a>
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
            			<textarea name="returnDescription" cols="30" rows="1" data-toggle="autoheight"></textarea>
            		</td>
            	</tr>
				
			</table>		






        </form>
    </div>
</div>