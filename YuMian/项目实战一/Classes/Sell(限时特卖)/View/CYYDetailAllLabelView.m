//
//  CYYDetailAllLabelView.m
//  项目实战一
//
//  Created by ma c on 16/4/8.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "CYYDetailAllLabelView.h"
#import "CYYfindGoodsDetailListModel.h"
#import "NSString+help.h"

@implementation CYYDetailAllLabelView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
- (void)setDetailListModel:(NSArray *)detailListModel{
    _detailListModel = detailListModel;
    
    CGFloat height = [self makeAllLabel:detailListModel];
    if (_labelHeightBlock) {
        _labelHeightBlock(height);
    }
}

- (CGFloat)makeAllLabel:(NSArray *)detailListArray{
    
    CGFloat height  = 10;
    CGFloat valueLabelWidth = SCREEN_WIDTH - 100;
    for (CYYfindGoodsDetailListModel *listModel in detailListArray) {
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, height, 80, 15)];
        titleLabel.text = listModel.Title;
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.textAlignment = NSTextAlignmentLeft;
        titleLabel.textColor = [UIColor blackColor];
        [self addSubview:titleLabel];
        
        UILabel *valueLabel = [[UILabel alloc] init];
        CGFloat valueHeight = [NSString autoHeightWithString:listModel.Value Width:valueLabelWidth Font:[UIFont systemFontOfSize:17]];
        valueLabel.frame = CGRectMake(100, height, valueLabelWidth, valueHeight);
        valueLabel.text = listModel.Value;
        valueLabel.font = [UIFont systemFontOfSize:15];
        valueLabel.textAlignment = NSTextAlignmentLeft;
        valueLabel.textColor = [UIColor blackColor];
        [self addSubview:valueLabel];
        height = height + valueHeight + 15;
    }
    return height;
}

@end
