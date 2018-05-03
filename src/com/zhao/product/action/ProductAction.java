package com.zhao.product.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.zhao.category.service.CategoryService;
import com.zhao.product.model.Product;
import com.zhao.product.service.ProductService;
import com.zhao.utils.PageBean;
/**
 * 商品的action类
 * @author zhaoliangtao
 *
 */
public class ProductAction extends ActionSupport implements ModelDriven<Product> {
	// 用于接收数据的模型驱动
	private Product product = new Product();
	public Product getModel() {
		return product;
	}
	// 注入Service
	private ProductService productService;
	private CategoryService categoryService;
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	// 接收分类的cid
	private Integer cid;
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public Integer getCid() {
		return cid;
	}
	// 接收二级分类的csid
	private Integer csid;
	public void setCsid(Integer csid) {
		this.csid = csid;
	}
	public Integer getCsid() {
		return csid;
	}
	// 接收当前页数
	private int page;
	public void setPage(int page) {
		this.page = page;
	}

	// 根据商品id查询商品
	public String findByPid() {
		product = productService.findByPid(product.getPid());

		// 查询热门商品!!!!!
		List<Product> hList = productService.findHot();
		// 保存到值栈
		ActionContext.getContext().getValueStack().set("hList", hList);
		
		return "findByPid";
	}
	
	// 查询所有商品
	public String findAll() {
		// 查询最新商品!!!!
		List<Product> nList = productService.findNew();
		// 保存到值栈
		ActionContext.getContext().getValueStack().set("nList", nList);
		
		// 根据一级分类查询商品数量
		int productNum = productService.findAllCount();
		ActionContext.getContext().getValueStack().set("productNum", productNum);
		
		// 查询所有商品，带分页
		PageBean<Product> pageBean = productService.findAll(page);
		// 将PageBean存入到值栈中:
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findByCid";
	}
	
	// 根据一级分类查询商品
	public String findByCid() {
		// 查询最新商品!!!!
		List<Product> nList = productService.findNew();
		// 保存到值栈
		ActionContext.getContext().getValueStack().set("nList", nList);
		
		// 根据一级分类查询商品数量
		int productNum = productService.findCountByCid(cid);
		ActionContext.getContext().getValueStack().set("productNum", productNum);
		
		// 根据一级分类查询商品，带分页
		PageBean<Product> pageBean = productService.findByPageCid(cid, page);
		// 将PageBean存入到值栈中:
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findByCid";
	}
	
	// 根据二级分类查询商品
	public String findByCsid() {
		// 查询最新商品!!!!
		List<Product> nList = productService.findNew();
		// 保存到值栈
		ActionContext.getContext().getValueStack().set("nList", nList);
		
		// 根据一级分类查询商品数量
		int productNum = productService.findCountByCsid(csid);
		ActionContext.getContext().getValueStack().set("productNum", productNum);
		
		// 根据一级分类查询商品，带分页
		PageBean<Product> pageBean = productService.findByPageCsid(csid, page);
		// 将PageBean存入到值栈中:
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findByCsid";
	}
}
