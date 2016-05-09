//
//  DockItem.m
//  仿美团
//
//  Created by ma c on 16/3/5.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "DockItem.h"


static CGFloat kImageScale = 0.64;
@implementation DockItem
//初始化
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        self.imageView.contentMode = UIViewContentModeBottom;
    }
    return self;
}
//设置imageContent
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat pointX = 0;
    CGFloat pointY = 0;
    CGFloat width = contentRect.size.width;
    CGFloat height = contentRect.size.height * kImageScale;
    
    return CGRectMake(pointX, pointY, width, height);
}
//设置titleContent
- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat pointX = 0;
    CGFloat pointY = contentRect.size.height * kImageScale;
    CGFloat width = contentRect.size.width;
    CGFloat height = contentRect.size.height * (1 - kImageScale);
    
    return CGRectMake(pointX, pointY, width, height);
}


@end
