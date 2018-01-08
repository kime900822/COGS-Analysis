<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<!-- bootstrap - css -->
<link href="../../B-JUI/themes/css/bootstrap.css" rel="stylesheet">
<!-- core - css -->
<link href="../../B-JUI/themes/css/style.css" rel="stylesheet">
<link href="../../B-JUI/themes/blue/core.css" id="bjui-link-theme" rel="stylesheet">
<link href="../../B-JUI/themes/css/fontsize.css" id="bjui-link-theme" rel="stylesheet">
<!-- plug - css -->
<link href="../../B-JUI/plugins/kindeditor_4.1.11/themes/default/default.css" rel="stylesheet">
<link href="../../B-JUI/plugins/colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet">
<link href="../../B-JUI/plugins/nice-validator-1.0.7/jquery.validator.css" rel="stylesheet">
<link href="../../B-JUI/plugins/bootstrapSelect/bootstrap-select.css" rel="stylesheet">
<link href="../../B-JUI/plugins/webuploader/webuploader.css" rel="stylesheet">
<link href="../../B-JUI/themes/css/FA/css/font-awesome.min.css" rel="stylesheet">
<!-- Favicons -->
<link rel="apple-touch-icon-precomposed" href="images/logo2.png">
<link rel="shortcut icon" href="images/logo2.png">
<!--[if lte IE 7]>
<link href="../../B-JUI/themes/css/ie7.css" rel="stylesheet">
<![endif]-->
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lte IE 9]>
    <script src="../../B-JUI/other/html5shiv.min.js"></script>
    <script src="../../B-JUI/other/respond.min.js"></script>
<![endif]-->
<!-- jquery -->
<script src="../../B-JUI/js/jquery-1.11.3.min.js"></script>
<script src="../../B-JUI/js/jquery.cookie.js"></script>
<!--[if lte IE 9]>
<script src="../../B-JUI/other/jquery.iframe-transport.js"></script>
<![endif]-->
<!-- ../../B-JUI -->
<%-- <script src="../../B-JUI/js/bjui-all.min.js"></script> --%>
<script src="../../B-JUI/js/bjui-all.js"></script>
<!-- plugins -->
<!-- swfupload for kindeditor -->
<script src="../../B-JUI/plugins/swfupload/swfupload.js"></script>
<!-- Webuploader -->
<script src="../../B-JUI/plugins/webuploader/webuploader.js"></script>
<!-- kindeditor -->
<script src="../../B-JUI/plugins/kindeditor_4.1.11/kindeditor-all-min.js"></script>
<script src="../../B-JUI/plugins/kindeditor_4.1.11/lang/zh-CN.js"></script>
<!-- colorpicker -->
<script src="../../B-JUI/plugins/colorpicker/js/bootstrap-colorpicker.min.js"></script>
<!-- ztree -->
<script src="../../B-JUI/plugins/ztree/jquery.ztree.all-3.5.js"></script>
<!-- nice validate -->
<script src="../../B-JUI/plugins/nice-validator-1.0.7/jquery.validator.js"></script>
<script src="../../B-JUI/plugins/nice-validator-1.0.7/jquery.validator.themes.js"></script>
<!-- bootstrap plugins -->
<script src="../../B-JUI/plugins/bootstrap.min.js"></script>
<script src="../../B-JUI/plugins/bootstrapSelect/bootstrap-select.min.js"></script>
<script src="../../B-JUI/plugins/bootstrapSelect/defaults-zh_CN.min.js"></script>
<!-- icheck -->
<script src="../../B-JUI/plugins/icheck/icheck.min.js"></script>
<!-- HighCharts -->
<script src="../../B-JUI/plugins/highcharts/highcharts.js"></script>
<script src="../../B-JUI/plugins/highcharts/highcharts-3d.js"></script>
<script src="../../B-JUI/plugins/highcharts/themes/gray.js"></script>
<!-- other plugins -->
<script src="../../B-JUI/plugins/other/jquery.autosize.js"></script>
<link href="../../B-JUI/plugins/uploadify/css/uploadify.css" rel="stylesheet">
<script src="../../B-JUI/plugins/uploadify/scripts/jquery.uploadify.min.js"></script>
<script src="../../B-JUI/plugins/download/jquery.fileDownload.js"></script>
<!-- util -->
<script src="../../B-JUI/js/util.js"></script>

