package com.zhao.advert.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.zhao.advert.model.Advert;

/**
 * 广告持久层的实现类
 * @author zhaoliangtao
 *
 */
public class AdvertDaoImpl extends HibernateDaoSupport implements AdvertDao {

	@Override
	public List<Advert> findSmallMain() {
		// 使用离线条件查询
		DetachedCriteria criteria = DetachedCriteria.forClass(Advert.class);
		// 条件adtype=1
		criteria.add(Restrictions.eq("adtype", 1));
		List<Advert> list = (List<Advert>) this.getHibernateTemplate().findByCriteria(criteria, 0, 10);
		return list;
	}

	@Override
	public Advert findDig1Main() {
		DetachedCriteria criteria = DetachedCriteria.forClass(Advert.class);
		criteria.add(Restrictions.eq("adtype", 21));
		List<Advert> list = (List<Advert>) this.getHibernateTemplate().findByCriteria(criteria, 0, 2);

		return list.get(0);
	}
	
	@Override
	public Advert findDig2Main() {
		DetachedCriteria criteria = DetachedCriteria.forClass(Advert.class);
		criteria.add(Restrictions.eq("adtype", 22));
		List<Advert> list = (List<Advert>) this.getHibernateTemplate().findByCriteria(criteria, 0, 1);

		return list.get(0);
	}

	@Override
	public Advert findFlashSale() {
		DetachedCriteria criteria = DetachedCriteria.forClass(Advert.class);
		criteria.add(Restrictions.eq("adtype", 3));
		List<Advert> list = (List<Advert>) this.getHibernateTemplate().findByCriteria(criteria, 0, 1);

		return list.get(0);
	}
}
