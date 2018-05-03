package com.zhao.user.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.zhao.user.model.User;
import com.zhao.user.service.UserService;

/**
 * 用户模块的action类
 * @author zhaoliangtao
 *
 */
public class UserAction extends ActionSupport implements ModelDriven<User> {

	// 模型驱动使用的对象
	private User user = new User();
	@Override
	public User getModel() {
		return user;
	}
	
	// 接收验证码:
	private String checkcode;
	
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}

	// 注入UserService
	private UserService userService;
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	// 跳转到登陆/注册页面
	public String loginOrRegistPage() {
		return "loginOrRegistPage";
	}
	
	// AJAX进行异步校验注册邮箱的方法
	public String findByEmail() throws IOException{
		// 调用service进行查询
		User existUser = userService.findByEmail(user.getEmail());
		// 获得response对象，向页面输出
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		if(existUser != null) {
			// 查询到该用户，注册邮箱已存在
			response.getWriter().print("false");
		} else {
			// 没有查询到该用户，注册邮箱可以使用
			response.getWriter().println("true");
		}
		return NONE;
	}

	// 用户注册的方法
	public String regist() {
		User existUser = userService.findByEmail(user.getEmail());
		if(existUser == null) {
			userService.save(user);
			this.addActionMessage("注册成功，请前往邮箱激活");
			return "msg";
		} else {
			this.addActionMessage("注册失败");
			return "msg";
		}
	}
	
	// 用户激活的方法
	public String active() {
		// 根据激活码查询用户:
		User existUser = userService.findByCode(user.getActivationcode());
		// 判断
		if (existUser == null) {
			// 激活码错误的
			this.addActionMessage("激活失败:激活码错误!");
		} else {
			// 激活成功
			// 修改用户的状态
			existUser.setState(1);
			existUser.setActivationcode(null);
			userService.update(existUser);
			this.addActionMessage("激活成功:请去登录!");
		}
		return "msg";
	}
	
	// 登录的方法
	public String login() {
		User existUser = userService.login(user);
		// 判断验证码程序:
		// 从session中获得验证码的随机值:
		String checkcode1 = (String) ServletActionContext.getRequest().getSession().getAttribute("checkcode");
		if(!checkcode.equalsIgnoreCase(checkcode1)){
			this.addActionError("验证码输入错误!");
			return "checkcodeFail";
		}
		// 判断
		if (existUser == null) {
			// 登录失败
			this.addActionError("登录失败:用户名或密码错误或用户未激活!");
			return LOGIN;
		} else {
			// 登录成功
			// 将用户的信息存入到session中
			ServletActionContext.getRequest().getSession().setAttribute("existUser", existUser);
			// 页面跳转
			return "loginSuccess";
		}
	}
	
	// 跳转的个人中心页面
	public String info() {
		return "info";
	}
	
	// AJAX进行异步校验登录名的方法
	public String findByUsername() throws IOException{
		User existUser = userService.findByUsername(user.getUsername());
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		if(existUser != null) {
			response.getWriter().print("false");
		} else {
			response.getWriter().println("true");
		}
		return NONE;
	}
	
	public String saveInfo() {
		User existUser = userService.findByEmail(user.getEmail());
		existUser.setUsername(user.getUsername());
		existUser.setRealname(user.getRealname());
		existUser.setPhone(user.getPhone());
		existUser.setAddr(user.getAddr());
		existUser.setPassword(user.getPassword());
		userService.update(existUser);
		ServletActionContext.getRequest().getSession().setAttribute("existUser", existUser);
		return "saveInfo";
	}
	
	// 用户退出的方法
	public String quit(){
		// 销毁session
		ServletActionContext.getRequest().getSession().invalidate();
		return "quit";
	}
}
