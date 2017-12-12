package com.kime.action;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.jws.soap.SOAPBinding.Use;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.kime.biz.RoleBIZ;
import com.kime.biz.UserBIZ;
import com.kime.infoenum.Message;
import com.kime.model.QueryResult;
import com.kime.model.Result;
import com.kime.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope("prototype")
@ParentPackage("Struts 2")
public class UserAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private UserBIZ userBIZ;
	@Autowired
	private User user;
	@Autowired
	private Result result;
	@Autowired
	private QueryResult queryResult ;
	@Autowired
	private RoleBIZ roleBIZ;
	
	private InputStream reslutJson;
	private String json;
	
	public String getJson() {
		return json;
	}


	public void setJson(String json) {
		this.json = json;
	}


	private String name;
	private String password;
	private String jobnumber;
	private String sex;
	private String oldpassword;
	private String rid;
	private String id;
	private String date;
	private String email;
	
	private String pageSize;
	private String pageCurrent;
	private String callback;
	private String fileName;
	private File upfile;
	private String first;
	

	
	public RoleBIZ getRoleBIZ() {
		return roleBIZ;
	}


	public void setRoleBIZ(RoleBIZ roleBIZ) {
		this.roleBIZ = roleBIZ;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public File getUpfile() {
		return upfile;
	}


	public void setUpfile(File upfile) {
		this.upfile = upfile;
	}


	public String getFirst() {
		return first;
	}


	public void setFirst(String first) {
		this.first = first;
	}


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getCallback() {
		return callback;
	}


	public void setCallback(String callback) {
		this.callback = callback;
	}


	public String getPageSize() {
		return pageSize;
	}


	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}


	public String getPageCurrent() {
		return pageCurrent;
	}


	public void setPageCurrent(String pageCurrent) {
		this.pageCurrent = pageCurrent;
	}


	public QueryResult getQueryResult() {
		return queryResult;
	}


	public void setQueryResult(QueryResult queryResult) {
		this.queryResult = queryResult;
	}


	public String getRid() {
		return rid;
	}


	public void setRid(String rid) {
		this.rid = rid;
	}


	public UserBIZ getUserBIZ() {
		return userBIZ;
	}


	public void setUserBIZ(UserBIZ userBIZ) {
		this.userBIZ = userBIZ;
	}
	



	public Result getResult() {
		return result;
	}


	public void setResult(Result result) {
		this.result = result;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}

	
	

	public InputStream getReslutJson() {
		return reslutJson;
	}


	public void setReslutJson(InputStream reslutJson) {
		this.reslutJson = reslutJson;
	}


	public String getJobnumber() {
		return jobnumber;
	}


	public void setJobnumber(String jobnumber) {
		this.jobnumber = jobnumber;
	}


	public String getSex() {
		return sex;
	}


	public void setSex(String sex) {
		this.sex = sex;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	
	
	public String getOldpassword() {
		return oldpassword;
	}


	public void setOldpassword(String oldpassword) {
		this.oldpassword = oldpassword;
	}


	public QueryResult getqResult() {
		return queryResult;
	}


	public void setqResult(QueryResult queryResult) {
		this.queryResult = queryResult;
	}


	/**
	 * 用户登录
	 * @return
	 */
	@Action(value="login",
			results={@org.apache.struts2.convention.annotation.Result(name="success",location="/UI/index.jsp"),
			@org.apache.struts2.convention.annotation.Result(name="error",location="/UI/login.jsp")})
	public String Login(){
	
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		session.setMaxInactiveInterval(30*60);

		session.removeAttribute("login_message");
		
		String err_message = null;
		try {
			if ("".equals(jobnumber)&&"".equals(password)) {
				err_message="Please enter your Jobnumber and password";
			}else{
				user=userBIZ.login(jobnumber, password);
				if (user==null) {
					err_message="User jobnumber or password error";
				}
				
			}
			
		} catch (Exception e1) {
			err_message=e1.getMessage();	
			e1.printStackTrace();
		}
		
		if (err_message==null) {
			session.setAttribute("user", user);
			return SUCCESS;
			
		}else{
			session.setAttribute("login_message", err_message.toString());
			return ERROR;
			
		}
		
		
	}
	
	
	/**
	 * 注册账号
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@Action(value="register",results={@org.apache.struts2.convention.annotation.Result(type="stream",
			params={
					"inputName", "reslutJson"
			})})
	public String Register() throws UnsupportedEncodingException{
		
		Date d1=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:dd");
		user.setJobnumber(jobnumber);
		user.setName(name);
		user.setPassword(password);
		user.setSex(sex);
		user.setRid(Message.NORMAL_USER);
		user.setDate(sdf.format(d1));
		user.setEmail(email);
		
		try {
			userBIZ.register(user);
			result.setMessage(Message.REGISTER_MESSAGE_SUCCESS);
			result.setStatusCode("200");
		} catch (Exception e1) {
			result.setMessage(e1.getMessage());
			result.setStatusCode("300");
			e1.printStackTrace();
		}
		reslutJson=new ByteArrayInputStream(new Gson().toJson(result).getBytes("UTF-8"));  
		return SUCCESS;
	}
	
	/**
	 * 修改密码
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@Action(value="change",results={@org.apache.struts2.convention.annotation.Result(type="stream",
			params={
					"inputName", "reslutJson"
			})})
	public String Change() throws UnsupportedEncodingException{
		ActionContext actionContext = ActionContext.getContext();  
        Map session = actionContext.getSession();  
        user=(User)session.get("user");
		if (oldpassword.equals(user.getPassword())) {	
			if (!password.equals(user.getPassword())) {
				user.setPassword(password);
				try {
					userBIZ.modUser(user);
					result.setMessage(Message.MOD_MESSAGE_SUCCESS);
					result.setStatusCode("200");
				} catch (Exception e1) {
					result.setMessage(e1.getMessage());
					result.setStatusCode("300");
					e1.printStackTrace();
				}
			}else{
				result.setMessage(Message.MOD_MESSAGE_ERROR_REGISTER_1);
				result.setStatusCode("300");
			}
	
		}
		else{
			result.setMessage(Message.MOD_MESSAGE_ERROR_REGISTER_2);
			result.setStatusCode("300");
		}
		reslutJson=new ByteArrayInputStream(new Gson().toJson(result).getBytes("UTF-8"));  
		return SUCCESS;
	}
	
	/**
	 * 注销登录
	 * @return
	 */
	@Action(value="logout",results={@org.apache.struts2.convention.annotation.Result(name="success",location="/UI/login.jsp")})
	public String Logout(){
		
		ActionContext actionContext = ActionContext.getContext();  
        Map session = actionContext.getSession();  
        session.clear();
        return SUCCESS;
		
	}
	
	/**
	 * 用户查询
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@Action(value="getUser",results={@org.apache.struts2.convention.annotation.Result(type="stream",
			params={
					"inputName", "reslutJson"
			})})
	public String GetUser() throws UnsupportedEncodingException{
		
		String where="";
		if (!"".equals(rid)&&rid!=null) {
			where += " rid='"+rid+"'";
		}
		if (!"".equals(name)&&name!=null) {
			if (!"".equals(where)) {
				where +=" and ";
			}
			where += " name like '%"+name+"%'";
		}
		if (!"".equals(id)&&id!=null) {
			if (!"".equals(where)) {
				where +=" and ";
			}
			where += " id like '%"+id+"%'";
		}
		
		if (!"".equals(sex)&&sex!=null) {
			if (!"".equals(where)) {
				where +=" and ";
			}
			where += " sex = '"+sex+"'";
		}
		
		if (!"".equals(date)&&date!=null) {
			if (!"".equals(where)) {
				where +=" and ";
			}
			where += " date = '"+date+"'";
		}
		
		
		if (!"".equals(jobnumber)&&jobnumber!=null) {
			if (!"".equals(where)) {
				where +=" and ";
			}
			where += " jobnumber = '"+jobnumber+"'";
		}
		
		if (!"".equals(email)&&email!=null) {
			if (!"".equals(where)) {
				where +=" and ";
			}
			where += " email like '%"+email+"%'";
		}
		
		if (!"".equals(where)) {
			where =" where "+where;
		}
				
		
		List<User> luser=userBIZ.getUser(where,Integer.parseInt(pageSize),Integer.parseInt(pageCurrent));
		int total=userBIZ.getUser(where).size();
		
		queryResult.setList(luser);
		queryResult.setTotalRow(total);
		queryResult.setFirstPage(Integer.parseInt(pageCurrent)==1?true:false);
		queryResult.setPageNumber(Integer.parseInt(pageCurrent));
		queryResult.setLastPage(total/Integer.parseInt(pageSize) +1==Integer.parseInt(pageCurrent)&&Integer.parseInt(pageCurrent)!=1?true:false);
		queryResult.setTotalPage(total/Integer.parseInt(pageSize) +1);
		queryResult.setPageSize(Integer.parseInt(pageSize));
		String r=callback+"("+new Gson().toJson(queryResult)+")";
		
		reslutJson=new ByteArrayInputStream(r.getBytes("UTF-8"));  
		
		
		return SUCCESS;
	}
	
	/**
	 * 用户编辑（删除，保存）
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@Action(value="modUser",results={@org.apache.struts2.convention.annotation.Result(type="stream",
			params={
					"inputName", "reslutJson"
			})})
	public String ModUser() throws UnsupportedEncodingException{
		
		Date d1=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:dd");
		user.setJobnumber(jobnumber);
		user.setName(name);
		user.setPassword(password);
		user.setSex(sex);
		user.setRid(rid);;
		user.setDate(sdf.format(d1));
		user.setId(id);
		user.setId(email);
		
		try {
			if (id==null||"".equals(id)) {
				userBIZ.register(user);	
			}else{
				userBIZ.modUser(user);
			}			
			user=userBIZ.getUser(" where name='"+name+"'").get(0);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		String r=callback+"("+new Gson().toJson(user)+")";
		reslutJson=new ByteArrayInputStream(r.getBytes("UTF-8"));  
		return SUCCESS;
		
		
	}
	
	/**
	 * 用户删除
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@Action(value="deleteUser",results={@org.apache.struts2.convention.annotation.Result(type="stream",
			params={
					"inputName", "reslutJson"
			})})
	public String DeleteUser() throws UnsupportedEncodingException{
		List<User> luser=new Gson().fromJson(json, new TypeToken<ArrayList<User>>() {}.getType());
		try {
			for (User u : luser) {
				userBIZ.deleteUser(u);			
			}
			result.setMessage(Message.DEL_MESSAGE_SUCCESS);
			result.setStatusCode("200");
		} catch (Exception e) {
			result.setMessage(e.getMessage());
			result.setStatusCode("300");
		}

		reslutJson=new ByteArrayInputStream(new Gson().toJson(result).getBytes("UTF-8"));  
		return SUCCESS;
	}
	
   
    
    /**
     * excel导出
     * @return
     */
	@Action(value="exportUserExcel",results={@org.apache.struts2.convention.annotation.Result(type="stream",
			params={
					"inputName", "reslutJson",
					"contentType","application/vnd.ms-excel",
					"contentDisposition","attachment;filename=%{fileName}",
					"bufferSize","1024"
			})})
    public String ExportUserExcel() {
        try {
            //第一步，创建一个webbook，对应一个Excel文件
            HSSFWorkbook wb = new HSSFWorkbook();
            //第二步，在webbook中添加一个sheet，对应Excel文件中的 sheet
            HSSFSheet sheet = wb.createSheet("UserInformation");
            //第三步，在sheet中添加表头第0行，注意老版本poi对Excel的行数列数有限制
            HSSFRow row = sheet.createRow(0);
            //第四步，创建单元格样式：居中
            HSSFCellStyle style = wb.createCellStyle();
            style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
            style.setFillForegroundColor(HSSFColor.GREY_40_PERCENT.index);
            style.setFillBackgroundColor(HSSFColor.GREY_40_PERCENT.index);
            style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
            
            //第五步，创建表头单元格，并设置样式
            HSSFCell cell;

            cell = row.createCell(0);
            cell.setCellValue("JobNumber");
            cell.setCellStyle(style);

            cell = row.createCell(1);
            cell.setCellValue("Name");
            cell.setCellStyle(style);

            cell = row.createCell(2);
            cell.setCellValue("Password");
            cell.setCellStyle(style);

            cell = row.createCell(3);
            cell.setCellValue("Sex");
            cell.setCellStyle(style);

            cell = row.createCell(4);
            cell.setCellValue("Email");
            cell.setCellStyle(style);

            cell = row.createCell(5);
            cell.setCellValue("Role");
            cell.setCellStyle(style);
            
            cell = row.createCell(6);
            cell.setCellValue("Date");
            cell.setCellStyle(style);
            
            sheet.setColumnWidth(0, 3000);
            sheet.setColumnWidth(1, 9000);
            sheet.setColumnWidth(2, 3000);
            sheet.setColumnWidth(3, 3000);
            sheet.setColumnWidth(4, 6000);
            sheet.setColumnWidth(5, 3000);
            sheet.setColumnWidth(6, 6000);
            
            //第六步，写入实体数据，实际应用中这些数据从数据库得到
            
    		String where="";
    		if (!"".equals(rid)&&rid!=null) {
    			where += " type='"+rid+"'";
    		}
    		if (!"".equals(name)&&name!=null) {
    			if (!"".equals(where)) {
    				where +=" and ";
    			}
    			where += " name like '%"+name+"%'";
    		}
    		if (!"".equals(id)&&id!=null) {
    			if (!"".equals(where)) {
    				where +=" and ";
    			}
    			where += " id like '%"+id+"%'";
    		}
    		
    		if (!"".equals(sex)&&sex!=null) {
    			if (!"".equals(where)) {
    				where +=" and ";
    			}
    			where += " sex = '"+sex+"'";
    		}
    		
    		if (!"".equals(date)&&date!=null) {
    			if (!"".equals(where)) {
    				where +=" and ";
    			}
    			where += " date = '"+date+"'";
    		}
    		
    		
    		if (!"".equals(jobnumber)&&jobnumber!=null) {
    			if (!"".equals(where)) {
    				where +=" and ";
    			}
    			where += " jobnumber = '"+jobnumber+"'";
    		}
    		
    		if (!"".equals(where)) {
    			where =" where "+where;
    		}
            List<User> lUsers=userBIZ.getUser(where);
            
            int i=0;
            for (User user : lUsers) {
            	i++;
                row = sheet.createRow(i);
                row.createCell(0).setCellValue(user.getJobnumber());
                row.createCell(1).setCellValue(user.getName());
                row.createCell(2).setCellValue(user.getPassword());
                row.createCell(3).setCellValue(user.getSex());
                row.createCell(4).setCellValue(user.getEmail());
                row.createCell(5).setCellValue(user.getRole().getName());
                row.createCell(6).setCellValue(user.getDate());
			}
            

            //第七步，将文件存到流中
            ByteArrayOutputStream os = new ByteArrayOutputStream();
            wb.write(os);
            byte[] fileContent = os.toByteArray();
            ByteArrayInputStream is = new ByteArrayInputStream(fileContent);
    		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd hh:mm:dd");		 
    		fileName = "User"+sf.format(new Date()).toString()+ ".xls";
    		fileName= new String(fileName.getBytes(), "ISO8859-1");
    		//文件流
            reslutJson = is;            
        }
        catch(Exception e) {
            e.printStackTrace();
        }

        return "success";
    }
    
    /**
     * excel导入
     * @return
     * @throws IOException 
     * @throws FileNotFoundException 
     */
	@Action(value="importUser",results={@org.apache.struts2.convention.annotation.Result(type="stream",
			params={
					"inputName", "reslutJson"
			})})
    public String  ImportUser() throws FileNotFoundException, IOException{
        try {
        	List<User> lUsers=new ArrayList<User>();
	    	if (upfile!=null) {
	        	POIFSFileSystem fs=new POIFSFileSystem(new FileInputStream(upfile));   
	        	HSSFWorkbook wb = new HSSFWorkbook(fs); 
	        	HSSFSheet sheet = wb.getSheetAt(0); 
	            // 循环遍历表,sheet.getLastRowNum()是获取一个表最后一条记录的记录号
	            for (int i = Integer.parseInt(first)-1 ; i <= sheet.getLastRowNum(); i++) {
	                // 创建一个行对象
	                HSSFRow row = sheet.getRow(i);
	
	    				User user=new User();
	    				user.setJobnumber(row.getCell(0).getStringCellValue());
	    				user.setName(row.getCell(1).getStringCellValue());
	    				user.setPassword(row.getCell(2).getStringCellValue());	    				
	    				user.setSex(row.getCell(3).getStringCellValue());
	    				String rid=roleBIZ.GetRoleID(row.getCell(4).getStringCellValue());
	    				if (rid==null) {
							throw new Exception(row.getCell(0).getStringCellValue() +" 的权限不存在！");
						}
	    				user.setRid(roleBIZ.GetRoleID(row.getCell(4).getStringCellValue()));
	    				user.setDate(row.getCell(5).getStringCellValue());
	    				lUsers.add(user);
	            }
	            userBIZ.inportUser(lUsers);
	            wb.close();
	            fs.close();
	            result.setMessage(Message.UPLOAD_MESSAGE_SUCCESS);
				result.setStatusCode("200");
			}else{
				result.setMessage(Message.UPLOAD_MESSAGE_ERROE);
				result.setStatusCode("300");
			}
		} catch (Exception e) {
			result.setMessage(e.getMessage());
			result.setStatusCode("300");
		}
        reslutJson=new ByteArrayInputStream(new Gson().toJson(result).getBytes("UTF-8"));  
    	return SUCCESS;
    }
    
    
    
	

}

