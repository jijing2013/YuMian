//
//  CYYBuyCarTableView.h
//  项目实战一
//
//  Created by ma c on 16/5/4.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^dataArrayBlock)(NSMutableArray *array);
@interface CYYBuyCarTableView : UITableView

/** 存储数据的数组 */
@property (nonatomic, strong) NSMutableArray *dataArray;

/** 返回数据的Block*/
@property (nonatomic, copy) dataArrayBlock dataArrayBlock;

@end
