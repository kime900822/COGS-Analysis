package com.kime.biz.impl;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kime.biz.MenuBIZ;
import com.kime.biz.RoleBIZ;
import com.kime.dao.MenuDAO;
import com.kime.model.Menu;
import com.kime.model.Role;

@Service
@Transactional(readOnly=true)
public class MenuBIZImpl implements MenuBIZ {
	
	@Autowired
	MenuDAO menuDao;
	@Autowired
	RoleBIZ roleBIZ;
	public MenuDAO getMenuDao() {
		return menuDao;
	}

	public void setMenuDao(MenuDAO menuDao) {
		this.menuDao = menuDao;
	}



	@Override
	@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class )
	public void editMenu(Menu menu) {
		if (menuDao.getMenuByID(menu.getId())==null) {
			menuDao.save(menu);
		}else{
			menuDao.modMenu(menu);
		}
		
	}

	@Override
	public List getAllMenu() {	
		return menuDao.getAllMenu();
	}

	@Override
	public List getParentMenu() {		
		return menuDao.getParentMenu();
	}

	/**
	 * 取所有子菜单
	 */
	@Override
	public String getChildMenu(String parentID) {
		
		StringBuilder sb=new StringBuilder();
		List<Menu> lmenu=menuDao.getMenuByParentID(parentID);
		if (lmenu.size()>0) {
			sb.append("[");
			for (Menu m : lmenu) {
				sb.append(getChildMenu_recursion(m));
			}
			sb.deleteCharAt(sb.length()-1);
			sb.append("]");
			return sb.toString();
		}
		else
			return "";
		
	}
	
	/**
	 * 根据用户类型取菜单
	 */
	@Override
	public String getChildMenu_R(String parentID,List<Role> lRoles) {
		
		StringBuilder sb=new StringBuilder();
		List<Menu> lmenu=menuDao.getMenuByParentID(parentID);
		if (lmenu.size()>0) {
			sb.append("[");
			for (Menu m : lmenu) {
				sb.append(getChildMenu_recursion_r(m,lRoles));
			}
			
			sb.deleteCharAt(sb.length()-1);
			sb.append("]");
			if (sb.toString().equals("]")) {
				return "{\"name\":\"无子菜单\"}";
			}
			return sb.toString();
		}
		else
			return "";
		
	}

	@Override
	@Transactional(readOnly=false,propagation=Propagation.REQUIRES_NEW,rollbackFor=Exception.class)
	public void deleteMenu(Menu menu) {
		List<Menu> lm=new ArrayList<Menu>();
		lm.add(menu);
		lm.addAll(getAllChildMenu(menu));
		for (Menu m : lm) {
			List<Role> lRoles=roleBIZ.GetRole(" where menuid='"+m.getId()+"'");
			for (Role role : lRoles) {
				roleBIZ.Delete(role);
			}
			menuDao.deleteMenu(m);		
		}
		
		
	}
	
	
	public List getAllChildMenu(Menu menu){
		List<Menu> lMenus=new ArrayList<Menu>();
		lMenus.addAll(menuDao.getMenuByParentID(menu.getId()));
		if (lMenus.size()>0) {
			lMenus.addAll(getAllChildMenu((Menu)lMenus.get(lMenus.size()-1)));
		}

		return lMenus;			

		
	}
	
	@Override
	public List getMenu(String level,String order) {
		return menuDao.getMenu(level,order);		
	}

	
	
	@Override
	public Menu getMenuById(String id) {
		return menuDao.getMenuByID(id);
	}

	public StringBuilder getChildMenu_recursion(Menu menu){
		StringBuilder sb=new StringBuilder();
		List<Menu> lmenus=menuDao.getMenuByParentID(menu.getId());
		if (lmenus.size()>0) {
			sb.append("{\"name\":\""+menu.getName()+"\",\"children\":[");
			for (Menu m : lmenus) {
				sb.append(getChildMenu_recursion(m));
			}
			sb.deleteCharAt(sb.length()-1);
			sb.append("]},");
		}else{
				sb.append("{\"id\":\""+menu.getPageid()+"\",");
				sb.append("\"name\":\""+menu.getName()+"\",");
				sb.append("\"target\":\""+menu.getTarget()+"\",");
				sb.append("\"url\":\""+menu.getUrl()+"\"},");
		}
		return sb;
		
	}

	
	public StringBuilder getChildMenu_recursion_r(Menu menu,List<Role> lRoles){
		StringBuilder sb=new StringBuilder();
		List<Menu> lmenus=menuDao.getMenuByParentID(menu.getId());
		if (isInRole(menu, lRoles)) {		
			if (lmenus.size()>0) {
				sb.append("{\"name\":\""+menu.getName()+"\",\"children\":[");
				for (Menu m : lmenus) {
					sb.append(getChildMenu_recursion_r(m,lRoles));		
				}
				if (sb.charAt(sb.length()-1)==',') {
					sb.deleteCharAt(sb.length()-1);
				}		
				sb.append("]},");
			}else{
					sb.append("{\"id\":\""+menu.getPageid()+"\",");
					sb.append("\"name\":\""+menu.getName()+"\",");
					sb.append("\"target\":\""+menu.getTarget()+"\",");
					sb.append("\"url\":\""+menu.getUrl()+"\"},");
	
			}
		}
		return sb;
		
	}
	
	public boolean isInRole(Menu menu,List<Role> lRoles){
		for (Role role : lRoles) {
			if (menu.getId().equals(role.getMenuid())) {
				return true;
			}
		}
		return false;
	}
	
	
}
