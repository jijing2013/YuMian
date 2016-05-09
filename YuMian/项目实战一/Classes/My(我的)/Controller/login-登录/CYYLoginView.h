//
//  CYYLoginView.h
//  项目实战一
//
//  Created by ma c on 16/4/16.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^loginBlock)(NSDictionary *dict);
typedef void(^landingBlock)();

@interface CYYLoginView : UIView

@property (nonatomic, strong) UIButton *freeRegisterButton;

/**登陆block*/
@property (copy, nonatomic) loginBlock loginBlock;
/**去注册block*/
@property (copy, nonatomic) landingBlock landingBlock;

@end
