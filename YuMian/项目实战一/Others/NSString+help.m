//
//  NSString+help.m
//  项目实战一
//
//  Created by ma c on 16/4/12.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "NSString+help.h"

@implementation NSString (help)

#pragma mark 一串字符在固定宽度下，正常显示所需要的高度 method
+ (CGFloat)autoHeightWithString:(NSString *)string Width:(CGFloat)width Font:(UIFont *)font{
    //大小
    CGSize boundRectSize = CGSizeMake(width, MAXFLOAT);
    //绘制属性
    NSDictionary *fontDict = @{NSFontAttributeName:font};
    //调用方法得到高度
    CGFloat newFloat = [string boundingRectWithSize:boundRectSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:fontDict context:nil].size.height;
    
    return newFloat;
}

@end
