package com.zhao.product.action;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.zhao.categorysecond.model.CategorySecond;
import com.zhao.categorysecond.service.CategorySecondService;
import com.zhao.product.model.Product;
import com.zhao.product.service.ProductService;
import com.zhao.utils.PageBean;
/**
 * 后台商品的action
 * @author zhaoliangtao
 *
 */
public class AdminProductAction extends ActionSupport implements ModelDriven<Product> {

	private Product product = new Product();
	public Product getModel() {
		return product;
	}

	private ProductService productService;
	private CategorySecondService categorySecondService;
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public void setCategorySecondService(
			CategorySecondService categorySecondService) {
		this.categorySecondService = categorySecondService;
	}
	
	// 接收page参数
	private Integer page;
	public void setPage(Integer page) {
		this.page = page;
	}

	// 查询所有的商品
	public String findAll() {
		PageBean<Product> pageBean = productService.findByPage(page);
		// 将PageBean数据存入到值栈中
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		// 页面跳转
		return "findAll";
	}

	// 跳转到添加页面的方法
	public String addPage() {
		// 查询所有的二级分类
		List<CategorySecond> csList = categorySecondService.findAll();
		// 将二级分类的数据显示到页面上
		ActionContext.getContext().getValueStack().set("csList", csList);
		// 页面跳转
		return "addPage";
	}

	// 保存商品的方法
	public String save() throws IOException {
		// 将提交的数据添加到数据库中
		product.setPtime(new Date());
		productService.save(product);
		return "save";
	}

	// 删除商品的方法
	public String delete() {
		// 删除数据库中商品记录
		productService.delete(product);
		// 页面跳转
		return "delete";
	}

	// 编辑商品的方法
	public String edit() {
		// 根据商品id查询商品信息
		product = productService.findByPid(product.getPid());
		// 查询所有二级分类
		List<CategorySecond> csList = categorySecondService.findAll();
		ActionContext.getContext().getValueStack().set("csList", csList);
		// 页面跳转到编辑页面
		return "edit";
	}

	// 修改商品的方法
	public String update() throws IOException {
		product.setPtime(new Date());
		productService.update(product);
		// 页面跳转
		return "update";
	}
}
