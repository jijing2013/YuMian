//
//  GroupModel.h
//  项目实战一
//
//  Created by ma c on 16/4/6.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupModel : NSObject
/*
 活动ID ： ActivityId
 图片地址 ： ImgView
 是否有中间页：IfMiddlePage
 品牌LOGO图片地址 ： LogoImg
 品牌名称 ： ShopTitle
 活动简介 ：Content
 活动时间（距离结束时间） ：ActivityDate
 */

/**活动ID*/
@property (copy, nonatomic) NSString *ActivityId;

/**图片地址*/
@property (copy, nonatomic) NSString *ImgView;

/**品牌名称*/
@property (copy, nonatomic) NSString *ShopTitle;

/**品牌简介*/
@property (copy, nonatomic) NSString *Content;

@end
