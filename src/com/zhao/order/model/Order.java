package com.zhao.order.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.zhao.user.model.User;

/**
 * 订单实体类
 * @author zhaoliangtao
 *CREATE TABLE `t_order` (
  `oid` int(11) NOT NULL auto_increment,
  `total` double default NULL,
  `ordertime` datetime default NULL,
  `state` int(11) default NULL,
  `name` varchar(255) default NULL,
  `addr` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `remark` varchar(255) default NULL,
  `payment` varchar(255) default NULL,
  `uid` int(11) default NULL,
  PRIMARY KEY  (`oid`),
  KEY `FKkymvvaj9rps3st3bkniqi0oci` (`uid`),
  CONSTRAINT `FKkymvvaj9rps3st3bkniqi0oci` FOREIGN KEY (`uid`) REFERENCES `t_user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 */
public class Order {

	private Integer oid;
	private Double total;
	private Date ordertime;
	private Integer state;// 0:未付款   1:已付款   2:已发货   3:已到货   4:订单结束
	private String name;
	private String phone;
	private String addr;
	private String remark;
	private String payment;
	// 用户的外键:对象
	private User user;
	// 配置订单项的集合
	private Set<OrderItem> orderItems = new HashSet<OrderItem>();

	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public Date getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Set<OrderItem> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(Set<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}
}
