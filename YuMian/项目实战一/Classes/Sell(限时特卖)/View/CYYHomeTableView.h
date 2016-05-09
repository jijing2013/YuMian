//
//  CYYHomeTableView.h
//  项目实战一
//
//  Created by ma c on 16/4/6.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^singleBlock)(NSString *GoodsId);
typedef void(^groupBlock)(NSString *ActivityId);

@interface CYYHomeTableView : UITableView

/**
 存放单品团列表数据的数组
 */
@property (strong, nonatomic) NSArray *singleListArray;

/**
 存放品牌团列表数据的数组
 */
@property (strong, nonatomic) NSArray *groupBuyListArray;

/**
 告诉tableview展示单品团列表还是品牌团列表，yes为单品团列表，no为品牌团
 */
@property (assign, nonatomic) BOOL isSingle;

@property (nonatomic, copy) singleBlock selectSingle;
@property (nonatomic, copy) groupBlock selectGroup;

@end
