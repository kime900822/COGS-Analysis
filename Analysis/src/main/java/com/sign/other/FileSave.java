package com.sign.other;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
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



	public String fileSave(File upfile,String filename){
		String filepath=judeDirExists();

			if (filepath!=null) {
				File file=new File(filepath+"/"+filename);
		        if (file.exists()) {
		        	return null;
		        } else {
		        	if (upfile.renameTo(file)) {
		        		logUtil.logInfo("上传文件:"+file.getPath());
		        		return file.getPath();
					}else{
						return null;				
					}
		        	
		        }
			}else{
				return null;
			}

			
		
        
		
		
	}
	
	
	public byte[] getFile(String fileName){
		String filepath=judeDirExists();
			if (filepath!=null) {
				if (fileName.split("/").length>0 ) {
					return getBytes(fileName);		
				}else{
					return getBytes(filepath+"/"+fileName);	
				}				
			}else{
				return null;
			}
	}
	
    private byte[] getBytes(String filePath){  
        byte[] buffer = null;  
        try {  
            File file = new File(filePath);  
            FileInputStream fis = new FileInputStream(file);  
            ByteArrayOutputStream bos = new ByteArrayOutputStream(1000);  
            byte[] b = new byte[1000];  
            int n;  
            while ((n = fis.read(b)) != -1) {  
                bos.write(b, 0, n);  
            }  
            fis.close();  
            bos.close();  
            buffer = bos.toByteArray();  
        } catch (FileNotFoundException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
        return buffer;  
    }
	
	public String getFilePath(String filename){
		String filepath=judeDirExists();
		return filepath+"/"+filename;		
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
        		
     
        }else{
        	return dir.getPath();        	
        }
        
    }
}
