//
//  CYYDetailAllImageView.m
//  项目实战一
//
//  Created by ma c on 16/4/8.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "CYYDetailAllImageView.h"
#import "CYYfindGoodsImgListModel.h"

@implementation CYYDetailAllImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setImageArray:(NSArray *)imageArray{
    _imageArray = imageArray;
    if (_imageBlock) {
        _imageBlock([self makeAllDetailImage:imageArray]);
    }
}

- (CGFloat)makeAllDetailImage:(NSArray *)imageArray{
    float height = 0;
    for (CYYfindGoodsImgListModel *imageModel in imageArray) {
        if ([imageModel.ImgType isEqual:@"1"]) {
            NSArray *sizeArray = [imageModel.Resolution componentsSeparatedByString:@"*"];
            CGFloat imageHeight = [sizeArray[1] floatValue] * SCREEN_WIDTH / [sizeArray[0] floatValue];
            UIImageView *detailImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, height, SCREEN_WIDTH, imageHeight)];
            [detailImage downloadImage:imageModel.ImgView place:[UIImage imageNamed:@"default"]];
            [self addSubview:detailImage];
            height += imageHeight;
        }
    }
    return height;
}

@end
