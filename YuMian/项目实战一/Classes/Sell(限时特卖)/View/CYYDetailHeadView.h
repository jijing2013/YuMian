//
//  CYYDetailHeadView.h
//  项目实战一
//
//  Created by ma c on 16/4/8.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SXTHeadView.h"

@interface CYYDetailHeadView : UIView

@property (strong, nonatomic)   SXTHeadView *headImage;              /** 头部图片 */
@property (strong, nonatomic)   NSString *haveBuy;              /** 已经购买的人数 */

@end
