package com.zhao.user.dao;

import java.util.List;

import com.zhao.user.model.User;

/**
 * 用户模块持久层
 * @author zhaoliangtao
 *
 */
public interface UserDao {
	// 按email查询是否有该用户
	public User findByEmail(String email);
	// 将注册数据存入数据库
	public void save(User user);
	// 根据激活码查询用户
	public User findByCode(String code);
	// 修改用户的状态
	public void update(User user);
	// 用户登录的方法
	public User loginByEmail(User user);
	public User loginByUsername(User user);
	// 按username查询是否有该用户
	public User findByUsername(String username);
	public int findCount();
	public List<User> findByPage(int begin, int limit);
	public User findByUid(Integer uid);
	public void delete(User user);
}
