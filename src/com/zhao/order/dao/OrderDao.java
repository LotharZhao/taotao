package com.zhao.order.dao;

import java.util.List;

import com.zhao.order.model.Order;
import com.zhao.order.model.OrderItem;

/**
 * 订单的持久层
 * @author zhaoliangtao
 *
 */
public interface OrderDao {

	// 保存订单额操作
	void save(Order order);
	// 查询我的订单分页查询:统计个数
	int findCountByUid(Integer uid);
	// 查询我的订单分页查询:查询数据
	List<Order> findPageByUid(Integer uid, int begin, int limit);
	// 根据oid查询订单
	Order findByOid(Integer oid);
	// 修改订单的方法
	void update(Order order);
	// 统计订单个数的方法
	int findCount();
	// 分页查询订单的方法
	List<Order> findByPage(int begin, int limit);
	// 根据订单id查询订单项
	List<OrderItem> findOrderItem(Integer oid);
}
