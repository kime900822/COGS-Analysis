package com.sign.action;

import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.kime.action.ActionBase;
import com.kime.infoenum.Message;
import com.sign.biz.BeneficiaryBIZ;
import com.sign.model.Beneficiary;

@Controller
public class BeneficiaryAction extends ActionBase {
	
	@Autowired
	private BeneficiaryBIZ beneficiaryBIZ;
	@Autowired
	private Beneficiary beneficiary;
	
	private String name;
	private String accno;	
	private String addFlag;
	private String supplierCode;
	

	public String getSupplierCode() {
		return supplierCode;
	}
	public void setSupplierCode(String supplierCode) {
		this.supplierCode = supplierCode;
	}
	public BeneficiaryBIZ getBeneficiaryBIZ() {
		return beneficiaryBIZ;
	}
	public void setBeneficiaryBIZ(BeneficiaryBIZ beneficiaryBIZ) {
		this.beneficiaryBIZ = beneficiaryBIZ;
	}
	public Beneficiary getBeneficiary() {
		return beneficiary;
	}
	public void setBeneficiary(Beneficiary beneficiary) {
		this.beneficiary = beneficiary;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getAccno() {
		return accno;
	}
	public void setAccno(String accno) {
		this.accno = accno;
	}
	public String getAddFlag() {
		return addFlag;
	}
	public void setAddFlag(String addFlag) {
		this.addFlag = addFlag;
	}
	
	
	
	
	@Action(value="queryBeneficiary",results={@org.apache.struts2.convention.annotation.Result(type="stream",
			params={
					"inputName", "reslutJson"
			})})
	public String queryBeneficiary() throws UnsupportedEncodingException{	
		String where="";
		if (!"".equals(accno)&&accno!=null) {
			where+=" where accno like '%"+accno+"%' ";
		}
		
		if (!"".equals(name)&&name!=null) {
			if (where.equals("")) {
				where+=" AND name like '%"+name+"%' ";
			}else{
				where+=" where name like '%"+name+"%' ";
			}
			
		}
		List list  =beneficiaryBIZ.queryBeneficiary(where, Integer.parseInt(pageSize),Integer.parseInt(pageCurrent));
		int total=beneficiaryBIZ.queryBeneficiary(where).size();
		
		queryResult.setList(list);
		queryResult.setTotalRow(total);
		queryResult.setFirstPage(Integer.parseInt(pageCurrent)==1?true:false);
		queryResult.setPageNumber(Integer.parseInt(pageCurrent));
		queryResult.setLastPage(total/Integer.parseInt(pageSize) +1==Integer.parseInt(pageCurrent)&&Integer.parseInt(pageCurrent)!=1?true:false);
		queryResult.setTotalPage(total/Integer.parseInt(pageSize) +1);
		queryResult.setPageSize(Integer.parseInt(pageSize));
		String r=callback+"("+new Gson().toJson(queryResult)+")";
		
		reslutJson=new ByteArrayInputStream(r.getBytes("UTF-8"));  
		
		logUtil.logInfo("查询收款人信息，条件:"+where);
		return SUCCESS;
	}
	
	
	
	@Action(value="deleteBeneficiary",results={@org.apache.struts2.convention.annotation.Result(type="stream",
			params={
					"inputName", "reslutJson"
			})})
	public String deleteBeneficiary() throws UnsupportedEncodingException{
		List<Beneficiary> list=new Gson().fromJson(json, new TypeToken<ArrayList<Beneficiary>>() {}.getType());
		try {
			for (Beneficiary object : list) {
				beneficiaryBIZ.deleteBeneficiary(object);;	
				logUtil.logInfo("删除收款人:"+object.getAccno());
			}
			result.setMessage(Message.DEL_MESSAGE_SUCCESS);
			result.setStatusCode("200");
		} catch (Exception e) {
			logUtil.logInfo("删除收款人:"+e.getMessage());
			result.setMessage(e.getMessage());
			result.setStatusCode("300");
		}

		reslutJson=new ByteArrayInputStream(new Gson().toJson(result).getBytes("UTF-8"));  
		return SUCCESS;
	}
	
	
	@Action(value="saveBeneficiary",results={@org.apache.struts2.convention.annotation.Result(type="stream",
			params={
					"inputName", "reslutJson"
			})})
	public String saveBeneficiary() throws UnsupportedEncodingException{
		
		List<Beneficiary> list=new Gson().fromJson(json, new TypeToken<ArrayList<Beneficiary>>() {}.getType());
		Beneficiary object=list.get(0);

		try {
			if (object.getAddFlag()!=null) {
				beneficiaryBIZ.saveBeneficiary(object);
				logUtil.logInfo("新增收款人信息:"+object.getAccno());
			}else{
				beneficiaryBIZ.updateBeneficiary(object);
				logUtil.logInfo("修改收款人信息:"+object.getAccno());
			}
			
			result.setMessage(Message.SAVE_MESSAGE_SUCCESS);
			result.setStatusCode("200");
		} catch (Exception e) {
			logUtil.logInfo("修改收款人信息:"+e.getMessage());
			result.setMessage(e.getMessage());
			result.setStatusCode("300");	
		}

		reslutJson=new ByteArrayInputStream(new Gson().toJson(result).getBytes("UTF-8"));  
		return SUCCESS;
		
	}
	
	
	@Action(value="getAllBeneficiary",results={@org.apache.struts2.convention.annotation.Result(type="stream",
			params={
					"inputName", "reslutJson"
			})})
	public String getAllBeneficiary() throws UnsupportedEncodingException{
		
		List<Beneficiary> list=beneficiaryBIZ.queryBeneficiary("");
		reslutJson=new ByteArrayInputStream(new Gson().toJson(list).getBytes("UTF-8"));
		
		return SUCCESS;
	}
	
	@Action(value="getBeneficiaryByCode",results={@org.apache.struts2.convention.annotation.Result(type="stream",
			params={
					"inputName", "reslutJson"
			})})
	public String getBeneficiaryByCode() throws UnsupportedEncodingException{
		
		List<Beneficiary> list=beneficiaryBIZ.queryBeneficiary(" where supplierCode='"+supplierCode+"'");
		if (list.size()>0) {
			reslutJson=new ByteArrayInputStream(new Gson().toJson(list.get(0)).getBytes("UTF-8"));
		}else{
			Map<String, String> map=new HashMap<>();
			map.put("statue", "300");
			result.setMessage(" Code is not maintain!");
			reslutJson=new ByteArrayInputStream(new Gson().toJson(map).getBytes("UTF-8"));
		}
		
		
		return SUCCESS;
	}
}
