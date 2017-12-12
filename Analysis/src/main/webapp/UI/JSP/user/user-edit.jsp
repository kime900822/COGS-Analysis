<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script type="text/javascript">


		BJUI.ajax('doajax', {
		    url: 'getAllRole.action',
		    loadingmask: false,
		    okCallback: function(json, options) {
                $.each(json, function (i, item) {
                    $.CurrentDialog.find('#j_user_edit_type').append("<option value='" + item.rid + "'>" + item.name + "</option>")           
                })
                $.CurrentDialog.find('#j_user_edit_type').selectpicker('val','${param.rid}');
                $.CurrentDialog.find('#j_user_edit_type').selectpicker('refresh');
		    }
		})	
		
		if('${param.sex}'=='F'){
			$.CurrentDialog.find('#j_user_edit_sex_nv').attr("checked","checked");
		}
		


</script> 
    
<div class="bjui-pageContent">
    <div class="bs-example" >
        <form action="modUser.action?callback=?" class="datagrid-edit-form" data-toggle="validate" data-data-type="jsonp">
            <div class="bjui-row col-2">
            	<input type="text" name="id" value="${param.id}" style="display:none;"/>
                <label class="row-label">UserName</label>
                <label class="row-label">JobNumber</label>
                <div class="row-input required">
                    <input type="text" name="age" value="${param.jobnumber}" data-rule="required">
                </div>
                <div class="row-input required">
                    <input type="text" name="name" value="${param.name}" data-rule="required">
                </div>
                <label class="row-label">Sex</label>
                <div class="row-input required">
                    <input type="radio" name="sex" id="j_user_edit_sex_nan" data-toggle="icheck" value="F" data-rule="checked" data-label="Male&nbsp;&nbsp;" checked>
                    <input type="radio" name="sex" id="j_user_edit_sex_nv" data-toggle="icheck" value="M" data-label="Female">
                </div>
                <label class="row-label">Role</label>
                <div class="row-input required">
                    <select name="type" data-toggle="selectpicker" id="j_user_edit_type" data-rule="required" data-width="100%"  >
                         <option value="" selected></option>
                    </select>
                </div>
                <label class="row-label">email</label>
                <div class="row-input required">
                    <input type="text" name="email"  id="j_user_edit_email" data-rule="email" value="${param.email}">
                </div>
                <label class="row-label">Password</label>
                <div class="row-input required">
                    <input type="text" name="password"  id="j_user_edit_password" data-rule="Password:required;length(6~)" value="${param.password}">
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