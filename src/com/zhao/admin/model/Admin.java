package com.zhao.admin.model;
/**
 * 后台管理员登录实体
 * @author zhaoliangtao
 *CREATE TABLE `t_admin` (
  `aid` int(11) NOT NULL auto_increment COMMENT '管理员id',
  `username` varchar(255) NOT NULL COMMENT '管理员登陆名',
  `password` varchar(255) NOT NULL COMMENT '管理员登陆密码',
  PRIMARY KEY  (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 */
public class Admin {

	private Integer aid;
	private String username;
	private String password;

	public Integer getAid() {
		return aid;
	}
	public void setAid(Integer aid) {
		this.aid = aid;
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
}
