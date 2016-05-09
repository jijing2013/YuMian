//
//  NSMutableAttributedString+Extension.m
//  项目实战一
//
//  Created by ma c on 16/4/6.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "NSMutableAttributedString+Extension.h"

@implementation NSMutableAttributedString (Extension)

+ (NSMutableAttributedString *)stringThroughAttributeString:(NSString *)frontString backString:(NSString *)backString rebateString:(NSString *)rebateString{
    
    if (rebateString.length == 0) {
        frontString = [NSString stringWithFormat:@"￥%@ ",frontString];
    }
    NSDictionary *dict = @{NSForegroundColorAttributeName:[UIColor redColor], NSFontAttributeName:[UIFont systemFontOfSize:22]};
  
    NSAttributedString *string1 = [[NSAttributedString alloc] initWithString:frontString attributes:dict];
    
    NSDictionary *dict2 = @{NSForegroundColorAttributeName:[UIColor grayColor], NSFontAttributeName:[UIFont systemFontOfSize:16], NSStrikethroughStyleAttributeName:@(2)};
    NSAttributedString *string2 = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",backString] attributes:dict2];
    
    NSMutableAttributedString * string = [[NSMutableAttributedString alloc] init];
    [string insertAttributedString:string1 atIndex:0];
    [string insertAttributedString:string2 atIndex:string1.length];
    
    if (rebateString.length != 0) {
        NSDictionary *dict3 = @{NSForegroundColorAttributeName:[UIColor blackColor], NSFontAttributeName:[UIFont systemFontOfSize:16]};
        NSAttributedString *string3 = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@" (%@折)",rebateString] attributes:dict3];
        [string insertAttributedString:string3 atIndex:string.length];
    }
    return string;
    
}
/** 确认订单的价格*/
+ (NSMutableAttributedString *)makeOrderPriceText:(NSString *)priceStr{
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]init];
    NSDictionary *attributedDic1 = @{NSFontAttributeName:[UIFont systemFontOfSize:13.0],
                                     NSForegroundColorAttributeName:[UIColor blackColor]};
    NSAttributedString *attributed1 = [[NSAttributedString alloc]initWithString:@"合计 : " attributes:attributedDic1];
    
    NSDictionary *attributedDic2 = @{NSFontAttributeName:[UIFont systemFontOfSize:18.0],
                                     NSForegroundColorAttributeName:[UIColor redColor]};
    NSAttributedString *attributed2 = [[NSAttributedString alloc]initWithString:priceStr attributes:attributedDic2];
    [attributedString insertAttributedString:attributed1 atIndex:0];
    [attributedString insertAttributedString:attributed2 atIndex:attributed1.length];
    return attributedString;
}


@end
