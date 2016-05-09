//
//  CYYLandingNextView.h
//  项目实战一
//
//  Created by ma c on 16/5/3.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYYLandingNextView : UIView
/** 重新发送验证码按钮 */
@property (strong, nonatomic)   UIButton *referButton;
/** 计时label */
@property (strong, nonatomic)   UILabel *timeLabel;
/** 注册按钮 */
@property (strong, nonatomic)   UIButton *landingButton;
/** 验证码输入框 */
@property (strong, nonatomic)   UITextField *verificationText;
@end
