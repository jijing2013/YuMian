//
//  CYYBrandCollectionModel.h
//  项目实战一
//
//  Created by ma c on 16/4/13.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYYBrandCollectionModel : NSObject

/*
 RestTime : 还剩355天7时32分,
	CountryImg : http://123.57.141.249:8080/beautalk/localfile/country/6c3374a4-0fe8-eebe-afcf-4a9a7c522cc3.jpeg,
	DomesticPrice : 300,
	CountryName : Korea 韩国原装,
	BuyCount : 400,
	ImgView : http://123.57.141.249:8080/beautalk/localfile/7eb01e23-993d-4f91-9677-b074121338bb/goods/73640c92-3e5c-4aee-9756-e41036dedbac.JPG,
	Alert : 0,
	FormetDate : 还剩<font color=black>355</font>天<font color=black>7</font>时<font color=black>32</font>分,
	GoodsId : 7eb01e23-993d-4f91-9677-b074121338bb,
	ForeignPrice : ￥200,
	Stock : 2000,
	Title : Beyond,
	Abbreviation : 韩国 Beyond X 迪士尼爱丽丝梦游仙境 2016限量保湿气垫bb霜,
	Discount : 0.2,
	GoodsIntro : Beyond 属 LG 旗下护肤品品牌，加上又是有机品牌，敏感型和孕妇都可以使用，是信心之选!~,
	Price : ￥7.0,
	OtherPrice : 海外官网价：￥200 大陆官网价：￥300
 */

@property (nonatomic, copy) NSString *CountryImg;

@property (nonatomic, copy) NSString *DomesticPrice;
@property (nonatomic, copy) NSString *BuyCount;

@property (nonatomic, copy) NSString *Abbreviation;

@property (nonatomic, copy) NSString *ImgView;

@property (nonatomic, copy) NSString *GoodsId;


@end
