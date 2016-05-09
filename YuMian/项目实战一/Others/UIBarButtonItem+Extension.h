//
//  UIBarButtonItem+Extension.h
//  项目实战一
//
//  Created by ma c on 16/4/7.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (instancetype)itemWithImage:(NSString *)image hightImage:(NSString *)hightImage target:(id)target action:(SEL)action;

@end
