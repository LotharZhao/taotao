package com.zhao.category.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import com.zhao.categorysecond.model.CategorySecond;

/**
 * 一级分类的实体类
 * @author zhaoliangtao
 *CREATE TABLE `t_category` (
  `cid` int(11) NOT NULL auto_increment COMMENT '分类id',
  `cname` varchar(255) NOT NULL COMMENT '分类名',
  `cdesc` varchar(255) default NULL COMMENT '描述',
  `img` varchar(255) default NULL,
  PRIMARY KEY  (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 */
public class Category implements Serializable {

	private Integer cid;
	private String cname;
	private String desc;
	private String img;
	
	// 存放二级分类的集合
	private Set<CategorySecond> categorySeconds = new HashSet<CategorySecond>();

	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Set<CategorySecond> getCategorySeconds() {
		return categorySeconds;
	}
	public void setCategorySeconds(Set<CategorySecond> categorySeconds) {
		this.categorySeconds = categorySeconds;
	}
}
