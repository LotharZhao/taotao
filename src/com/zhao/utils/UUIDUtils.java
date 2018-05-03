package com.zhao.utils;

import java.util.UUID;

import com.mysql.fabric.xmlrpc.base.Data;

/**
 * 生成随机激活码
 * @author zhaoliangtao
 *
 */
public class UUIDUtils {

	public static String getUUID() {
		return UUID.randomUUID().toString().replace("-", "");
	}
}
