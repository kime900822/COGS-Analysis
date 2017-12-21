<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">

</script>
<div class="bjui-pageContent">
    <div class="bs-example" style="width:1430px">
        <form action="../../json/ajaxDone.json" id="j_custom_form" data-toggle="ajaxform">
			
			<table width="1400px">
				<tr>
					<td width="300px" align="left"><img  style="width:300px;height:50px;" alt="payment" src="images/paymentlogo.png"></td>
					<td width="800px"  align="center"><h4 align="center">Cimtas(NingBo) Steel Processing CO.,LTD 庆达西（宁波）钢构制造有限公司</h4>
					<h5 align="center">Paymengt Application Form 付款申请单</h5>
					</td>
					<td width="200px"  align="left"><p id="flow-id">流水码:</p> <br /></td>
				</tr>
			</table>		
			<br />
			<table width="1400px">
				<tr>
					<td width="120px">Application Date<br/>(申请日期)</td>
					<td width="200px"><input type="text" name="custom.birthday" id="j_custom_birthday" value="1980-08-08" data-toggle="datepicker" data-rule="required;date"></td>
					<td width="160px">Request Payment Date<br/>(要求付款日期）</td>
					<td width="200px"><input type="text" name="custom.birthday" id="j_custom_birthday" value="1980-08-08" data-toggle="datepicker" data-rule="required;date"></td>
					<td width="180px">Contactural Payment Date<br/>(合同付款日期)</td>
					<td width="200px"><input type="text" name="custom.birthday" id="j_custom_birthday" value="1980-08-08" data-toggle="datepicker" data-rule="required;date"></td>
					<td width="40px">Urgent</td>
					<td width="120px"><input type="checkbox" name="urgent" id="j_custom_urgent" data-toggle="icheck" value="true" data-label=""></td>
				</tr>
				<tr>
					<td colspan="8">
					<br/>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="cash" id="j_custom_cash" data-toggle="icheck" value="true" data-label="支付现金 Cash"></td>
					<td><input type="checkbox" name="banking" id="j_custom_banking" data-toggle="icheck" value="true" data-label="银行支付 Banking"></td>
					<td></td>
					<td colspan="5"><input type="checkbox" name="cash" id="j_custom_cash" data-toggle="icheck" value="true" data-label="核销预付 Advance Write-off (Amount) ."></td>
				</tr>
			</table>            

			<table  width="1400px" border="1" cellspacing="0" style="font-size:8px;">
				<tr>
					<td width="30px"/>
					<td width="140px"/>
					<td width="50px"/>
					<td width="150px"/>
					<td width="100px"/>
					<td width="100px"/>
					<td width="100px"/>
					<td width="100px"/>
					<td width="80px"/>
					<td width="300px"/>
					<td width="50px"/>
					<td width="120px"/>
					<td width="80px"/>
				</tr>
				<tr>
					<td colspan="2" style="background:#8EE5EE">申请人:</td>
					<td colspan="2" rowspan="2"></td>
					<td colspan="4" style="background:#8EE5EE">收款人（全称）:</td>
					<td colspan="2" rowspan="2"></td>
					<td align="center" style="background:#8EE5EE">change<br/>变更</td>
					<td rowspan="2" style="background:#8EE5EE">供应商代码:<br/>Supplier Code:</td>
					<td rowspan="2"></td>
				</tr>
				<tr height="40px">
					<td colspan="2" style="background:#8EE5EE">Applicant:</td>
					<td colspan="4" style="background:#8EE5EE">Beneficiary:</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" style="background:#8EE5EE">所属部门:</td>
					<td colspan="2" rowspan="2"></td>
					<td colspan="4" style="background:#8EE5EE">银行及帐号:</td>
					<td colspan="2" rowspan="2"></td>
					<td align="center" style="background:#8EE5EE">change<br/>变更</td>
					<td rowspan="2" style="background:#8EE5EE">银行交易编码:<br/>Ref. No. of Bank:</td>
					<td rowspan="2"></td>
				</tr>
				<tr height="40px">
					<td colspan="2" style="background:#8EE5EE">Department of Applicant:</td>
					<td colspan="4" style="background:#8EE5EE">Beneficiary Account NO:</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" align="center" style="background:#8EE5EE">付款项目<br/>Payment Subject</td>
					<td colspan="2" align="center" style="background:#8EE5EE">结算期 <br/>Payment Term</td>
					<td align="center" style="background:#8EE5EE">收货或验收日期<br/>Receiving or Approval date</td>
					<td align="center" style="background:#8EE5EE">订单号<br/>PO No.</td>
					<td align="center" style="background:#8EE5EE">币别<br/>Currency</td>
					<td align="center" style="background:#8EE5EE">金额<br/>Amount</td>
					<td rowspan="8" align="center">支付用途<br/>Usage<br/>Description</td>
					<td colspan="4" rowspan="8"></td>
				</tr>
				<tr>
					<td align="center"><input type="checkbox" name="cash" id="j_payment_subject" data-toggle="icheck" value="true" ></td>
					<td>Fixed Asset 固定资产</td>
					<td></td>
					<td align="right">Advance<br/>预付款</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>	
				<tr>
					<td align="center"><input type="checkbox" name="cash" id="j_payment_subject" data-toggle="icheck" value="true" ></td>
					<td>Raw Material 原材料</td>
					<td></td>
					<td align="right">Payment at sight<br/>见票即付</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>	
				<tr>
					<td align="center"><input type="checkbox" name="cash" id="j_payment_subject" data-toggle="icheck" value="true" ></td>
					<td>Consumable 消耗品</td>
					<td></td>
					<td align="right">Upon receiving<br/>收货后</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>	
				<tr>
					<td align="center"><input type="checkbox" name="cash" id="j_payment_subject" data-toggle="icheck" value="true" ></td>
					<td>Subcontractor 外包</td>
					<td></td>
					<td align="right">Upon Approval<br/>验收后</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>	
				<tr>
					<td align="center"><input type="checkbox" name="cash" id="j_payment_subject" data-toggle="icheck" value="true" ></td>
					<td>Service 服务</td>
					<td></td>
					<td align="right">Upon invoice<br/>见票后</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>	
				<tr>
					<td align="center"><input type="checkbox" name="cash" id="j_payment_subject" data-toggle="icheck" value="true" ></td>
					<td>Petty Cash备用金</td>
					<td></td>
					<td align="right">Other<br/>其他</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>	
				<tr>
					<td align="center"><input type="checkbox" name="cash" id="j_payment_subject" data-toggle="icheck" value="true" ></td>
					<td>Other 其他</td>
					<td></td>
					<td align="right"><br/><br/></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>		
				<tr>
					<td colspan="2" align="right" style="background:#8EE5EE">金额(小写)<br/>Amount in figures:</td>
					<td colspan="6"></td>
					<td align="right" style="background:#8EE5EE">金额(大写)<br/>Amount in words:</td>
					<td colspan="2"></td>
					<td align="right" style="background:#8EE5EE">Document Audit:<br/>单据审核</td>
					<td></td>
				</tr>		
			</table>
			<br>
			<table  width="1400px" >
				<tr>
					<td width="25%">General Manager:<br/>总经理</td>
					<td width="25%">Finance Manager:<br/>财务经理</td>
					<td width="25%">Finance Supervisor:<br/>财务主管</td>
					<td width="25%">Dept. Manager:<br/>部门经理</td>				
				</tr>
			</table>
			<br/>
			<table width="1400px">
				<tr>
					<td align="right" width="50%">
						<label class="row-label">Attachment1 Invoice （附件：发票）</label>
					</td>
					<td align="left" width="50%">
		                <div class="row-input"><input type="file" name="upfile1"  accept="application/vnd.ms-excel,.xlsx" data-rule=""></div>
	                </td>
                </tr>
       			<tr>
       				<td align="right">
						<label class="row-label">Attachment1 Invoice （附件：发票）</label>
					</td>
	       			<td align="left">
		                <div class="row-input"><input type="file" name="upfile2"  accept="application/vnd.ms-excel,.xlsx" data-rule=""></div>
	                </td>
                </tr>
       			<tr>
       				<td align="right">
						<label class="row-label">Attachment1 Invoice （附件：发票）</label>
					</td>
	       			<td align="left">
		                <div class="row-input"><input type="file" name="upfile3"  accept="application/vnd.ms-excel,.xlsx" data-rule=""></div>
					</td>
				</tr>
				<tr >
					<td colspan="2" align="center" height="30px">
						<button type="button" class="btn-default">Save(保存)</button>
						<button type="button" class="btn-default">Submit(送审)</button>
						<button type="button" class="btn-default">Approve(同意)</button>
						<button type="button" class="btn-default">Reject(拒绝)</button>
						<button type="button" class="btn-default">Print Out(打印)</button>
					</td>
				</tr>
				<tr>
					<td align="right" height="30px">
						<button type="button" class="btn-default">Doc. Invalid(单据作废)</button>
					</td>
					<td align="left">
					
					</td>
				</tr>
				<tr>
					<td align="right" height="30px">
						<button type="button" class="btn-default">Doc. Return(单据退回)</button>
					</td>
					<td align="left">
					
					</td>
				</tr>
			</table>
        </form>
    </div>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
        <li><button type="submit" class="btn-default" data-icon="save">保存</button></li>
    </ul>
</div>