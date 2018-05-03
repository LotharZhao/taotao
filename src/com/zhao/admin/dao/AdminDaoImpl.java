package com.zhao.admin.dao;

import java.util.List;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import com.zhao.admin.model.Admin;

/**
 * 管理员模块持久层的实现类
 * @author zhaoliangtao
 *
 */
public class AdminDaoImpl extends HibernateDaoSupport implements AdminDao {

	public Admin login(Admin admin) {
		String hql = "from Admin where username = ? and password = ?";
		List<Admin> list = (List<Admin>) this.getHibernateTemplate().find(hql, admin.getUsername(), admin.getPassword());
		if(list != null && list.size()>0){
			return list.get(0);
		}
		return null;
	}
}
