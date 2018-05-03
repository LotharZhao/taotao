package com.zhao.category.dao;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.zhao.category.model.Category;

/**
 * 一级分类持久层的实现类
 * @author zhaoliangtao
 *
 */
public class CategoryDaoImpl extends HibernateDaoSupport implements CategoryDao {

	@Override
	public List<Category> findAll() {
		String hql = "from Category";
		List<Category> list = (List<Category>) this.getHibernateTemplate().find(hql);
		return list;
	}

	@Override
	public void save(Category category) {
		this.getHibernateTemplate().save(category);
	}

	@Override
	public Category findByCid(Integer cid) {
		return this.getHibernateTemplate().get(Category.class, cid);
	}

	@Override
	public void delete(Category category) {
		this.getHibernateTemplate().delete(category);
	}

	@Override
	public void update(Category category) {
		this.getHibernateTemplate().update(category);
	}

}
