<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function(){
	
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
	})	

	$.CurrentNavtab.find('#payment-save').click(function(){
		
		$.CurrentNavtab.find("#j_payment_form").attr("action", "savePayment.action").submit();
	})
	
	
	//$.CurrentNavtab.find('#j_payment_amountInFigures').html(smalltoBIG(521212));
})

	function changeBeneficiary(){
		$.CurrentNavtab.find('#j_payment_beneficiaryAccountNO').val($.CurrentNavtab.find('#j_payment_beneficiary').val())
		
	
	
	}

</script>
<div class="bjui-pageContent">
    <div class="bs-example" style="width:1340px">
        <form action="../../json/ajaxDone.json" id="j_payment_form" data-toggle="ajaxform">
			
			<table class="table">
				<tr>
					<td width="200px" align="left"><img  style="width:300px;height:50px;" alt="payment" src="images/paymentlogo.png"></td>
					<td width="700px"  align="center"><h4 align="center">Cimtas(NingBo) Steel Processing CO.,LTD 庆达西（宁波）钢构制造有限公司</h4>
					<h5 align="center">Paymengt Application Form 付款申请单</h5>
					</td>
					<td width="100px"  align="left"><br><p id="flow-id">流水码:</p> <br /></td>
				</tr>
			</table>		
			<br />
			<table class="table">
				<tr>
					<td width="120px">Application Date<br/>(申请日期)</td>
					<td width="200px"><input type="text" name="applicationDate" id="j_payment_applicationDate" value="" data-toggle="datepicker" data-rule="required;date"></td>
					<td width="160px">Request Payment Date<br/>(要求付款日期）</td>
					<td width="200px"><input type="text" name="requestPaymentDate" id="j_payment_requestPaymentDate" value="" data-toggle="datepicker" data-rule="required;date"></td>
					<td width="180px">Contactural Payment Date<br/>(合同付款日期)</td>
					<td width="200px"><input type="text" name="contacturalPaymentDate" id="j_payment_contacturalPaymentDate" value="" data-toggle="datepicker" data-rule="required;date"></td>
					<td width="40px">Urgent</td>
					<td width="120px"><input type="checkbox" name="urgent" id="j_payment_urgent" data-toggle="icheck" value="true" data-label=""></td>
				</tr>
				<tr>
					<td colspan="8">
					<br/>
					</td>
				</tr>
				<tr>
					<td><input type="radio" name="payType" id="j_payment_payType" data-toggle="icheck" value="Cash" data-label="支付现金 Cash"></td>
					<td><input type="radio" name="payType" id="j_payment_payType" data-toggle="icheck" value="Banking" data-label="银行支付 Banking"></td>
					<td></td>
					<td colspan="5"><input type="checkbox" name="cash" id="j_custom_cash" data-toggle="icheck" value="true" data-label="核销预付 Advance Write-off (Amount) ."></td>
				</tr>
			</table>            

			<table class="table" border="1" cellspacing="0" bordercolor="#ddd" style="font-size:8px;">
				<tr>
					<td colspan="2" style="background:#8EE5EE">申请人:</td>
					<td colspan="2" style="text-align:center;border-bottom:0px" >${user.uid}</td>
					<td colspan="4" style="background:#8EE5EE">收款人（全称）:</td>
					<td colspan="2" rowspan="2">
						<select name="beneficiary" id="j_payment_beneficiary" data-toggle="selectpicker" data-rule="required" onchange="changeBeneficiary()" data-width="200">
                        		<option value=""></option>
                   		</select>
                    </td>
					<td align="center" style="background:#8EE5EE;text-align:center;">change<br/>变更</td>
					<td rowspan="2" style="background:#8EE5EE;text-align:center;">供应商代码:<br/>Supplier Code:</td>
					<td rowspan="2" style="text-align:center"><input type="text" name="supplierCode" value="" data-rule="required" data-width="200"></td>
				</tr>
				<tr >
					<td colspan="2" style="background:#8EE5EE">Applicant:</td>
					<td colspan="2"  style="text-align:center">${user.name}</td>
					<td colspan="4" style="background:#8EE5EE">Beneficiary:</td>
					<td style="text-align:center"><input type="checkbox" name="beneficiaryChange" id="j_payment_beneficiaryChange" data-toggle="icheck" value="true" data-label=""></td>
				</tr>
				<tr>
					<td colspan="2" style="background:#8EE5EE">所属部门:</td>
					<td colspan="2" style="text-align:center">${user.department.name}</td>
					<td colspan="4" style="background:#8EE5EE">银行及帐号:</td>
					<td colspan="2" rowspan="2"> <input type="text" name="beneficiaryAccountNO" id="j_payment_beneficiaryAccountNO" value="" readonly="" data-rule="required" data-width="200"></td>
					<td align="center" style="background:#8EE5EE;text-align:center;">change<br/>变更</td>
					<td rowspan="2" style="background:#8EE5EE;text-align:center;">银行交易编码:<br/>Ref. No. of Bank:</td>
					<td rowspan="2" ><input type="text" name="refNoofBank" value="" data-rule="required"></td>
				</tr>
				<tr height="40px">
					<td colspan="2" style="background:#8EE5EE">Department of Applicant:</td>
					<td colspan="2" style="text-align:center">${user.department.did}</td>
					<td colspan="4" style="background:#8EE5EE">Beneficiary Account NO:</td>
					<td style="text-align:center"><input type="checkbox" name="beneficiaryAccountNOChange" id="j_payment_beneficiaryAccountNOChange" data-toggle="icheck" value="true" data-label=""></td>
				</tr>
				<tr>
					<td colspan="2" align="center" style="background:#8EE5EE">付款项目<br/>Payment Subject</td>
					<td colspan="2" align="center" style="background:#8EE5EE">结算期 <br/>Payment Term</td>
					<td align="center" style="background:#8EE5EE" width="100px">收货或验收日期<br/>Receiving or Approval date</td>
					<td align="center" style="background:#8EE5EE" width="100px">订单号<br/>PO No.</td>
					<td align="center" style="background:#8EE5EE">币别<br/>Currency</td>
					<td align="center" style="background:#8EE5EE">金额<br/>Amount</td>
					<td rowspan="8" align="center" width="100px">支付用途<br/>Usage<br/>Description</td>
					<td colspan="4" rowspan="8"></td>
				</tr>
				
				
				
				<tr>
					<td align="center"><input type="radio" name="cash" id="j_payment_subject" data-toggle="icheck" value="true" ></td>
					<td>Fixed Asset 固定资产</td>
					<td><input type="text" name="paymentDays" id="j_custom_name" value="" size="5">days</td>
					<td align="right">Advance<br/>预付款</td>
					<td><input type="text" name="receivingOrApprovalDate" value="" data-toggle="datepicker" data-rule="required;date"></td>
					<td><input type="text" name="PONo"  value="" data-rule="required"></td>
					<td> 
						<select name="currency" data-toggle="selectpicker" data-rule="required">
	                        <option value=""></option>
	                        <option value="RMB">RMB</option>
	                        <option value="USD">USD</option>
	                        <option value="EUR">EUR</option>
	                        <option value="GBP">GBP</option>
                    	</select>
                    </td>
					<td><input type="text" name="amount" value="" size="10" data-rule="number"></td>
				</tr>	
				<tr>
					<td align="center"><input type="radio" name="cash" id="j_payment_subject" data-toggle="icheck" value="true" ></td>
					<td>Raw Material 原材料</td>
					<td><input type="text" name="paymentDays" id="j_custom_name" value="" size="5">days</td>
					<td align="right">Payment at sight<br/>见票即付</td>
					<td><input type="text" name="receivingOrApprovalDate" value="" data-toggle="datepicker" data-rule="required;date"></td>
					<td><input type="text" name="PONo"  value="" data-rule="required"></td>
					<td> 
						<select name="currency" data-toggle="selectpicker" data-rule="required">
	                        <option value=""></option>
	                        <option value="RMB">RMB</option>
	                        <option value="USD">USD</option>
	                        <option value="EUR">EUR</option>
	                        <option value="GBP">GBP</option>
                    	</select>
                    </td>
					<td><input type="text" name="amount" value="" size="10" data-rule="number"></td>
				</tr>	
				<tr>
					<td align="center"><input type="radio" name="cash" id="j_payment_subject" data-toggle="icheck" value="true" ></td>
					<td>Consumable 消耗品</td>
					<td><input type="text" name="paymentDays" id="j_custom_name" value="" size="5">days</td>
					<td align="right">Upon receiving<br/>收货后</td>
					<td><input type="text" name="receivingOrApprovalDate" value="" data-toggle="datepicker" data-rule="required;date"></td>
					<td><input type="text" name="PONo"  value="" data-rule="required"></td>
					<td> 
						<select name="currency" data-toggle="selectpicker" data-rule="required">
	                        <option value=""></option>
	                        <option value="RMB">RMB</option>
	                        <option value="USD">USD</option>
	                        <option value="EUR">EUR</option>
	                        <option value="GBP">GBP</option>
                    	</select>
                    </td>
					<td><input type="text" name="amount" value="" size="10" data-rule="number"></td>
				</tr>	
				<tr>
					<td align="center"><input type="radio" name="cash" id="j_payment_subject" data-toggle="icheck" value="true" ></td>
					<td>Subcontractor 外包</td>
					<td><input type="text" name="paymentDays" id="j_custom_name" value="" size="5">days</td>
					<td align="right">Upon Approval<br/>验收后</td>
					<td><input type="text" name="receivingOrApprovalDate" value="" data-toggle="datepicker" data-rule="required;date"></td>
					<td><input type="text" name="PONo"  value="" data-rule="required"></td>
					<td> 
						<select name="currency" data-toggle="selectpicker" data-rule="required">
	                        <option value=""></option>
	                        <option value="RMB">RMB</option>
	                        <option value="USD">USD</option>
	                        <option value="EUR">EUR</option>
	                        <option value="GBP">GBP</option>
                    	</select>
                    </td>
					<td><input type="text" name="amount" value="" size="10" data-rule="number"></td>
				</tr>	
				<tr>
					<td align="center"><input type="radio" name="cash" id="j_payment_subject" data-toggle="icheck" value="true" ></td>
					<td>Service 服务</td>
					<td><input type="text" name="paymentDays" id="j_custom_name" value="" size="5">days</td>
					<td align="right">Upon invoice<br/>见票后</td>
					<td><input type="text" name="receivingOrApprovalDate" value="" data-toggle="datepicker" data-rule="required;date"></td>
					<td><input type="text" name="PONo"  value="" data-rule="required"></td>
					<td> 
						<select name="currency" data-toggle="selectpicker" data-rule="required">
	                        <option value=""></option>
	                        <option value="RMB">RMB</option>
	                        <option value="USD">USD</option>
	                        <option value="EUR">EUR</option>
	                        <option value="GBP">GBP</option>
                    	</select>
                    </td>
					<td><input type="text" name="amount" value="" size="10" data-rule="number"></td>
				</tr>	
				<tr>
					<td align="center"><input type="radio" name="cash" id="j_payment_subject" data-toggle="icheck" value="true" ></td>
					<td>Petty Cash备用金</td>
					<td><input type="text" name="paymentDays" id="j_custom_name" value="" size="5">days</td>
					<td align="right">Other<br/>其他</td>
					<td><input type="text" name="receivingOrApprovalDate" value="" data-toggle="datepicker" data-rule="required;date"></td>
					<td><input type="text" name="PONo"  value="" data-rule="required"></td>
					<td> 
						<select name="currency" data-toggle="selectpicker" data-rule="required">
	                        <option value=""></option>
	                        <option value="RMB">RMB</option>
	                        <option value="USD">USD</option>
	                        <option value="EUR">EUR</option>
	                        <option value="GBP">GBP</option>
                    	</select>
                    </td>
					<td><input type="text" name="amount" value=""  size="10" data-rule="number"></td>
				</tr>	
				<tr>
					<td align="center"><input type="radio" name="cash" id="j_payment_subject" data-toggle="icheck" value="true" ></td>
					<td>Other 其他</td>
					<td></td>
					<td align="right"><br/><br/></td>
					<td></td>
					<td></td>
					<td> 
						
                    </td>
					<td></td>
				</tr>		
				<tr>
					<td colspan="2" align="right" style="background:#8EE5EE">金额(小写)<br/>Amount in figures:</td>
					<td colspan="3"><label name="amountInFigures" id="j_payment_amountInFigures"></label></td>
					<td align="right" style="background:#8EE5EE">金额(大写)<br/>Amount in words:</td>
					<td colspan="5"><label name="AmountInWords" id="j_payment_AmountInWords"></label></td>
					<td align="right" style="background:#8EE5EE">Document Audit:<br/>单据审核</td>
					<td></td>
				</tr>		
			</table>
			<br>
			<table class="table"  >
				<tr>
					<td width="25%">General Manager:<br/>总经理</td>
					<td width="25%">Finance Manager:<br/>财务经理</td>
					<td width="25%">Finance Supervisor:<br/>财务主管</td>
					<td width="25%">Dept. Manager:<br/>部门经理</td>				
				</tr>
			</table>
			<br/>
			<table class="table">
				<tr>
					<td align="right">
						Attachment1 Invoice<br>（附件：发票）
					</td>
					<td align="left" >
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
       				<td align="right">
						Attachment2 Contract<br>（附件：合同）
					</td>
	       			<td align="left">
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
       				<td align="right">
						Attachment3 Other<br>（附件：其他）
					</td>
	       			<td align="left">
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
					<td></td>
					<td colspan="4">
						<button type="button" id="payment-save" class="btn-default" data-icon="save" size="">Save(保存)</button>
	            		<button type="button" id="payment-submit" class="btn-default" data-icon="arrow-up" size="">Submit(送审)</button>
	            		<button type="button" id="payment-approve" class="btn-default" data-icon="check" size="">Approve(同意)</button>
	            		<button type="button" id="payment-Reject" class="btn-default" data-icon="close" size="">Reject(拒绝)</button>
	            		<button type="button" id="payment-Print" class="btn-default" data-icon="print" size="">Print Out(打印)</button>
	            		<button type="button" id="payment-assign" class="btn-default" data-icon="undo" size="">Assign(转交)</button>
					</td>
					<td></td>			
				</tr>
				<tr>
					<td></td>	
					<td colspan="4">
						<button type="button" id="payment-invalid" class="btn-default" data-icon="close">Doc. Invalid(作废)</button>
            			<textarea name="invalidDescription" cols="30" rows="1" data-toggle="autoheight"></textarea>
					</td>
					<td></td>		
				</tr>
				<tr>
					<td></td>	
					<td colspan="4">
						<button type="button" id="payment-return" class="btn-default" data-icon="arrow-down">Doc. Return(退回)</button>
            			<textarea name="rReturnDescription" cols="30" rows="1" data-toggle="autoheight"></textarea>
					</td>
					<td></td>		
				</tr>
			</table>
        </form>
    </div>
</div>