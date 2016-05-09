//
//  CYYPayView.h
//  项目实战一
//
//  Created by ma c on 16/5/4.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^payMoneyBlock)();
@interface CYYPayView : UIView
 /** 支付金额 */
@property (strong, nonatomic)   NSAttributedString *payMoneyString;
/** 支付回调 */
@property (copy, nonatomic)     payMoneyBlock payBlock;
@end
