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
<link href="../../B-JUI/plugins/nice-validator-1.0.7/jquery.htmlidator.css" rel="stylesheet">
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
<script src="../../B-JUI/plugins/nice-validator-1.0.7/jquery.htmlidator.js"></script>
<script src="../../B-JUI/plugins/nice-validator-1.0.7/jquery.htmlidator.themes.js"></script>
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
	dataToFace();
	$("input").attr('disabled','disabled');
	$("select").attr('disabled','disabled');
})

function dataToFace(){
	
	BJUI.ajax('doajax', {
	    url: 'getPaymentByID.action',
	    loadingmask: true,
	    data:{id:'${param.id}'},	    
	    okCallback: function(json, options) {
            if(json.status='200'){
            	$("#applicationDate").html(json.applicationDate);
            	$("#requestPaymentDate").html(json.requestPaymentDate);
            	$("#contacturalPaymentDate").html(json.contacturalPaymentDate);
            	$("#code").html(json.code);
            	if(json.payType=='Cash'){
            		$("#cash").attr('checked',true);
            	}else if(json.payType=='Banking'){
            		$("#banking").attr('checked',true);
            	}else if(json.payType=='AdvanceWriteoff'){
            		$("#AdvanceWriteoff").attr('checked',true);
            	}
            	if(json.urgent=='1'){
            		$("#urgent").html("●");
            	}
            	$("#UID").html(json.UID+'<br>'+json.UName);
            	$("#departmentID").html(json.departmentName+'<br>'+json.departmentID);
            	$("#beneficiary").html(json.beneficiary)
            	$("#beneficiaryAccountNO").html(json.beneficiaryAccountNO)
                if(json.beneficiaryChange=='1'){
            		$("#beneficiaryChange").html("●"); 
            		$("#beneficiary_td").attr("style","background-color: #9ACD32");
            	}
                if(json.beneficiaryAccountNOChange=='1'){
            		$("#beneficiaryAccountNOChange").html("●") 
            		$("#beneficiaryAccountNO_td").attr("style","background-color: #EEC900");
            	}
                $("#paymentSubject_"+json.paymentSubject).html("Y")  
                if(json.paymentDays_1!=""&&json.paymentDays_1!=null){
                	$("#paymentDays_1").html(json.paymentDays_1+"days");
                }
                if(json.paymentDays_2!=""&&json.paymentDays_2!=null){
                	$("#paymentDays_2").html(json.paymentDays_2+"days");
                }
                if(json.paymentDays_3!=""&&json.paymentDays_3!=null){
                	$("#paymentDays_3").html(json.paymentDays_3+"days");
                }
                if(json.paymentDays_4!=""&&json.paymentDays_4!=null){
                	$("#paymentDays_4").html(json.paymentDays_4+"days");
                }
                if(json.paymentDays_5!=""&&json.paymentDays_5!=null){
                	$("#paymentDays_5").html(json.paymentDays_5+"days");
                }
                if(json.paymentDays_6!=""&&json.paymentDays_6!=null){
                	$("#paymentDays_6").html(json.paymentDays_6+"days");
                }

               
            	$("#receivingOrApprovalDate_1").html(json.receivingOrApprovalDate_1);
            	$("#PONo_1").html(json.PONo_1);
            	$("#currency_1").html(json.currency_1);
            	if(json.amount_1!=''&&json.amount_1!=null){
            		$("#amount_1").html(json.amount_1);
            	}
    
            	$("#receivingOrApprovalDate_2").html(json.receivingOrApprovalDate_2);
            	$("#PONo_2").html(json.PONo_2);
            	$("#currency_2").html(json.currency_2);
            	if(json.amount_2!=''&&json.amount_2!=null){
            		$("#amount_2").html(json.amount_2);
            	}           		

            	$("#receivingOrApprovalDate_3").html(json.receivingOrApprovalDate_3);
            	$("#PONo_3").html(json.PONo_3);
            	$("#currency_3").html(json.currency_3);
            	if(json.amount_3!=''&&json.amount_3!=null){
            		$("#amount_3").html(json.amount_3);
            	}
            		
            	$("#receivingOrApprovalDate_4").html(json.receivingOrApprovalDate_4);
            	$("#PONo_4").html(json.PONo_4);
            	$("#currency_4").html(json.currency_4);
            	if(json.amount_4!=''&& json.amount_4==null){
            		$("#amount_4").html(json.amount_4);
            	}
            		
            	$("#receivingOrApprovalDate_5").html(json.receivingOrApprovalDate_5);
            	$("#PONo_5").html(json.PONo_5);
            	$("#currency_5").html(json.currency_5);
            	if(json.amount_5!=''&& json.amount_5!=null){
            		$("#amount_5").html(json.amount_5);
            	}
            		
            	$("#receivingOrApprovalDate_6").html(json.receivingOrApprovalDate_6);
            	$("#PONo_6").html(json.PONo_6);
            	$("#currency_6").html(json.currency_6);
            	if(json.amount_6!=''&& json.amount_6!=null){
            		$("#amount_6").html(json.amount_6);
            	}
            		
            	$("#supplierCode").html(json.supplierCode);
            	$("#refNoofBank").html(json.refNoofBank);
            	$("#usageDescription").html(json.usageDescription);
            	if(json.amountInFigures!=''&&json.amountInFigures!=null){
            		$("#amountInFigures").html("&nbsp&nbsp"+formatCurrency(json.amountInFigures));
            		$("#amountInWords").html("&nbsp&nbsp"+smalltoBIG(json.amountInFigures));
            	}
            	
            	$("#documentAudit").html("&nbsp&nbsp"+json.documentAudit);
            	$("#deptManager").html("&nbsp&nbsp"+json.deptManager);

            }else{
            	 BJUI.alertmsg('error', json.message); 
            }
	    }
	});	

	
}

