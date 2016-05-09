//
//  CYYButton.m
//  项目实战一
//
//  Created by ma c on 16/4/6.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "CYYButton.h"

@implementation CYYButton

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.singleButton];
        [self addSubview:self.groupButton];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)layoutSubviews{
    WS(weakSelf);
    [_singleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top);
        make.left.equalTo(weakSelf.mas_left);
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.width.equalTo(SCREEN_WIDTH / 2);
    }];
    
    [_groupButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top);
        make.right.equalTo(weakSelf.mas_right);
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.width.equalTo(SCREEN_WIDTH / 2);

    }];
    
}
- (UIButton *)singleButton{
    if (!_singleButton) {
        _singleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_singleButton setImage:[UIImage imageNamed:@"新品团未选中"] forState:UIControlStateNormal];
        [_singleButton setImage:[UIImage imageNamed:@"新品团选中"] forState:UIControlStateSelected];
        
        [_singleButton setImageEdgeInsets:UIEdgeInsetsMake(0, -40, 0, 0)];
     
        [_singleButton setTitle:@"新品团购" forState:UIControlStateNormal];
        [_singleButton setTitleColor:RGB(67, 182, 241) forState:(UIControlStateNormal)];
        [_singleButton setTitleColor:RGB(239, 101, 48) forState:(UIControlStateSelected)];
        _singleButton.selected = YES;
    }
    return _singleButton;
}

- (UIButton *)groupButton{
    if (!_groupButton) {
        _groupButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_groupButton setImage:[UIImage imageNamed:@"品牌团未选中"] forState:UIControlStateNormal];
        [_groupButton setImage:[UIImage imageNamed:@"品牌团选中"] forState:UIControlStateSelected];
        
        [_groupButton setImageEdgeInsets:UIEdgeInsetsMake(0, -40, 0, 0)];
        
        [_groupButton setTitle:@"品牌团购" forState:UIControlStateNormal];
        [_groupButton setTitleColor:RGB(67, 182, 241) forState:(UIControlStateNormal)];
        [_groupButton setTitleColor:RGB(239, 101, 48) forState:(UIControlStateSelected)];
       
    }
    return _groupButton;
}

@end
