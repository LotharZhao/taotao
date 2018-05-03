package com.zhao.user.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.zhao.user.dao.UserDao;
import com.zhao.user.model.User;
import com.zhao.utils.MailUtils;
import com.zhao.utils.PageBean;
import com.zhao.utils.UUIDUtils;


/**
 * 用户模块的业务层
 * @author zhaoliangtao
 *
 */
@Transactional
public class UserService {
	// 注入UserDao
	private UserDao userDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	// 按email查询是否有该用户
	public User findByEmail(String email) {
		return userDao.findByEmail(email);
	}
	
	// 完成用户注册
	public void save(User user) {
		// 将注册数据存入数据库
		user.setState(0);// 0未激活，1激活
		String code = UUIDUtils.getUUID() + UUIDUtils.getUUID();
		user.setActivationcode(code);
		userDao.save(user);
		// 发送激活邮件
		MailUtils.sendMail(user.getEmail(), code);
	}
	
	// 业务层根据激活码查询用户
	public User findByCode(String code) {
		return userDao.findByCode(code);
	}
	
	// 修改用户的状态的方法
	public void update(User user) {
		userDao.update(user);
	}

	// 用户登录的方法
	public User login(User user) {
		if(userDao.loginByEmail(user)!=null) {
			return userDao.loginByEmail(user);
		}
		if(userDao.loginByUsername(user)!=null) {
			return userDao.loginByUsername(user);
		}
		return null;
	}

	// 按username查询是否有该用户
	public User findByUsername(String username) {
		return userDao.findByUsername(username);
	}

	// 用户查询所有
	public PageBean<User> findByPage(Integer page) {
		PageBean<User> pageBean = new PageBean<User>();
		// 设置当前页数
		pageBean.setPage(page);
		// 设置每页显示记录数
		// 显示5个
		int limit = 5;
		pageBean.setLimit(limit);
		// 设置总记录数
		int totalCount = 0;
		totalCount = userDao.findCount();
		pageBean.setTotalCount(totalCount);
		// 设置总页数
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		// 设置每页显示数据集合
		int begin = (page - 1)*limit;
		List<User> list = userDao.findByPage(begin,limit);
		pageBean.setList(list);
		return pageBean;
	}

	// 根据id查询用户
	public User findByUid(Integer uid) {
		return userDao.findByUid(uid);
	}

	// 删除用户
	public void delete(User user) {
		userDao.delete(user);
	}
}
