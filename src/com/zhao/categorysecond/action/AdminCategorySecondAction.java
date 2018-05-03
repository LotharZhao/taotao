package com.zhao.categorysecond.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.zhao.category.model.Category;
import com.zhao.category.service.CategoryService;
import com.zhao.categorysecond.model.CategorySecond;
import com.zhao.categorysecond.service.CategorySecondService;
import com.zhao.utils.PageBean;

/**
 * 后台二级分类的管理的Action
 * @author zhaoliangtao
 *
 */
public class AdminCategorySecondAction extends ActionSupport implements ModelDriven<CategorySecond> {

	private CategorySecond categorySecond = new CategorySecond();
	public CategorySecond getModel() {
		return categorySecond;
	}

	// 注入二级Service
	private CategorySecondService categorySecondService;
	// 注入一级分类的Service
	private CategoryService categoryService;

	public void setCategorySecondService(
			CategorySecondService categorySecondService) {
		this.categorySecondService = categorySecondService;
	}
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	// 接收page参数:
	private Integer page;
	public void setPage(Integer page) {
		this.page = page;
	}

	// 带有分页的查询所有二级分类的操作
	public String findAll() {
		// 调用Service进行查询
		PageBean<CategorySecond> pageBean = categorySecondService.findByPage(page);
		// 将pageBean的数据存入到值栈中
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		// 查询所有一级分类
		List<Category> cList = categoryService.findAll();
		// 将集合存入到值栈中
		ActionContext.getContext().getValueStack().set("cList", cList);

		return "findAll";
	}

	// 跳转到添加分类的方法
	public String addPage() {
		// 查询所有一级分类
		List<Category> cList = categoryService.findAll();
		// 将集合存入到值栈中
		ActionContext.getContext().getValueStack().set("cList", cList);
		// 页面跳转
		return "addPage";
	}

	// 添加二级分类的方法
	public String save() {
		categorySecondService.save(categorySecond);
		return "save";
	}

	// 删除二级分类的方法
	public String delete() {
		categorySecondService.delete(categorySecond);
		return "delete";
	}

	// 编辑二级分类的方法
	public String edit() {
		// 根据id查询二级分类
		categorySecond = categorySecondService.findByCsid(categorySecond.getCsid());
		// 查询所有一级分类
		List<Category> cList = categoryService.findAll();
		// 将集合存入到值栈中
		ActionContext.getContext().getValueStack().set("cList", cList);
		// 页面跳转
		return "edit";
	}

	// 修改二级分类的方法
	public String update(){
		categorySecondService.update(categorySecond);
		return "update";
	}
}
