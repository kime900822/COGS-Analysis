package com.kime.utils;

import java.text.DecimalFormat;

public class TypeChangeUtil {
	
	/**
	 * 四舍五入取2位小数
	 * @param tmp1 除数
	 * @param tmp2 被除数
	 * @return
	 */
	public static String division(String tmp1,String tmp2){	
		DecimalFormat   fnum   =   new   DecimalFormat("##0.00");  
		double value=Double.valueOf(tmp1)/Double.valueOf(tmp2);
		String   dd=fnum.format(value);      
		return dd;		
	}
}
