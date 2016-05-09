//
//  CYYLandingView.h
//  项目实战一
//
//  Created by ma c on 16/5/3.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^loginBlock)();
typedef void(^landingBlock)(NSDictionary *dict);
@interface CYYLandingView : UIView

/**登陆block*/
@property (copy, nonatomic) loginBlock loginBlock;
/**注册block*/
@property (copy, nonatomic) landingBlock landingBlock;
@end
