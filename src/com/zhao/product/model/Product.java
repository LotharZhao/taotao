package com.zhao.product.model;

import java.util.Date;

import com.zhao.categorysecond.model.CategorySecond;

/**
 * 商品的实体类
 * @author zhaoliangtao
 *CREATE TABLE `t_product` (
  `gid` int(11) NOT NULL auto_increment COMMENT '商品id',
  `pname` varchar(255) NOT NULL COMMENT '商品名',
  `nowprice` double(10,2) default NULL COMMENT '现价',
  `img1` varchar(255) default NULL COMMENT '图片',
  `img2` varchar(255) default NULL COMMENT '图片2',
  `star` int(11) NOT NULL default '0' COMMENT '星级',
  `pdesc` varchar(255) default NULL COMMENT '描述',
  `ptime` datetime default NULL COMMENT '上架时间',
  `ishot` int(11) NOT NULL default '0' COMMENT '是否热销',
  `csid` int(11) NOT NULL COMMENT '二级分类id',
  `cid` int(11) default NULL,
  PRIMARY KEY  (`gid`),
  KEY `FK7stakp6ge50jawogl5ep0s8av` (`cid`),
  KEY `FKrfkbevojv53oajihd6vqkovdi` (`csid`),
  CONSTRAINT `csid` FOREIGN KEY (`csid`) REFERENCES `t_categorysecond` (`csid`),
  CONSTRAINT `FK7stakp6ge50jawogl5ep0s8av` FOREIGN KEY (`cid`) REFERENCES `t_categorysecond` (`csid`),
  CONSTRAINT `FKrfkbevojv53oajihd6vqkovdi` FOREIGN KEY (`csid`) REFERENCES `t_categorysecond` (`csid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 */
public class Product {

	private Integer pid;
	private String pname;
	private Double nowprice;
	private String img1;
	private String img2;
	private Integer star;
	private String desc;
	private Date ptime;
	private Integer ishot;

	// 外键：二级分类id
	private CategorySecond categorySecond;

	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public Double getNowprice() {
		return nowprice;
	}
	public void setNowprice(Double nowprice) {
		this.nowprice = nowprice;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getImg2() {
		return img2;
	}
	public void setImg2(String img2) {
		this.img2 = img2;
	}
	public Integer getStar() {
		return star;
	}
	public void setStar(Integer star) {
		this.star = star;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public Date getPtime() {
		return ptime;
	}
	public void setPtime(Date ptime) {
		this.ptime = ptime;
	}
	public Integer getIshot() {
		return ishot;
	}
	public void setIshot(Integer ishot) {
		this.ishot = ishot;
	}
	public CategorySecond getCategorySecond() {
		return categorySecond;
	}
	public void setCategorySecond(CategorySecond categorySecond) {
		this.categorySecond = categorySecond;
	}
}
