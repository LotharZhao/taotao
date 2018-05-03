package com.zhao.user.dao;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.zhao.user.model.User;
import com.zhao.utils.PageHibernateCallback;
/**
 * 用户模块持久层的实现类
 * @author zhaoliangtao
 *
 */
public class UserDaoImpl extends HibernateDaoSupport implements UserDao {

	public User findByEmail(String email) {
		String hql = "from User where email=?";
		List<User> list = (List<User>) this.getHibernateTemplate().find(hql, email);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public void save(User user) {
		if(findByEmail(user.getEmail()) == null){
			this.getHibernateTemplate().save(user);
		}
	}

	public User findByCode(String code) {
		String hql = "from User where activationcode = ?";
		List<User> list = (List<User>) this.getHibernateTemplate().find(hql, code);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
	
	public void update(User user) {
		this.getHibernateTemplate().update(user);
	}

	public User loginByEmail(User user) {
		String hql = "from User where email = ? and password = ? and state = ?";
		// 因为form输入的名字为username，所以user得到的时username，没有email
		List<User> list = (List<User>) this.getHibernateTemplate().find(hql, user.getUsername(), user.getPassword(), 1);
		if (list != null && list.size() > 0) {
			return list.get(0);
		} else
			return null;
	}
	public User loginByUsername(User user) {
		String hql = "from User where username = ? and password = ? and state = ?";
		List<User> list = (List<User>) this.getHibernateTemplate().find(hql, user.getUsername(), user.getPassword(), 1);
		if (list != null && list.size() > 0) {
			return list.get(0);
		} else
			return null;
	}

	@Override
	public User findByUsername(String username) {
		String hql = "from User where username=?";
		List<User> list = (List<User>) this.getHibernateTemplate().find(hql, username);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public int findCount() {
		String hql = "select count(*) from User";
		List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	@Override
	public List<User> findByPage(int begin, int limit) {
		String hql = "from User";
		List<User> list = this.getHibernateTemplate().execute(new PageHibernateCallback<User>(hql, null, begin, limit));
		return list;
	}

	@Override
	public User findByUid(Integer uid) {
		return this.getHibernateTemplate().get(User.class, uid);
	}

	@Override
	public void delete(User user) {
		this.getHibernateTemplate().delete(user);
	}
}
