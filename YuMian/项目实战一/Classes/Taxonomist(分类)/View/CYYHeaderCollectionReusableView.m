//
//  CYYHeaderCollectionReusableView.m
//  项目实战一
//
//  Created by ma c on 16/5/5.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "CYYHeaderCollectionReusableView.h"

@interface CYYHeaderCollectionReusableView ()
/** 标题*/
@property (strong, nonatomic)   UILabel *titleLabel;
@end
@implementation CYYHeaderCollectionReusableView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)setTitleLabelText:(NSString *)titleLabelText{
    _titleLabel.text = titleLabelText;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof(self) weakSelf = self;
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(0, 15, 0, 0));
    }];
    
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:13.0];
        _titleLabel.textColor = [UIColor blackColor];
        
    }
    return _titleLabel;
}

@end
