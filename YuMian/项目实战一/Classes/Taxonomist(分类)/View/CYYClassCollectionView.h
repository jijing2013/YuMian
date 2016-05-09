//
//  CYYClassCollectionView.h
//  项目实战一
//
//  Created by ma c on 16/5/5.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^effectBlock)(NSString *GoodsType);
typedef void(^recommendBlock)(NSString *ShopId);
typedef void(^classicBlock)(NSString *ShopId);

@interface CYYClassCollectionView : UICollectionView
/** 经典 */
@property (strong, nonatomic)   NSArray *classicClassArray;
/** 推荐 */
@property (strong, nonatomic)   NSArray *recommendClassArray;
/** 功效 */
@property (strong, nonatomic)   NSArray *effectArray;

/**功效块*/
@property (nonatomic, copy) effectBlock effectBlock;
/**推荐块*/
@property (nonatomic, copy) recommendBlock recommendBlock;
/**经典块*/
@property (nonatomic, copy) classicBlock classicBlock;

@end
