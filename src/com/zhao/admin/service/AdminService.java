package com.zhao.admin.service;

import org.springframework.transaction.annotation.Transactional;

import com.zhao.admin.dao.AdminDao;
import com.zhao.admin.model.Admin;

/**
 * 管理员模块的业务层
 * @author zhaoliangtao
 *
 */
@Transactional
public class AdminService {

	// 注入Dao
	private AdminDao adminDao;
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	// 登录
	public Admin login(Admin admin) {
		return adminDao.login(admin);
	}
}
