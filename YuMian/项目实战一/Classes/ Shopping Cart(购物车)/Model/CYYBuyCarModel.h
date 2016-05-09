//
//  CYYBuyCarModel.h
//  项目实战一
//
//  Created by ma c on 16/5/4.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYYBuyCarModel : NSObject
/**商品ID*/
@property (nonatomic, copy) NSString *GoodsId;
/**商品缩略图*/
@property (nonatomic, copy) NSString *ImgView;
/**商品标题*/
@property (nonatomic, copy) NSString *GoodsTitle;
/**商品数量*/
@property (nonatomic, assign) NSInteger GoodsCount;
/**国旗图标*/
@property (nonatomic, copy) NSString *Country;
/**价格*/
@property (nonatomic, assign) CGFloat Price;
/**购物车记录*/
@property (nonatomic, copy) NSString *UUID;

/**是否选中*/
@property (assign, nonatomic) BOOL isSelectButton;

@end
