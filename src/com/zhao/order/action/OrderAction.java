package com.zhao.order.action;

import java.util.Date;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.zhao.cart.model.Cart;
import com.zhao.cart.model.CartItem;
import com.zhao.order.model.Order;
import com.zhao.order.model.OrderItem;
import com.zhao.order.service.OrderService;
import com.zhao.user.model.User;
import com.zhao.utils.PageBean;

/**
 * 订单的Action类
 * @author zhaoliangtao
 *
 */
public class OrderAction extends ActionSupport implements ModelDriven<Order> {

	// 模型驱动使用的对象
	private Order order = new Order();
	public Order getModel() {
		return order;
	}
	
	// 注入orderService
	private OrderService orderService;
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	// 接收page
	private Integer page;
	public void setPage(Integer page) {
		this.page = page;
	}
	
	// 生成订单
	public String saveOrder() {

		// 调用Service完成数据库插入的操作
		// 设置订单的总金额:订单的总金额应该是购物车中总金额
		// 购物车在session中,从session总获得购物车信息
		Cart cart = (Cart) ServletActionContext.getRequest().getSession().getAttribute("cart");
		if (cart == null) {
			this.addActionMessage("亲!您还没有购物!");
			return "myCart";
		}
		order.setTotal(cart.getTotal());
		// 设置订单时间
		order.setOrdertime(new Date());
		// 设置订单的状态
		order.setState(0); // 0:未付款
		// 设置订单关联的客户
		User existUser = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		if (existUser == null) {
			this.addActionMessage("亲!您还没有登录!");
			return "myCart";
		}
		order.setUser(existUser);
		// 设置订单项集合
		for (CartItem cartItem : cart.getCartItems()) {
			// 订单项的信息从购物项获得的
			OrderItem orderItem = new OrderItem();
			orderItem.setCount(cartItem.getCount());
			orderItem.setSubtotal(cartItem.getSubtotal());
			orderItem.setProduct(cartItem.getProduct());
			orderItem.setOrder(order);

			order.getOrderItems().add(orderItem);
		}

		orderService.save(order);
		// 清空购物车:
		cart.clearCart();

		// 页面需要回显订单信息，使用模型驱动了 所有可以不使用值栈保存了
//		ActionContext.getContext().getValueStack().set("order", order);

		return "saveOrder";
	}
	// 查询我的订单:
	public String findByUid() {
		// 获得用户的id
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		// 获得用户的id
		Integer uid = user.getUid();
		// 根据用户的id查询订单
		PageBean<Order> pageBean = orderService.findByUid(uid, page);
		// 将PageBean数据带到页面上
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findByUid";
	}
	
	// 根据订单id查询订单:
	public String findByOid() {
		order = orderService.findByOid(order.getOid());
		return "findByOid";
	}
	
	// 为订单付款
	public String payOrder() {
		// 修改数据
		Order currOrder = orderService.findByOid(order.getOid());
		currOrder.setAddr(order.getAddr());
		currOrder.setName(order.getName());
		currOrder.setPhone(order.getPhone());
		currOrder.setRemark(order.getRemark());
		currOrder.setPayment(order.getPayment());
		currOrder.setState(1);
		// 修改订单
		orderService.update(currOrder);

		if(currOrder.getPayment() != "cod"){
			this.addActionMessage("支付成功!订单编号为: " + currOrder.getOid() + " 付款金额为: " + currOrder.getTotal());
		} else {
			this.addActionMessage("下单成功!订单编号为: " + currOrder.getOid() + " 预计3天内送到，请提前准备好支付。");
		}
		return "msg";
	}
	// 修改订单的状态
	public String updateState() {
		Order currOrder = orderService.findByOid(order.getOid());
		currOrder.setState(4);
		orderService.update(currOrder);
		return "updateState";
	}
}
