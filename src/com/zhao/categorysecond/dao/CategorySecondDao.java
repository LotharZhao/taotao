package com.zhao.categorysecond.dao;

import java.util.List;

import com.zhao.categorysecond.model.CategorySecond;

/**
 * 二级分类的持久层
 * @author zhaoliangtao
 *
 */
public interface CategorySecondDao {

	// 统计二级分类个数的方法
	int findCount();
	// 分页查询的方法
	List<CategorySecond> findByPage(int begin, int limit);
	// 保存二级分类的方法
	void save(CategorySecond categorySecond);
	// 删除二级分类的方法
	void delete(CategorySecond categorySecond);
	// 根据id查询二级分类的方法
	CategorySecond findByCsid(Integer csid);
	// 修改二级分类的方法
	void update(CategorySecond categorySecond);
	// 查询所有二级分类的方法
	List<CategorySecond> findAll();

}
