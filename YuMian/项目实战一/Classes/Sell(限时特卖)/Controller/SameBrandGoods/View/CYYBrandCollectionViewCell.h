//
//  CYYBrandCollectionViewCell.h
//  项目实战一
//
//  Created by ma c on 16/4/13.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYYBrandCollectionModel.h"

typedef void(^selectedGoodsID)(NSString *goodsID);

@interface CYYBrandCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) CYYBrandCollectionModel *brandDataList;

@property (nonatomic, copy) selectedGoodsID selectedGoods;

@end
