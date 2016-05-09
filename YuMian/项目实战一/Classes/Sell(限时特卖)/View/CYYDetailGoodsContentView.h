//
//  CYYDetailGoodsContentView.h
//  项目实战一
//
//  Created by ma c on 16/4/8.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYYfindGoodsDetailModel.h"

typedef void(^Height)(CGFloat height);

//传值GoodsId
typedef void(^ShopId)(NSString *ShopId);

@interface CYYDetailGoodsContentView : UIView
//添加内容
@property (nonatomic, strong) CYYfindGoodsDetailModel *goodsDetailModel;
//同类品牌按钮
@property (nonatomic, strong) UIButton *brandButton;
//返回高度
@property (nonatomic, copy) Height heightBlock;

@property (nonatomic, copy) ShopId ShopIdBlock;

@end
