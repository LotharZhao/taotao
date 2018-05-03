package com.zhao.advert.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.zhao.advert.dao.AdvertDao;
import com.zhao.advert.model.Advert;

/**
 * 广告的业务层
 * @author zhaoliangtao
 *
 */
@Transactional
public class AdvertService {

	private AdvertDao advertDao;
	public void setAdvertDao(AdvertDao advertDao) {
		this.advertDao = advertDao;
	}
	
	// 查询主广告
	public List<Advert> findSmallMain() {
		return advertDao.findSmallMain();
	}

	public Advert findDig1Main() {
		return advertDao.findDig1Main();
	}
	
	public Advert findDig2Main() {
		return advertDao.findDig2Main();
	}

	// 查询限时抢购
	public Advert findFlashSale() {
		return advertDao.findFlashSale();
	}
}
