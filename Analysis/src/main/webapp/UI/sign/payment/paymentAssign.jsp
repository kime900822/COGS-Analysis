<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script type="text/javascript">
		function getUname(){
			var id=$.CurrentDialog.find('#j_assign_edit_uid').val();
			BJUI.ajax('doajax', {
			    url: 'getUserByID.action',
			    loadingmask: true,
			    data:{uid:id},
			    okCallback: function(json, options) {
			    	if(json.length>0){
			    		$.CurrentDialog.find('#j_assign_edit_uname').val(json[0].name); 
			    	}                         
			    	else{
			    		BJUI.alertmsg('error', 'userid不存在'); 
			    	}
			    }
			})
			
		}
		
		


</script> 
    
<div class="bjui-pageContent">
    <div class="bs-example" >
        <form action="assignPayment.action?callback=?" class="datagrid-edit-form" data-toggle="validate" data-data-type="jsonp">
            <div class="bjui-row col-2">
            	<input type="hidden" name="id" id="j_assign_id"value="${param.id}">
                <label class="row-label">UserID</label>
                <div class="row-input required">
                    <input type="text" name="documentAuditID" id="j_assign_edit_uid" value="" data-rule="required" onchange="getUname()">
                </div>
                <label class="row-label">Name</label>
                <div class="row-input required">
                    <input type="text" name="documentAudit" id="j_assign_edit_uname" value="" data-rule="required" readonly="">
                </div>
            </div>
        </form>
    </div>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">Cancle</button></li>
        <li><button type="submit" class="btn-default" data-icon="save">Save</button></li>
    </ul>
</div>