package com.zhao.category.dao;

import java.util.List;

import com.zhao.category.model.Category;

/**
 * 一级分类的持久层
 * @author zhaoliangtao
 *
 */
public interface CategoryDao {

	// 查询所有一级分类
	List<Category> findAll();
	// 保存一级分类的方法
	void save(Category category);
	// 根据一级分类id查询一级分类
	Category findByCid(Integer cid);
	// 删除一级分类
	void delete(Category category);
	// 修改一级分类
	void update(Category category);

}
