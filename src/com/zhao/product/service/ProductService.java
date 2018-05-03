package com.zhao.product.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.zhao.product.dao.ProductDao;
import com.zhao.product.model.Product;
import com.zhao.utils.PageBean;

/**
 * 商品的业务层
 * @author zhaoliangtao
 *
 */
@Transactional
public class ProductService {

	private ProductDao productDao;
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	// 查询热门商品
	public List<Product> findHot() {
		return productDao.findHot();
	}

	// 根据商品id查询商品
	public Product findByPid(Integer pid) {
		return productDao.findByPid(pid);
	}

	// 查询最新商品
	public List<Product> findNew() {
		return productDao.findNew();
	}
	
	// 所有商品数量
	public int findAllCount() {
		return productDao.findAllCount();
	}

	// 查询所有商品，带分页
	public PageBean<Product> findAll(int page) {
		PageBean<Product> pageBean = new PageBean<Product>();
		// 设置当前页数
		pageBean.setPage(page);;
		// 设置每页显示记录数
		int limit = 9;
		pageBean.setLimit(limit);
		// 设置总的记录数
		int totalCount = 0;
		totalCount = productDao.findAllCount();
		pageBean.setTotalCount(totalCount);
		// 设置总页数
		int totalPage = 0;
		if(totalCount % limit==0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		// 每页显示的数据的集合
		// 从哪开始
		int begin = (page - 1) * limit;
		List<Product> list = productDao.findAll(begin, limit);
		pageBean.setList(list);
		
		return pageBean;
	}

	// 根据一级分类查询商品数量
	public int findCountByCid(Integer cid) {
		return productDao.findCountByCid(cid);
	}
	
	// 根据一级分类查询商品，带分页
	public PageBean<Product> findByPageCid(Integer cid, int page) {
		PageBean<Product> pageBean = new PageBean<Product>();
		// 设置当前页数
		pageBean.setPage(page);;
		// 设置每页显示记录数
		int limit = 9;
		pageBean.setLimit(limit);
		// 设置总的记录数
		int totalCount = 0;
		totalCount = productDao.findCountByCid(cid);
		pageBean.setTotalCount(totalCount);
		// 设置总页数
		int totalPage = 0;
		if(totalCount % limit==0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		// 每页显示的数据的集合
		// 从哪开始
		int begin = (page - 1) * limit;
		List<Product> list = productDao.findByPageCid(cid, begin, limit);
		pageBean.setList(list);
		
		return pageBean;
	}
	
	// 根据二级分类查询商品数量
	public int findCountByCsid(Integer csid) {
		return productDao.findCountByCsid(csid);
	}

	// 根据二级分类查询商品，带分页
	public PageBean<Product> findByPageCsid(Integer csid, int page) {
		PageBean<Product> pageBean = new PageBean<Product>();
		// 设置当前页数
		pageBean.setPage(page);;
		// 设置每页显示记录数
		int limit = 9;
		pageBean.setLimit(limit);
		// 设置总的记录数
		int totalCount = 0;
		totalCount = productDao.findCountByCsid(csid);
		pageBean.setTotalCount(totalCount);
		// 设置总页数
		int totalPage = 0;
		if(totalCount % limit==0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		// 每页显示的数据的集合
		// 从哪开始
		int begin = (page - 1) * limit;
		List<Product> list = productDao.findByPageCsid(csid, begin, limit);
		pageBean.setList(list);
		
		return pageBean;
	}

	// 后台查询所有商品带分页
	public PageBean<Product> findByPage(Integer page) {
		PageBean<Product> pageBean = new PageBean<Product>();
		// 设置当前页数
		pageBean.setPage(page);
		// 设置每页显示记录数
		int limit = 12;
		pageBean.setLimit(limit);
		// 设置总记录数
		int totalCount = 0;
		totalCount = productDao.findCount();
		pageBean.setTotalCount(totalCount);
		// 设置总页数
		int totalPage = 0;
		// Math.ceil(totalCount / limit);
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		// 每页显示的数据集合
		// 从哪开始
		int begin = (page - 1) * limit;
		List<Product> list = productDao.findByPage(begin, limit);
		pageBean.setList(list);
		return pageBean;
	}
	
	// 业务层保存商品方法
	public void save(Product product) {
		productDao.save(product);
	}

	// 业务层删除商品
	public void delete(Product product) {
		productDao.delete(product);
	}

	// 业务层修改商品的方法
	public void update(Product product) {
		productDao.update(product);
	}
}
