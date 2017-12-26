package com.sign.other;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kime.infoenum.Message;
import com.kime.utils.LogUtil;
import com.kime.utils.PropertiesUtil;

@Component
public class FileSave {
	
	@Autowired
	LogUtil logUtil;
	
	
	public LogUtil getLogUtil() {
		return logUtil;
	}
	public void setLogUtil(LogUtil logUtil) {
		this.logUtil = logUtil;
	}



	public boolean fleSave(File upfile,String filename){
		String filepath=judeDirExists();

			if (filepath!=null) {
				File file=new File(filepath+"/"+filename);
		        if (file.exists()) {
		        	return false;
		        } else {
		        	if (upfile.renameTo(file)) {
		        		logUtil.logInfo("上传文件:"+file.getPath());
		        		return true;
					}else{
						return false;				
					}
		        	
		        }
			}else{
				return false;
			}

			
		
        
		
		
	}
	
    
    
    // 判断文件夹是否存在
    public String judeDirExists() {
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
    	Date date=new Date();
    	File dir=new File(PropertiesUtil.ReadProperties(Message.SYSTEM_PROPERTIES, "filepath")+sdf.format(date));
        if (!dir.exists()||!dir.isDirectory()) {
            	if (dir.mkdirs()) {
            		logUtil.logInfo("文件夹不存在，新建文件夹："+dir.getPath());
            		return dir.getPath();
    			}else{
    				return null;
    			}
        		
     
        }
		return null;
        
    }
}
