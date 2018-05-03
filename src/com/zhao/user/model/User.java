package com.zhao.user.model;
/**
 * 用户模块的实体类
 * @author zhaoliangtao
 * CREATE TABLE `t_user` (
  `uid` int(11) NOT NULL auto_increment COMMENT '用户id',
  `email` varchar(255) NOT NULL default '' COMMENT '激活邮箱',
  `username` varchar(255) default NULL COMMENT '用户登陆名',
  `password` varchar(255) NOT NULL COMMENT '登陆密码',
  `realname` varchar(255) default NULL COMMENT '用户真实姓名',
  `phone` varchar(255) default NULL COMMENT '电话',
  `addr` varchar(255) default NULL COMMENT '地址',
  `state` int(11) NOT NULL default '0' COMMENT '状态',
  `activationcode` varchar(255) default NULL COMMENT '激活码',
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 */
public class User {

	private Integer uid;
	private String email;
	private String username;
	private String password;
	private String realname;
	private String phone;
	private String addr;
	private Integer state;
	private String activationcode;

	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getActivationcode() {
		return activationcode;
	}
	public void setActivationcode(String activationcode) {
		this.activationcode = activationcode;
	}
}
