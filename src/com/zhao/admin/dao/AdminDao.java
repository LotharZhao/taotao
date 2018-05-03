package com.zhao.admin.dao;

import com.zhao.admin.model.Admin;

/**
 * 管理员模块持久层
 * @author zhaoliangtao 
 *
 */
public interface AdminDao {

	// Dao完成登录
	public Admin login(Admin admin);
}
