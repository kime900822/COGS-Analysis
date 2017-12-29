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
	
	BJUI.ajax('doajax', {
	    url: 'getAllBeneficiary.action',
	    loadingmask: false,
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

function changeBeneficiary(){
	$.CurrentNavtab.find('#j_payment_beneficiaryAccountNO').val($.CurrentNavtab.find('#j_payment_beneficiary').val())
}

//金额变动
function changeAmount(){
	var amount1=0;
	
	
}


</script>
<div class="bjui-pageContent">
    <div class="bs-example" style="width:800px">
        <form action="../../json/ajaxDone.json" id="j_payment_form" data-toggle="ajaxform">
			<input type="hidden" name="id" value="">
            <div class="bjui-row-0" align="center">
            <h2 class="row-label">Payment Application Form 付款申请单</h2><br> 
            </div>
			<table class="table" style="font-size:8px;">
				<tr>
					<td width="200px">Application Date<br>申请日期）</td>
					<td width="200px"><input type="text" name="applicationDate" value="" data-toggle="datepicker" data-rule="required;date"></td>
					<td width="200px">Request Payment Date<br>(要求付款日期）</td>
					<td width="200px"><input type="text" name="requestPaymentDate" value="" data-toggle="datepicker" data-rule="required;date"></td>					
				</tr>
				<tr>
					<td>
						Contactural Payment Date<br>（合同付款日期）
					</td>
					<td>
						<input type="text" name="contacturalPaymentDate" value="" data-toggle="datepicker" data-rule="required;date">
					</td>
					<td>
						CODE(流水码)
					</td>
					<td>
						<input type="text" name="code" value="" readonly="" >
					</td>					
				</tr>
				<tr>
					<td>
						支付现金 <br>Cash
					</td>
					<td>
						<input type="radio" name="payType" data-toggle="icheck" value="Cash" data-label="">
					</td>
					<td>
						银行支付<br> Banking
					</td>
					<td>
						<input type="radio" name="payType" data-toggle="icheck" value="Banking" data-label="">
					</td>					
				</tr>
				<tr>
					<td>
						核销预付 <br>Advance Write-off (Amount) .
					</td>
					<td>
						<input type="checkbox" name="advanceWriteoff" data-toggle="icheck" value="true" data-label="">
					</td>
					<td>
						Urgent
					</td>
					<td>
						<input type="checkbox" name="urgent"  data-toggle="icheck" value="true" data-label="">
					</td>					
				</tr>
				<tr>
					<td>
						申请人<br>Applicant:
					</td>
					<td>
						<input type="text" name="UID" value="${user.uid}-${user.name}" readonly="" data-rule="required">
					</td>
					<td>
						所属部门<br>Department of Applicant:
					</td>
					<td>
						<input type="text" name="departmentID" value="${user.department.name}-${user.department.did}" readonly="" data-rule="required">
					</td>					
				</tr>
				<tr>
					<td>
						收款人（全称）<br>Beneficiary:
					</td>
					<td>
						<select name="beneficiary" id="j_payment_beneficiary" data-toggle="selectpicker" data-rule="required" onchange="changeBeneficiary()">
                        	<option value=""></option>
                    	</select>
					</td>
					<td>
						银行及帐号<br>Beneficiary Account NO.
					</td>
					<td>
						<input type="text" name="beneficiaryAccountNO" id="j_payment_beneficiaryAccountNO" value="" readonly="" data-rule="required">
					</td>					
				</tr>
				<tr>
					<td>
						变更<br>Change
					</td>
					<td>
						<input type="checkbox" name="beneficiaryChange" id="j_payment_beneficiaryChange" data-toggle="icheck" value="true" data-label="">
					</td>
					<td>
						变更<br>Change
					</td>
					<td>
						<input type="checkbox" name="beneficiaryAccountNOChange" id="j_payment_beneficiaryAccountNOChange" data-toggle="icheck" value="true" data-label="">
					</td>					
				</tr>
				
				<!-- 付款   -->
				<tr>
					<td>
						付款项目<br>Payment Subject
					</td>
					<td>
						<select name="paymentSubject" data-toggle="selectpicker" data-rule="required">
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
						Advance预付款
					</td>
				</tr>
				<tr class="child_row_01">
					<td>
						结算期 <br>Payment Term
					</td>
					<td>
						<input type="text" name="paymentDays_Advance" id="j_payment_paymentDays_Advance" value="" data-rule="required" size="5">
					</td>
					<td>
						收货或验收日期<br>Receiving or Approval date
					</td>
					<td>
						<input type="text" name="receivingOrApprovalDate_Advance" id="j_payment_receivingOrApprovalDate_Advance" value="" data-toggle="datepicker" data-rule="required;date">
					</td>
				</tr>
				<tr class="child_row_01">
					<td>
						订单号<br>PO No.
					</td>
					<td>
						<input type="text" name="PONo_Advance" id="j_payment_PONo_Advance"  value="" data-rule="required">
					</td>
					<td>
						<label class="row-label">币别<br>Currency</label>
					</td>
					<td>
						<select name="currency_Advance" data-toggle="selectpicker" id="j_payment_currency_Advance"  data-rule="required">
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
						<input type="text" name="amount_Advance" id="j_payment_amount_Advance" value="" data-rule="required">
					</td>
					<td colspan="2">
					</td>
				</tr>
				
				
				<!-- Payment at sight 见票即付-->
				<tr class="table-parent" id="row_02">
					<td colspan="4">
						Payment at sight 见票即付
					</td>
				</tr>
				<tr class="child_row_02">
					<td>
						结算期 <br>Payment Term
					</td>
					<td>
						<input type="text" name="paymentDays_PaymentAtSight" id="j_payment_paymentDays_PaymentAtSight" value="" data-rule="required" size="5">
					</td>
					<td>
						收货或验收日期<br>Receiving or Approval date
					</td>
					<td>
						<input type="text" name="receivingOrApprovalDate_PaymentAtSight" id="j_payment_receivingOrApprovalDate_PaymentAtSight" value="" data-toggle="datepicker" data-rule="required;date">
					</td>
				</tr>
				<tr class="child_row_02">
					<td>
						订单号<br>PO No.
					</td>
					<td>
						<input type="text" name="PONo"  value="" data-rule="required">
					</td>
					<td>
						<label class="row-label">币别<br>Currency</label>
					</td>
					<td>
						<select name="currency_PaymentAtSight" id="j_payment_currency_PaymentAtSight" data-toggle="selectpicker" data-rule="required">
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
						<input type="text" name="amount_PaymentAtSight" id="j_payment_amount_PaymentAtSight" value="" data-rule="required">
					</td>
					<td colspan="2">
					</td>
				</tr>
				
				<!-- Upon receiving 收货后 -->
				<tr class="table-parent" id="row_03">
					<td colspan="4">
						Upon receiving 收货后
					</td>
				</tr>
				<tr class="child_row_03">
					<td>
						结算期 <br>Payment Term
					</td>
					<td>
						<input type="text" name="paymentDays_UponReceiving" id="j_payment_paymentDays_UponReceiving" value="" data-rule="required" size="5">
					</td>
					<td>
						收货或验收日期<br>Receiving or Approval date
					</td>
					<td>
						<input type="text" name="receivingOrApprovalDate_UponReceiving" id="j_payment_receivingOrApprovalDate_UponReceiving" value="" data-toggle="datepicker" data-rule="required;date">
					</td>
				</tr>
				<tr class="child_row_03">
					<td>
						订单号<br>PO No.
					</td>
					<td>
						<input type="text" name="PONo_UponReceiving" id="j_payment_PONo_UponReceiving" value="" data-rule="required">
					</td>
					<td>
						<label class="row-label">币别<br>Currency</label>
					</td>
					<td>
						<select name="currency_UponReceiving" id="j_payment_currency_UponReceiving" data-toggle="selectpicker" data-rule="required">
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
						<input type="text" name="amount_UponReceiving" id="j_payment_amount_UponReceiving" value="" data-rule="required">
					</td>
					<td colspan="2">
					</td>
				</tr>
				
				<!-- Upon Approval 验收后 -->
				<tr class="table-parent" id="row_04">
					<td colspan="4">
						Upon Approval 验收后
					</td>
				</tr>
				<tr class="child_row_04">
					<td>
						结算期 <br>Payment Term
					</td>
					<td>
						<input type="text" name="paymentDays_UponApproval" id="j_payment_paymentDays_UponApproval" value="" data-rule="required" size="5">
					</td>
					<td>
						收货或验收日期<br>Receiving or Approval date
					</td>
					<td>
						<input type="text" name="receivingOrApprovalDate_UponApproval" id="j_payment_receivingOrApprovalDate_UponApproval" value="" data-toggle="datepicker" data-rule="required;date">
					</td>
				</tr>
				<tr class="child_row_04">
					<td>
						订单号<br>PO No.
					</td>
					<td>
						<input type="text" name="PONo_UponApproval" id="j_payment_PONo_UponApproval" value="" data-rule="required">
					</td>
					<td>
						<label class="row-label">币别<br>Currency</label>
					</td>
					<td>
						<select name="currency_UponApproval" id="j_payment_currency_UponApproval" data-toggle="selectpicker" data-rule="required">
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
						<input type="text" name="amount_UponApproval" id="j_payment_amount_UponApproval" value="" data-rule="required">
					</td>
					<td colspan="2">
					</td>
				</tr>
				
				<!-- Upon invoice 见票后 -->
				<tr class="table-parent" id="row_05">
					<td colspan="4">
						Upon invoice 见票后 
					</td>
				</tr>
				<tr class="child_row_05">
					<td>
						结算期 <br>Payment Term
					</td>
					<td>
						<input type="text" name="paymentDays_UponInvoice" id="j_payment_paymentDays_UponInvoice" value="" data-rule="required" size="5">
					</td>
					<td>
						收货或验收日期<br>Receiving or Approval date
					</td>
					<td>
						<input type="text" name="receivingOrApprovalDate_UponInvoice" id="j_payment_receivingOrApprovalDate_UponInvoice" value="" data-toggle="datepicker" data-rule="required;date">
					</td>
				</tr>
				<tr class="child_row_05">
					<td>
						订单号<br>PO No.
					</td>
					<td>
						<input type="text" name="PONo_UponInvoice" id="j_payment_PONo_UponInvoice" value="" data-rule="required">
					</td>
					<td>
						<label class="row-label">币别<br>Currency</label>
					</td>
					<td>
						<select name="currency_UponInvoice" id="j_payment_currency_UponInvoice" data-toggle="selectpicker" data-rule="required">
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
						<input type="text" name="amount_UponInvoice" id="j_payment_amount_UponInvoice" value="" data-rule="required">
					</td>
					<td colspan="2">
					</td>
				</tr>
				
				<!-- Other 其他 -->
				<tr class="table-parent" id="row_06">
					<td colspan="4">
						Other 其他
					</td>
				</tr>
				<tr class="child_row_06">
					<td>
						结算期 <br>Payment Term
					</td>
					<td>
						<input type="text" name="paymentDays_Other" id="j_payment_paymentDays_Other" value="" data-rule="required" size="5">
					</td>
					<td>
						收货或验收日期<br>Receiving or Approval date
					</td>
					<td>
						<input type="text" name="receivingOrApprovalDate_Other" id="j_payment_receivingOrApprovalDate_Other" value="" data-toggle="datepicker" data-rule="required;date">
					</td>
				</tr>
				<tr class="child_row_06">
					<td>
						订单号<br>PO No.
					</td>
					<td>
						<input type="text" name="PONo_Other" id="j_payment_PONo_Other" value="" data-rule="required">
					</td>
					<td>
						<label class="row-label">币别<br>Currency</label>
					</td>
					<td>
						<select name="currency_Other" id="j_payment_currency_Other" data-toggle="selectpicker" data-rule="required">
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
						<input type="text" name="amount_Other" id="j_payment_amount_Other" value="" data-rule="required">
					</td>
					<td colspan="2">
					</td>
				</tr>
				
				<tr>
					<td>
						供应商代码<br>Supplier Code
					</td>
					<td>
						<input type="text" name="supplierCode" value="" data-rule="required">
					</td>
					<td>
						银行交易编码<br>Ref. No. of Bank
					</td>
					<td>
						<input type="text" name="refNoofBank" value="" data-rule="required">
					</td>
				</tr>
				<tr>
					<td>
						支付用途 <br>Usage Description
					</td>
					<td colspan="3">
						<textarea name="usageDescription" cols="60" rows="1" data-toggle="autoheight"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						金额(小写)<br>Amount in figures:
					</td>
					<td>
						<input type="text" name="amountInFigures" value=""  data-rule="required" >
					</td>
					<td>
						金额（大写）<br>Amount in words:
					</td>
					<td>
						<input type="text" name="AmountInWords" id="j_custom_name" value=""  >
					</td>
				</tr>
				<tr>
					<td>
						单据审核<br>Document Audit:
					</td>
					<td>
						<input type="text" name="documentAudit" id="j_custom_name" value="" readonly=""  >
					</td>
					<td>
						部门经理<br>Dept. Manager:
					</td>
					<td>
						<input type="text" name="deptManager" id="j_custom_name" value="" readonly="" >
					</td>
				</tr>
				<tr>
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
				</tr>
				<tr>
					<td>
						Attachment3 Other<br>（附件：其他）
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
				<tr>
            		<td colspan="4" align="center">
            			<button type="button" id="payment-invalid" class="btn-default" data-icon="close">Doc. Invalid(作废)</button>
            			<textarea name="invalidDescription" cols="30" rows="1" data-toggle="autoheight"></textarea><br><br>
            		</td>
            	</tr>
            	<tr>
            		<td colspan="4" align="center">
            			<button type="button" id="payment-return" class="btn-default" data-icon="arrow-down">Doc. Return(退回)</button>
            			<textarea name="rReturnDescription" cols="30" rows="1" data-toggle="autoheight"></textarea>
            		</td>
            	</tr>
				
			</table>		






        </form>
    </div>
</div>