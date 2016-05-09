//
//  NSMutableAttributedString+Extension.h
//  项目实战一
//
//  Created by ma c on 16/4/6.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (Extension)

/**制作一个带删除线的字符串*/
+ (NSMutableAttributedString *)stringThroughAttributeString:(NSString *)frontString backString:(NSString *)backString rebateString:(NSString *)rebateString;
/**制作确认订单的价格*/
+ (NSMutableAttributedString *)makeOrderPriceText:(NSString *)priceStr;
@end
