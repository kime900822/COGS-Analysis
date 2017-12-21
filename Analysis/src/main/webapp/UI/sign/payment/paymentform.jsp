<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function(){
	
	
	
	
	
})

</script>
<div class="bjui-pageContent">
    <div class="bs-example">
        <form action="../../json/ajaxDone.json" id="j_custom_form" data-toggle="ajaxform">
            <input type="hidden" name="custom.id" value="edce142bc2ed4ec6b623aacaf602a4de">
            <div class="bjui-row-0" align="center">
            <h2 class="row-label">Payment Application Form 付款申请单</h2>
            </div>
            <div class="bjui-row col-2" >
                <label class="row-label">Application Date<br>申请日期）</label>
                <div class="row-input required">
                    <input type="text" name="custom.birthday" id="j_custom_birthday" value="" data-toggle="datepicker" data-rule="required;date">
                </div>
                <label class="row-label">Request Payment Date<br>(要求付款日期）</label>
                <div class="row-input">
                    <input type="text" name="custom.birthday" id="j_custom_birthday" value="" data-toggle="datepicker" data-rule="required;date">
                </div>
                <label class="row-label">Contactural Payment Date<br>（合同付款日期）</label>
                <div class="row-input">
                   <input type="text" name="custom.birthday" id="j_custom_birthday" value="" data-toggle="datepicker" data-rule="required;date">
                </div>
                <label class="row-label">Urgent</label>
                <div class="row-input">
                    <input type="checkbox" name="custom.visa" id="j_custom_visa" data-toggle="icheck" value="true" data-label="">
                </div>           
                <label class="row-label">支付现金 <br>Cash</label>
                <div class="row-input">
                    <input type="checkbox" name="custom.visa" id="j_custom_visa" data-toggle="icheck" value="true" data-label="">
                </div>
                <label class="row-label">银行支付<br> Banking</label>
                <div class="row-input">
                    <input type="checkbox" name="custom.visa" id="j_custom_visa" data-toggle="icheck" value="true" data-label="">
                </div>
                <label class="row-label" >核销预付 <br>Advance Write-off (Amount) .</label>
                <div class="row-input">
                    <input type="checkbox" name="custom.visa" id="j_custom_visa" data-toggle="icheck" value="true" data-label="">
                </div><br>
                <label class="row-label">申请人<br>Applicant:</label>
                <div class="row-input">
                	<input type="text" name="custom.name" id="j_custom_name" value="${user.uid}-${user.name}" readonly="" data-rule="required">
                </div>
                <label class="row-label">所属部门<br>Department of Applicant:</label>
                <div class="row-input">
                    <input type="text" name="custom.name" id="j_custom_name" value="${user.department.name}-${user.department.did}" readonly="" data-rule="required">
                </div>
                <label class="row-label">收款人（全称）<br>Beneficiary:</label>
                <div class="row-input required">
                    <select name="custom.sale" id="j_custom_sale" data-toggle="selectpicker" data-rule="required">
                        <option value=""></option>
                    </select>
                </div>
                
                
                <label class="row-label">银行及帐号<br>Beneficiary Account NO.</label>
                <div class="row-input">
                     <input type="text" name="custom.name" id="j_custom_name" value="" readonly="" data-rule="required">
                </div>
                <label class="row-label">变更<br>Change</label>
                <div class="row-input">
                    <input type="checkbox" name="custom.visa" id="j_custom_visa" data-toggle="icheck" value="true" data-label="">
                </div>
                <label class="row-label">变更<br>Change</label>
                <div class="row-input">
                     <input type="checkbox" name="custom.visa" id="j_custom_visa" data-toggle="icheck" value="true" data-label="">
                </div>
                
                <label class="row-label">付款项目<br>Payment Subject</label>
                <div class="row-input required">
                    <select name="custom.sale" id="j_custom_sale" data-toggle="selectpicker" data-rule="required">
                        <option value=""></option>
                        <option value="1">Fixed Asset 固定资产</option>
                        <option value="2">Raw Material 原材料</option>
                        <option value="3">Consumable 消耗品</option>
                        <option value="4">Subcontractor 外包</option>
                        <option value="5">Service 服务</option>
                        <option value="6">Petty Cash备用金</option>
                        <option value="7">Other 其他</option>
                    </select>
                </div>
                
                <label class="row-label">结算期 <br>Payment Term</label>
                <div class="row-input required">
                	<input type="text" name="custom.name" id="j_custom_name" value="" data-rule="required" size="5">
                	<span style="text-align:right; color:#777; font-weight:normal;">Days</span>
                    <select name="custom.sale" id="j_custom_sale" data-toggle="selectpicker" data-rule="required">
                        <option value=""></option>
                        <option value="1">Advance预付款</option>
                        <option value="2">Payment at sight 见票即付</option>
                        <option value="3">Upon receiving 收货后</option>
                        <option value="4">Upon Approval 验收后</option>
                        <option value="5">Upon invoice 见票后</option>
                        <option value="6">Other 其他</option>
                    </select>
                </div>
               
                <label class="row-label">收货或验收日期<br>Receiving or Approval date</label>
                <div class="row-input">
                    <input type="text" name="custom.name" id="j_custom_name" value="" data-rule="required">
                </div>
                <label class="row-label">订单号<br>PO No.</label>
                <div class="row-input">
                    <input type="text" name="custom.name" id="j_custom_name" value="" data-rule="required">
                </div>
                <label class="row-label">币别<br>Currency</label>
                <div class="row-input">
                    <select name="custom.sale" id="j_custom_sale" data-toggle="selectpicker" data-rule="required">
                        <option value=""></option>
                        <option value="1">RMB</option>
                        <option value="2">USD</option>
                        <option value="3">EUR</option>
                        <option value="4">GBP</option>
                    </select>
                </div>
                <label class="row-label">金额<br>Amount</label>
                <div class="row-input">
                    <input type="text" name="custom.name" id="j_custom_name" value="" data-rule="required">
                </div>
                
				<label class="row-label">供应商代码<br>Supplier Code</label>
                <div class="row-input">
                    <input type="text" name="custom.name" id="j_custom_name" value="" data-rule="required">
                </div>
                <label class="row-label">银行交易编码<br>Ref. No. of Bank</label>
                <div class="row-input">
                    <input type="text" name="custom.name" id="j_custom_name" value="" data-rule="required">
                </div>
                
                <label class="row-label">支付用途 <br>Usage Description</label>
                <div class="row-input">
                    <textarea cols="60" rows="1" data-toggle="autoheight"></textarea>
                </div><br>
                <label class="row-label">金额(小写)<br>Amount in figures:</label>
                <div class="row-input">
                    <input type="text" name="custom.name" id="j_custom_name" value=""  data-rule="required" >
                </div>
                <label class="row-label">金额（大写）<br>Amount in words:</label>
                <div class="row-input">
                    <input type="text" name="custom.name" id="j_custom_name" value=""  >
                </div>
                <label class="row-label">单据审核<br>Document Audit:</label>
                <div class="row-input">
                    <input type="text" name="custom.name" id="j_custom_name" value="" readonly=""  >
                </div>
                <label class="row-label">部门经理<br>Dept. Manager:</label>
                <div class="row-input">
                    <input type="text" name="custom.name" id="j_custom_name" value="" readonly="" >
                </div>

                <label class="row-label">Attachment1 Invoice<br>（附件：发票）</label>
                <div class="row-input">
                    <input type="file" data-name="custom.pic" data-toggle="webuploader" data-options="
                        {
                            pick: {label: '点击选择文件'},
                            server: '../../json/ajaxUpload.json',
                            fileNumLimit: 2,
                            formData: {dir:'custompic'},
                            required: true,
                            uploaded: '',
                            basePath: '',
                            accept: {
                                title: '发票',
                                extensions: 'xls,xlsx,doc,docx',
                                mimeTypes: '.xls,.xlsx,.doc,.docx'
                            }
                        }"
                    >
                </div>
                <label class="row-label">Attachment2 Contract<br>（附件：合同）</label>
                <div class="row-input">
                    <input type="file" data-name="custom.pic" data-toggle="webuploader" data-options="
                        {
                            pick: {label: '点击选择文件'},
                            server: '../../json/ajaxUpload.json',
                            fileNumLimit: 1,
                            formData: {dir:'custompic'},
                            required: true,
                            uploaded: '',
                            basePath: '',
                            accept: {
                                title: '图片',
                                extensions: 'xls,xlsx,doc,docx',
                                mimeTypes: '.xls,.xlsx,.doc,.docx'
                            }
                        }"
                    >
                </div>
                
                <label class="row-label">Attachment3 Other<br>（附件：其他）</label>
                <div class="row-input">
                    <input type="file" data-name="custom.pic" data-toggle="webuploader" data-options="
                        {
                            pick: {label: '点击选择文件'},
                            server: '../../json/ajaxUpload.json',
                            fileNumLimit: 1,
                            formData: {dir:'custompic'},
                            required: true,
                            uploaded: '',
                            basePath: '',
                            accept: {
                                title: '图片',
                                extensions: 'xls,xlsx,doc,docx',
                                mimeTypes: '.xls,.xlsx,.doc,.docx'
                            }
                        }"
                    >
                </div>
            
            
            </div>           
          
        </form>
        <table width="100%">
            	<tr>
            		<td align="center">
            		<br><br>
	            		<button type="button" class="btn-default" data-icon="save" size="">Save(保存)</button>
	            		<button type="button" class="btn-default" data-icon="arrow-up" size="">Submit(送审)</button>
	            		<button type="button" class="btn-default" data-icon="check" size="">Approve(同意)</button>
	            		<button type="button" class="btn-default" data-icon="close" size="">Reject(拒绝)</button>
	            		<button type="button" class="btn-default" data-icon="print" size="">Print Out(打印)</button>
	            		<button type="button" class="btn-default" data-icon="undo" size="">Assign(转交)</button><br><br>
            		</td>
            	</tr>
            	<tr>
            		<td align="center">
            			<button type="button" class="btn-default" data-icon="close">Doc. Invalid(作废)</button>
            			<textarea cols="30" rows="1" data-toggle="autoheight"></textarea><br><br>
            		</td>
            	</tr>
            	<tr>
            		<td align="center">
            			<button type="button" class="btn-default" data-icon="arrow-down">Doc. Return(退回)</button>
            			<textarea cols="30" rows="1" data-toggle="autoheight"></textarea>
            		</td>
            	</tr>
        </table>
    </div>
</div>
