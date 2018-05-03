
package com.zhao.index.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.zhao.advert.model.Advert;
import com.zhao.advert.service.AdvertService;
import com.zhao.category.model.Category;
import com.zhao.category.service.CategoryService;
import com.zhao.product.model.Product;
import com.zhao.product.service.ProductService;

/**
 * 首页访问的action类
 * @author zhaoliangtao
 *
 */
public class IndexAction extends ActionSupport {

	private CategoryService categoryService;
	private ProductService productService;
	private AdvertService advertService;
	
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public void setAdvertService(AdvertService advertService) {
		this.advertService = advertService;
	}

	// 访问首页的方法
	public String execute() throws Exception {
		// 查询一级分类
		List<Category> cList = categoryService.findAll();
		// 将一级分类存入session
		ActionContext.getContext().getSession().put("cList", cList);

		// 查询热门商品
		List<Product> hList = productService.findHot();
		// 保存到值栈
		ActionContext.getContext().getValueStack().set("hList", hList);
		
		// 查询主小广告
		List<Advert> smList = advertService.findSmallMain();
		ActionContext.getContext().getValueStack().set("smList", smList);
		// 查询主大广告
		Advert dig1Abvert = advertService.findDig1Main();
		ActionContext.getContext().getValueStack().set("dig1Abvert", dig1Abvert);
		Advert dig2Abvert = advertService.findDig2Main();
		ActionContext.getContext().getValueStack().set("dig2Abvert", dig2Abvert);
		// 查询限时抢购
		Advert flashSale = advertService.findFlashSale();
		ActionContext.getContext().getValueStack().set("flashSale", flashSale);
		
		return "index";
	}
	
}