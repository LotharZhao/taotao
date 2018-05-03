package com.zhao.categorysecond.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import com.zhao.category.model.Category;
import com.zhao.product.model.Product;

/**
 * 二级分类的实体类
 * @author zhaoliangtao
 *CREATE TABLE `t_categorysecond` (
  `csid` int(11) NOT NULL auto_increment COMMENT '二级分类id',
  `csname` varchar(255) NOT NULL COMMENT '二级分类名',
  `csdesc` varchar(255) default NULL COMMENT '描述',
  `cid` int(11) NOT NULL COMMENT '一级分类id',
  PRIMARY KEY  (`csid`),
  KEY `FK4td4lluowiquqd2s9e9j2fmdq` (`cid`),
  CONSTRAINT `cid` FOREIGN KEY (`cid`) REFERENCES `t_category` (`cid`),
  CONSTRAINT `FK4td4lluowiquqd2s9e9j2fmdq` FOREIGN KEY (`cid`) REFERENCES `t_category` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

 */
public class CategorySecond implements Serializable {

	private Integer csid;
	private String csname;
	private String desc;

	// 外键：一级分类id
	private Category category;

	// 存放商品的集合
	private Set<Product> products = new HashSet<Product>();

	public Integer getCsid() {
		return csid;
	}
	public void setCsid(Integer csid) {
		this.csid = csid;
	}
	public String getCsname() {
		return csname;
	}
	public void setCsname(String csname) {
		this.csname = csname;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Set<Product> getProducts() {
		return products;
	}
	public void setProducts(Set<Product> products) {
		this.products = products;
	}
}
