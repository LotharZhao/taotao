package com.zhao.advert.dao;

import java.util.List;

import com.zhao.advert.model.Advert;

/**
 * 广告的持久层
 * @author zhaoliangtao
 *
 */
public interface AdvertDao {

	List<Advert> findSmallMain();
	Advert findDig1Main();
	Advert findDig2Main();
	Advert findFlashSale();
}
