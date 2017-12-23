package com.kime.action;

import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.kime.biz.DictBIZ;
import com.kime.infoenum.Message;
import com.kime.model.Dict;
import com.kime.model.Editor;
import com.sign.model.Beneficiary;

@Controller
@Scope("prototype")
@ParentPackage("Struts 2")
public class DictAction extends ActionBase{

	@Autowired
	private DictBIZ dictBIZ;
	private String type;
	private String key;
	private String value;
	
	
	public DictBIZ getDictBIZ() {
		return dictBIZ;
	}

	public void setDictBIZ(DictBIZ dictBIZ) {
		this.dictBIZ = dictBIZ;
	}
	
	
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	@Action(value="getALLSign",results={@org.apache.struts2.convention.annotation.Result(type="stream",
			params={
					"inputName", "reslutJson"
			})})
	public String GetALLSign() throws UnsupportedEncodingException{
	
		List<Dict> list=dictBIZ.getALLSign();
		
		reslutJson=new ByteArrayInputStream(new Gson().toJson(list).getBytes("UTF-8"));  
		return SUCCESS;
	}
	
	
	@Action(value="getALLType",results={@org.apache.struts2.convention.annotation.Result(type="stream",
			params={
					"inputName", "reslutJson"
			})})
	public String getALLType() throws UnsupportedEncodingException{
	
		List list=dictBIZ.getAllType();
		
		reslutJson=new ByteArrayInputStream(new Gson().toJson(list).getBytes("UTF-8"));  
		return SUCCESS;
	}
	
	@Action(value="getDict",results={@org.apache.struts2.convention.annotation.Result(type="stream",
			params={
					"inputName", "reslutJson"
			})})
	public String getDict() throws UnsupportedEncodingException{
	
		String where="";
		if (!"".equals(type)&&type!=null) {
			where+=" where type='"+type+"' ";
		}
		
		if (!"".equals(key)&&key!=null) {
			if (where.equals("")) {
				where+=" AND key='"+key+"' ";
			}else{
				where+=" where key='"+key+"' ";
			}
			
		}
		
		if (!"".equals(value)&&value!=null) {
			if (where.equals("")) {
				where+=" AND value='"+value+"' ";
			}else{
				where+=" where value='"+value+"' ";
			}
			
		}
		
		List list=dictBIZ.getDict(where, Integer.parseInt(pageSize),Integer.parseInt(pageCurrent));
		int total=dictBIZ.getDict(where).size();
		
		
		queryResult.setList(list);
		queryResult.setTotalRow(total);
		queryResult.setFirstPage(Integer.parseInt(pageCurrent)==1?true:false);
		queryResult.setPageNumber(Integer.parseInt(pageCurrent));
		queryResult.setLastPage(total/Integer.parseInt(pageSize) +1==Integer.parseInt(pageCurrent)&&Integer.parseInt(pageCurrent)!=1?true:false);
		queryResult.setTotalPage(total/Integer.parseInt(pageSize) +1);
		queryResult.setPageSize(Integer.parseInt(pageSize));
		String r=callback+"("+new Gson().toJson(queryResult)+")";
		
		reslutJson=new ByteArrayInputStream(r.getBytes("UTF-8"));  
		
		logUtil.logInfo("查询字典信息，条件:"+where);
		return SUCCESS;
		
	}
	
	
	@Action(value="deleteDict",results={@org.apache.struts2.convention.annotation.Result(type="stream",
			params={
					"inputName", "reslutJson"
			})})
	public String deleteDict() throws UnsupportedEncodingException{
		List<Dict> list=new Gson().fromJson(json, new TypeToken<ArrayList<Dict>>() {}.getType());
		try {
			for (Dict dict : list) {
				dictBIZ.delete(dict);
				logUtil.logInfo("删除字典:"+dict.getType()+" "+dict.getKey());
			}
			result.setMessage(Message.DEL_MESSAGE_SUCCESS);
			result.setStatusCode("200");
		} catch (Exception e) {
			logUtil.logInfo("删除字典:"+e.getMessage());
			result.setMessage(e.getMessage());
			result.setStatusCode("300");
		}

		reslutJson=new ByteArrayInputStream(new Gson().toJson(result).getBytes("UTF-8"));  
		return SUCCESS;
	}
	
	
	@Action(value="modeDict",results={@org.apache.struts2.convention.annotation.Result(type="stream",
			params={
					"inputName", "reslutJson"
			})})
	public String modeDict() throws UnsupportedEncodingException{
		
		List<Dict> list=new Gson().fromJson(json, new TypeToken<ArrayList<Dict>>() {}.getType());
		Dict object=list.get(0);

		try {
			if (object.getAddFlag().equals("true")) {
				dictBIZ.save(object);
				logUtil.logInfo("新增字典:"+object.getType()+" "+object.getKey());
			}else{
				dictBIZ.update(object);
				logUtil.logInfo("修改字典:"+object.getType()+" "+object.getKey());
			}
			
			result.setMessage(Message.SAVE_MESSAGE_SUCCESS);
			result.setStatusCode("200");
		} catch (Exception e) {
			logUtil.logInfo("修改字典:"+e.getMessage());
			result.setMessage(e.getMessage());
			result.setStatusCode("300");	
		}

		reslutJson=new ByteArrayInputStream(new Gson().toJson(result).getBytes("UTF-8"));  
		return SUCCESS;
		
	}
	
	
}
