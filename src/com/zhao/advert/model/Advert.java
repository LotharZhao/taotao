package com.zhao.advert.model;

import java.util.Date;

import com.zhao.product.model.Product;

/**
 * 广告的实体类
 * @author zhaoliangtao
 *CREATE TABLE `t_advert` (
  `adid` int(11) NOT NULL auto_increment,
  `adtype` int(11) NOT NULL,
  `adname` varchar(255) default NULL,
  `addesc` varchar(255) default NULL,
  `img` varchar(255) default NULL,
  `adprice` double(10,2) default NULL,
  `adtime` varchar(255) default NULL,
  `pid` int(11) default NULL,
  PRIMARY KEY  (`adid`),
  KEY `agid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 */
public class Advert {
	
	private Integer adid;
	private Integer adtype;
	private String adname;
	private String desc;
	private String img;
	private Double adprice;
	private String adtime;
	private Integer pid;

	public Integer getAdid() {
		return adid;
	}
	public void setAdid(Integer adid) {
		this.adid = adid;
	}
	public Integer getAdtype() {
		return adtype;
	}
	public void setAdtype(Integer adtype) {
		this.adtype = adtype;
	}
	public String getAdname() {
		return adname;
	}
	public void setAdname(String adname) {
		this.adname = adname;
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
	public Double getAdprice() {
		return adprice;
	}
	public void setAdprice(Double adprice) {
		this.adprice = adprice;
	}
	public String getAdtime() {
		return adtime;
	}
	public void setAdtime(String adtime) {
		this.adtime = adtime;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
}
