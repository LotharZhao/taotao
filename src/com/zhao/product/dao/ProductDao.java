package com.zhao.product.dao;

import java.util.List;

import com.zhao.product.model.Product;

/**
 * 商品的持久层
 * @author zhaoliangtao
 *
 */
public interface ProductDao {

	// 查询热门商品
	List<Product> findHot();
	// 根据商品id查询商品
	Product findByPid(Integer pid);
	// 查询最新商品
	List<Product> findNew();
	// 所有商品数量
	int findAllCount();
	// 查询所有商品
	List<Product> findAll(int begin, int limit);
	// 根据分类id查询商品个数
	int findCountByCid(Integer cid);
	// 根据分类id查询商品集合
	List<Product> findByPageCid(Integer cid, int begin, int limit);
	// 根据二级分类id查询商品个数
	int findCountByCsid(Integer csid);
	// 根据二级分类id查询商品集合
	List<Product> findByPageCsid(Integer csid, int begin, int limit);
	// 后台统计商品个数的方法
	int findCount();
	// 后台查询所有商品的方法
	List<Product> findByPage(int begin, int limit);
	// 保存商品的方法
	void save(Product product);
	// 删除商品的方法
	void delete(Product product);
	// 更新商品的方法
	void update(Product product);
}
