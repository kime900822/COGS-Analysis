package com.kime.action;

import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.google.gson.Gson;
import com.kime.biz.DictBIZ;
import com.kime.model.Dict;

@Controller
@Scope("prototype")
@ParentPackage("Struts 2")
public class DictAction extends ActionBase{

	@Autowired
	private DictBIZ dictBIZ;

	public DictBIZ getDictBIZ() {
		return dictBIZ;
	}

	public void setDictBIZ(DictBIZ dictBIZ) {
		this.dictBIZ = dictBIZ;
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
	
}