<style>
tr { font-family:"Microsoft YaHei",微软雅黑,"MicrosoftJhengHei",华文细黑,STHeiti,MingLiu;font-weight:bold} 
</style>

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
	
})

	function changeBeneficiary(){
		$.CurrentNavtab.find('#j_payment_beneficiaryAccountNO').val($.CurrentNavtab.find('#j_payment_beneficiary').val())
		
	
	
	}

</script>

    <div  style="width:1200px;padding:20px" >
			<table  style="font-size:9px;">
				<tr height="9px">
					<td colspan="2" align="right" >
						<p id="print-payment-id" >流水码:</p>
					</td>
				</tr>
				<tr>
					<td width="200px" align="left"><img  style="width:300px;height:50px;" alt="payment" src="../../images/printLogo.png"></td>
					<td width="1000px"  align="center"><h4 align="center" style="font-weight:bold">Cimtas(NingBo) Steel Processing CO.,LTD 庆达西（宁波）钢构制造有限公司</h4>
					<h5 align="center" style="font-weight:bold">Paymengt Application Form 付款申请单</h5>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right" style="">
						<p id="print-payment-Urgent" style="font-size:9px">Urgent:</p>
					</td>
				</tr>
			</table>		
			<table style="font-size:9px;">
				<tr>
					<td width="300px" id="j_payment_applicationDate" >Application Date(申请日期)</td>
					<td width="400px" id="j_payment_requestPaymentDate">Request Payment Date(要求付款日期）</td>
					<td width="400px" id="j_payment_contacturalPaymentDate">Contactural Payment Date(合同付款日期)</td>
					<td width="100px"></td>
				</tr>
				<tr>
					<td colspan="4">
						<input type="checkbox" id="j_payment_payType" >支付现金 Cash &nbsp&nbsp&nbsp&nbsp
						<input type="checkbox" id="j_payment_payType" >银行支付 Banking &nbsp&nbsp&nbsp&nbsp
						<input type="checkbox" id="j_custom_cash">核销预付 Advance Write-off (Amount) . &nbsp&nbsp&nbsp&nbsp
					</td>
				</tr>
			</table>            

			<table width="1200px" border="2" cellspacing="1" bordercolor="black" style="font-size:9px;">
				<tr>
					<th width="30px"></th>
					<th width="140px"></th>
					<th width="30px"></th>
					<th width="140px"></th>
					<th width="100px"></th>
					<th width="60px"></th>
					<th width="80px"></th>
					<th width="80px"></th>
					<th width="100px"></th>
					<th width="160px"></th>
					<th width="50px"></th>
					<th width="130px"></th>
					<th width="100px"></th>
				</tr>
				<tr>
					<td colspan="2" rowspan="2" style="background:#B7DEE8">申请人:<br>Application:</td>
					<td colspan="2" rowspan="2" style="text-align:center;border-bottom:0px" >${user.uid}</td>
					<td colspan="4" rowspan="2" style="background:#B7DEE8">收款人（全称）:<br>Beneficiary:</td>
					<td colspan="2" rowspan="2">
                    </td>
					<td align="center" style="background:#B7DEE8;text-align:center;">change<br/>变更</td>
					<td rowspan="2" style="background:#B7DEE8;text-align:center;">供应商代码:<br/>Supplier Code:</td>
					<td rowspan="2" style="text-align:center"> </td>
				</tr>
				<tr >
					<td style="text-align:center">
					<input type="checkbox" id="j_payment_payType" >
					</td>
				</tr>
				<tr>
					<td colspan="2" rowspan="2" style="background:#B7DEE8">所属部门:<br>Department of Applicant:</td>
					<td colspan="2" rowspan="2" style="text-align:center">${user.department.name}</td>
					<td colspan="4" rowspan="2" style="background:#B7DEE8">银行及帐号:<br>Beneficiary Account NO:</td>
					<td colspan="2" rowspan="2">
					</td>
					<td align="center" style="background:#B7DEE8;text-align:center;">change<br/>变更</td>
					<td rowspan="2" style="background:#B7DEE8;text-align:center;">银行交易编码:<br/>Ref. No. of Bank:</td>
					<td rowspan="2" ></td>
				</tr>
				<tr >
					<td style="text-align:center">
					<input type="checkbox" id="j_payment_payType" >
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center" style="background:#B7DEE8">付款项目<br/>Payment Subject</td>
					<td colspan="2" align="center" style="background:#B7DEE8">结算期 <br/>Payment Term</td>
					<td align="center" style="background:#B7DEE8" width="100px">收货或验收日期<br/>Receiving or Approval date</td>
					<td align="center" style="background:#B7DEE8" width="100px">订单号<br/>PO No.</td>
					<td align="center" style="background:#B7DEE8">币别<br/>Currency</td>
					<td align="center" style="background:#B7DEE8">金额<br/>Amount</td>
					<td rowspan="8" align="center" width="100px">支付用途<br/>Usage<br/>Description</td>
					<td colspan="4" rowspan="8"></td>
				</tr>
				
				
				
				<tr>
					<td align="center"><input type="radio" name="cash" id="j_payment_subject" data-toggle="icheck" value="true" ></td>
					<td>Fixed Asset 固定资产</td>
					<td>days</td>
					<td align="right">Advance<br/>预付款</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>	
				<tr>
					<td align="center"><input type="radio" name="cash" id="j_payment_subject" data-toggle="icheck" value="true" ></td>
					<td>Raw Material 原材料</td>
					<td>days</td>
					<td align="right">Payment at sight<br/>见票即付</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>	
				<tr>
					<td align="center"><input type="radio" name="cash" id="j_payment_subject" data-toggle="icheck" value="true" ></td>
					<td>Consumable 消耗品</td>
					<td>days</td>
					<td align="right">Upon receiving<br/>收货后</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>	
				<tr>
					<td align="center"><input type="radio" name="cash" id="j_payment_subject" data-toggle="icheck" value="true" ></td>
					<td>Subcontractor 外包</td>
					<td>days</td>
					<td align="right">Upon Approval<br/>验收后</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>	
				<tr>
					<td align="center"><input type="radio" name="cash" id="j_payment_subject" data-toggle="icheck" value="true" ></td>
					<td>Service 服务</td>
					<td>days</td>
					<td align="right">Upon invoice<br/>见票后</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>	
				<tr>
					<td align="center"><input type="radio" name="cash" id="j_payment_subject" data-toggle="icheck" value="true" ></td>
					<td>Petty Cash备用金</td>
					<td>days</td>
					<td align="right">Other<br/>其他</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
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
					<td colspan="2" align="right" style="background:#B7DEE8">金额(小写)<br/>Amount in figures:</td>
					<td colspan="6"><label name="amountInFigures" id="j_payment_amountInFigures"></label></td>
					<td align="right" style="background:#B7DEE8">金额(大写)<br/>Amount in words:</td>
					<td colspan="2"><label name="AmountInWords" id="j_payment_AmountInWords"></label></td>
					<td align="right" style="background:#B7DEE8">Document Audit:<br/>单据审核</td>
					<td></td>
				</tr>		
			</table>
			<br>
			<table width="1200px" style="font-size:9px;">
				<tr>
					<td width="25%">General Manager:<br/>总经理</td>
					<td width="25%">Finance Manager:<br/>财务经理</td>
					<td width="25%">Finance Supervisor:<br/>财务主管</td>
					<td width="25%">Dept. Manager:<br/>部门经理</td>				
				</tr>
			</table>
    </div>