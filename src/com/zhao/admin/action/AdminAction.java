package com.zhao.admin.action;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.zhao.admin.model.Admin;
import com.zhao.admin.service.AdminService;
/**
 * 管理员模块的action类
 * @author zhaoliangtao
 *
 */
public class AdminAction extends ActionSupport implements ModelDriven<Admin> {

	private Admin admin = new Admin();
	public Admin getModel() {
		return admin;
	}

	// 注入AdminService
	private AdminService adminService;
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	// 后台登录的执行的方法
	public String login() {
		// 调用service方法完成登录
		Admin existAdmin = adminService.login(admin);
		// 判断
		if (existAdmin == null) {
			// 用户名或密码错误
			this.addActionError("用户名或密码错误！");
			return "loginFail";
		} else {
			// 登录成功:
			ServletActionContext.getRequest().getSession().setAttribute("existAdmin", existAdmin);
			return "login";
		}
	}
}
