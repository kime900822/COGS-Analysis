package com.kime.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kime.biz.UserBIZ;
import com.kime.dao.UserDAO;
import com.kime.infoenum.Message;
import com.kime.model.Role;
import com.kime.model.User;
import com.kime.utils.PropertiesUtil;

@Service
@Transactional(readOnly=true)
public class UserBIZImpl implements UserBIZ {
	
	@Autowired
	UserDAO userDao;

	public UserDAO getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDAO userDao) {
		this.userDao = userDao;
	}

	@Override
	public User login(String uid, String passWord) {
		if (uid.equals(PropertiesUtil.ReadProperties(Message.SYSTEM_PROPERTIES, "id"))&&passWord.equals(PropertiesUtil.ReadProperties(Message.SYSTEM_PROPERTIES, "password"))) {
			User user=new User();
			user.setName("admin");
			user.setPassword(passWord);
			user.setUid("admin");
			Role role=new Role();
			role.setName("admin");
			user.setRole(role);
			return user;
		}else{
			return userDao.login(uid, passWord);
		}
		
	}

	@Override
	@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class )
	public void register(User user) {
		userDao.save(user);
	}

	@Override
	public List<User> getUser(String where,Integer pageSize,Integer pageCurrent) {
		return userDao.query(where,pageSize , pageCurrent);
	}

	
	@Override
	public List<User> getUser(String where) {
		return userDao.query(where);
	}

	@Override
	@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class )
	public void modUser(User user) {
		userDao.update(user);
	}

	@Override
	@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class )
	public void deleteUser(User user) {
		userDao.delete(user);
		
	}

	@Override
	@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class )
	public void inportUser(List<User> lUsers) {
		for (User u : lUsers) {
			userDao.save(u);
		}
		
	}

	
}
