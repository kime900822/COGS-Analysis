package com.kime.dao;

import java.util.List;

import com.kime.model.SystemLog;

public interface SystemLogDAO {

	/**
	 * 删除日志
	 * @param systemLog
	 */
	public void delete(SystemLog systemLog);
	
	/**
	 * 插入日志
	 * @param systemLog
	 */
	public void insert(SystemLog systemLog);
	
	/**
	 * 日志查询
	 * @param where
	 * @return
	 */
	public List<SystemLog> query(String where);
	
}
