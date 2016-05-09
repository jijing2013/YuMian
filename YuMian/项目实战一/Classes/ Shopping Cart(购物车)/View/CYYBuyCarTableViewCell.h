//
//  CYYBuyCarTableViewCell.h
//  项目实战一
//
//  Created by ma c on 16/5/4.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CYYBuyCarModel;
@interface CYYBuyCarTableViewCell : UITableViewCell
/**购物车数据*/
@property (nonatomic, strong) CYYBuyCarModel *buyCarModel;
/**购物数量*/
@property (nonatomic, strong) UILabel *countLabel;
/**选择按钮*/
@property (nonatomic, strong) UIButton *selectButton;
/**增加数量*/
@property (nonatomic, strong) UIButton *addButton;
/**减少数量*/
@property (nonatomic, strong) UIButton *cutButton;

@end
