package com.zhao.order.model;

import com.zhao.product.model.Product;

/**
 * 订单项的实体
 * @author zhaoliangtao
 *CREATE TABLE `t_orderitem` (
  `oiid` int(11) NOT NULL auto_increment,
  `count` int(11) default NULL,
  `subtotal` double default NULL,
  `oid` int(11) default NULL,
  `gid` int(11) default NULL,
  `uid` int(11) default NULL,
  PRIMARY KEY  (`oiid`),
  KEY `FKiw2wap6k0hov6im3qafo0pmh5` (`oid`),
  KEY `FKlr0f3nrafiwmrawy64tjiwrf8` (`gid`),
  KEY `FKfiyd20mnbg3laxq3g9326duhn` (`uid`),
  CONSTRAINT `FKfiyd20mnbg3laxq3g9326duhn` FOREIGN KEY (`uid`) REFERENCES `t_order` (`oid`),
  CONSTRAINT `FKiw2wap6k0hov6im3qafo0pmh5` FOREIGN KEY (`oid`) REFERENCES `t_order` (`oid`),
  CONSTRAINT `FKlr0f3nrafiwmrawy64tjiwrf8` FOREIGN KEY (`gid`) REFERENCES `t_product` (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 */
public class OrderItem {

	private Integer oiid;
	private Integer count;
	private Double subtotal;
	// 商品外键:对象
	private Product product;
	// 订单外键:对象
	private Order order;

	public Integer getOiid() {
		return oiid;
	}
	public void setOiid(Integer oiid) {
		this.oiid = oiid;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(Double subtotal) {
		this.subtotal = subtotal;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	
}