</script>

    <div  style="width:1200px;padding:20px" >
			<table  style="font-size:9px;">
				<tr>
					<td  width="200px"></td>
					<td  width="950px"></td>
					<td  width="50px"></td>
				</tr>
				<tr height="9px">
					<td colspan="2" align="right" >
						<p>流水码:</p>
					</td>
					<td align="center"><label id="code"></label></td>
				</tr>
				<tr>
					<td width="200px" align="left"><img  style="width:300px;height:50px;" alt="payment" src="../../images/printLogo.png"></td>
					<td colspan="2"  align="center"><h4 align="center" style="font-weight:bold">Cimtas(NingBo) Steel Processing CO.,LTD 庆达西（宁波）钢构制造有限公司</h4>
					<h5 align="center" style="font-weight:bold">Paymengt Application Form 付款申请单</h5>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right" style="">
						<p style="font-size:9px">Urgent:</p>
					</td>
					<td align="center" width="40px"><label id="urgent"></label></td>
				</tr>
			</table>		
			<table style="font-size:9px;">
				<tr>
					<td width="300px" >Application Date(申请日期):<label id="applicationDate"></label></td>
					<td width="400px" >Request Payment Date(要求付款日期):<label id="requestPaymentDate"></label></td>
					<td width="400px" >Contactural Payment Date(合同付款日期):<label id="contacturalPaymentDate"></label></td>
					<td width="100px"></td>
				</tr>
				<tr>
					<td colspan="4">
						<input type="checkbox" id="cash" >支付现金 Cash &nbsp&nbsp&nbsp&nbsp
						<input type="checkbox" id="Banking" >银行支付 Banking &nbsp&nbsp&nbsp&nbsp
						<input type="checkbox" id="AdvanceWriteoff">核销预付 Advance Write-off (Amount) . &nbsp&nbsp&nbsp&nbsp
					</td>
				</tr>
			</table>            

			<table width="1200px" border="2" cellspacing="1" bordercolor="black" style="font-size:9px;">
				<tr>
					<th width="30px"></th>
					<th width="140px"></th>
					<th width="50px"></th>
					<th width="120px"></th>
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
					<td colspan="2" rowspan="2" style="text-align:center;border-bottom:0px" ><label id="UID"></label></td>
					<td colspan="4" rowspan="2" style="background:#B7DEE8">收款人（全称）:<br>Beneficiary:</td>
					<td colspan="2" rowspan="2"  id="beneficiary_td">
						<label id="beneficiary"></label>
                    </td>
					<td align="center" style="background:#B7DEE8;text-align:center;">change<br/>变更</td>
					<td rowspan="2" style="background:#B7DEE8;text-align:center;">供应商代码:<br/>Supplier Code:</td>
					<td rowspan="2" style="text-align:center"><label id="supplierCode"></label> </td>
				</tr>
				<tr >
					<td style="text-align:center">
						<label id="beneficiaryChange" ></label>
					</td>
				</tr>
				<tr>
					<td colspan="2" rowspan="2" style="background:#B7DEE8">所属部门:<br>Department of Applicant:</td>
					<td colspan="2" rowspan="2" style="text-align:center"><label id="departmentID"></label></td>
					<td colspan="4" rowspan="2" style="background:#B7DEE8">银行及帐号:<br>Beneficiary Account NO:</td>
					<td colspan="2" rowspan="2" id="beneficiaryAccountNO_td">
						<label id="beneficiaryAccountNO"></label>
					</td>
					<td align="center" style="background:#B7DEE8;text-align:center;">change<br/>变更</td>
					<td rowspan="2" style="background:#B7DEE8;text-align:center;">银行交易编码:<br/>Ref. No. of Bank:</td>
					<td rowspan="2" ><label id="refNoofBank"></label></td>
				</tr>
				<tr >
					<td style="text-align:center">
						<label id="beneficiaryAccountNOChange" ></label>
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
					<td colspan="4" rowspan="8"><label id="usageDescription"></label></td>
				</tr>
				
				
				
				<tr  align="center">
					<td align="center"><label id="paymentSubject_1"></label></td>
					<td>Fixed Asset 固定资产</td>
					<td><label id="paymentDays_1"></label></td>
					<td align="right">Advance<br/>预付款</td>
					<td><label id="receivingOrApprovalDate_1"></label></td>
					<td><label id="PONo_1"></label></td>
					<td><label id="currency_1"></label></td>
					<td><label id="amount_1"></label></td>
				</tr>	
				<tr align="center">
					<td align="center"><label id="paymentSubject_2"></label></td>
					<td>Raw Material 原材料</td>
					<td><label id="paymentDays_2"></label></td>
					<td align="right">Payment at sight<br/>见票即付</td>
					<td><label id="receivingOrApprovalDate_2"></label></td>
					<td><label id="PONo_2"></label></td>
					<td><label id="currency_2"></label></td>
					<td><label id="amount_2"></label></td>
				</tr>	
				<tr align="center">
					<td align="center"><label id="paymentSubject_3"></label></td>
					<td>Consumable 消耗品</td>
					<td><label id="paymentDays_3"></label></td>
					<td align="right">Upon receiving<br/>收货后</td>
					<td><label id="receivingOrApprovalDate_3"></label></td>
					<td><label id="PONo_3"></label></td>
					<td><label id="currency_3"></label></td>
					<td><label id="amount_3"></label></td>
				</tr>	
				<tr align="center">
					<td align="center"><label id="paymentSubject_4"></label></td>
					<td>Subcontractor 外包</td>
					<td><label id="paymentDays_4"></label></td>
					<td align="right">Upon Approval<br/>验收后</td>
					<td><label id="receivingOrApprovalDate_4"></label></td>
					<td><label id="PONo_4"></label></td>
					<td><label id="currency_4"></label></td>
					<td><label id="amount_4"></label></td>
				</tr>	
				<tr align="center">
					<td align="center"><label id="paymentSubject_5"></label></td>
					<td>Service 服务</td>
					<td><label id="paymentDays_5"></label></td>
					<td align="right">Upon invoice<br/>见票后</td>
					<td><label id="receivingOrApprovalDate_5"></label></td>
					<td><label id="PONo_5"></label></td>
					<td><label id="currency_5"></label></td>
					<td><label id="amount_5"></label></td>
				</tr>	
				<tr align="center">
					<td align="center"><label id="paymentSubject_6"></label></td>
					<td>Petty Cash 备用金</td>
					<td><label id="paymentDays_6"></label></td>
					<td align="right">Other<br/>其他</td>
					<td><label id="receivingOrApprovalDate_6"></label></td>
					<td><label id="PONo_6"></label></td>
					<td><label id="currency_6"></label></td>
					<td><label id="amount_6"></label></td>
				</tr>	
				<tr align="center">
					<td align="center"><label id="paymentSubject_7"></label></td>
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
					<td colspan="6"><label id="amountInFigures"></label></td>
					<td align="right" style="background:#B7DEE8">金额(大写)<br/>Amount in words:</td>
					<td colspan="2"><label id="amountInWords"></label></td>
					<td align="right" style="background:#B7DEE8">Document Audit:<br/>单据审核</td>
					<td><label id="documentAudit"></label></td>
				</tr>		
			</table>
			<br>
			<table width="1200px" style="font-size:9px">
				<tr>
					<td width="25%">General Manager:<br/>总经理</td>
					<td width="25%">Finance Manager:<br/>财务经理</td>
					<td width="25%">Finance Supervisor:<br/>财务主管</td>
					<td width="12.5%">Dept. Manager:<br/>部门经理</td>		
					<td width="12.5%"><label id="deptManager"></label></td>		
				</tr>
			</table>
    </div>