//
//  CYYfindGoodsDetailModel.h
//  项目实战一
//
//  Created by ma c on 16/4/8.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYYfindGoodsDetailModel : NSObject
/**
 折扣价格：    Price
 原价：        OriginalPrice
 活动剩余时间：ActivityTime
 购买人数：    BuyCount
 活动名称：    ActivityName
 折扣：        Discount
 简介：        GoodsIntro
 评分：        Score
 好评率：	  FavorableRate
 
    ShareTitle : Beyond,
	GoodsIntro : Beyond 属 LG 旗下护肤品品牌，加上又是有机品牌，敏感型和孕妇都可以使用，是信心之选!~,
	ShareImage : http://123.57.141.249:8080/beautalk/localfile/7eb01e23-993d-4f91-9677-b074121338bb/goods/73640c92-3e5c-4aee-9756-e41036dedbac.JPG,
	ShopId : 147a95c0-b1db-426c-b3e4-715fe4da5631,
	GoodsTitle : Beyond,
	ShopImage : http://123.57.141.249:8080/beautalk/localfile/147a95c0-b1db-426c-b3e4-715fe4da5631/73d07721-7ed4-4b95-b05d-a69c6211da3e.JPG,
	ActivityTime : 还剩356天19时51分,
	OverseasPrice : ￥200,
	DomesticPrice : 300,
	ShareContent : Beyond 属 LG 旗下护肤品品牌，加上又是有机品牌，敏感型和孕妇都可以使用，是信心之选!~,
	Score : 5.0,
	Stock : 2000,
	ActivityName : <null>,
	CountryName : 韩国,
	BrandCNName : LG生活健康,
	Notice : 0,
	FavorableRate : 100%,
	BuyCount : 400人已购买,
	OriginalPrice : ￥300,
	Discount : 0.2,
	Reputation : 0,
	isCollected : NO,
	GoodsId : 7eb01e23-993d-4f91-9677-b074121338bb,
	Price : ￥7.0,
	HtmUrl : http://app.meihuishuo.com:8080/beautalk/goods/share.do?GoodsId=7eb01e23-993d-4f91-9677-b074121338bb,
	Abbreviation : 韩国 Beyond X 迪士尼爱丽丝梦游仙境 2016限量保湿气垫bb霜

 */

/** 折扣价格 */
@property (nonatomic, copy) NSString *GoodsTitle;
@property (nonatomic, copy) NSString *Abbreviation;

@property (nonatomic, copy) NSString *Price;
@property (nonatomic, copy) NSString *OriginalPrice;
@property (nonatomic, copy) NSString *Discount;

@property (nonatomic, copy) NSString *GoodsIntro;

@property (nonatomic, copy) NSString *ShopImage;
@property (nonatomic, copy) NSString *CountryName;
@property (nonatomic, copy) NSString *BrandCNName;

@property (nonatomic, copy) NSString *ActivityTime;
@property (nonatomic, copy) NSString *BuyCount;
@property (nonatomic, copy) NSString *ActivityName;


@property (nonatomic, copy) NSString *Score;
@property (nonatomic, copy) NSString *FavorableRate;

@property (nonatomic, copy) NSString *ShopId;

@property (nonatomic, copy) NSString *GoodsId;
@end
