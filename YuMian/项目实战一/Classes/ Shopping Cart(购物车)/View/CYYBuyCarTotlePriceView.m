//
//  CYYBuyCarTotlePriceView.m
//  项目实战一
//
//  Created by ma c on 16/5/4.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "CYYBuyCarTotlePriceView.h"

@interface CYYBuyCarTotlePriceView ()
/** 合计label */
@property (strong, nonatomic)   UILabel *totalLabel;
/** 邮寄方式 */
@property (strong, nonatomic)   UILabel *mailLabel;
@end
@implementation CYYBuyCarTotlePriceView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.totalLabel];
        [self addSubview:self.priceLabel];
        [self addSubview:self.mailLabel];
        [self addSubview:self.closingCostBtn];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    WS(weakSelf);
    
    [_totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(10);
        make.left.equalTo(weakSelf.mas_left).offset(7);
        make.size.equalTo(CGSizeMake(40, 15));
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.totalLabel.mas_right).offset(7);
        make.bottom.equalTo(weakSelf.totalLabel.mas_bottom);
        make.right.equalTo(weakSelf.closingCostBtn.mas_left).offset(-30);
        make.height.equalTo(16);
    }];
    
    [_mailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.priceLabel.mas_left);
        make.top.equalTo(weakSelf.priceLabel.mas_bottom).offset(7);
        make.height.equalTo(16);
        make.right.equalTo(weakSelf.priceLabel.mas_right);
    }];
    
    [_closingCostBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.size.equalTo(CGSizeMake(110, 35));
    }];
    
    
}

- (UILabel *)totalLabel{
    if (!_totalLabel) {
        _totalLabel = [[UILabel alloc]init];
        _totalLabel.text = @"合计: ";
        _totalLabel.textAlignment = NSTextAlignmentRight;
        _totalLabel.font = [UIFont systemFontOfSize:15.0];
    }
    return _totalLabel;
}

- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.textColor = RGB(238, 75, 47);
        _priceLabel.textAlignment = NSTextAlignmentLeft;
        _priceLabel.font = [UIFont systemFontOfSize:20.0];
    }
    return _priceLabel;
}

- (UILabel *)mailLabel{
    if (!_mailLabel) {
        _mailLabel = [[UILabel alloc]init];
        _mailLabel.text = @"（全场包邮）";
        _mailLabel.textAlignment = NSTextAlignmentLeft;
        _mailLabel.textColor = [UIColor grayColor];
        _mailLabel.font = [UIFont systemFontOfSize:14.0];
    }
    return _mailLabel;
}

- (UIButton *)closingCostBtn{
    if (!_closingCostBtn) {
        _closingCostBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_closingCostBtn setTitle:@"去结算" forState:(UIControlStateNormal)];
        [_closingCostBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        _closingCostBtn.backgroundColor = RGB(88, 215, 251);
        _closingCostBtn.layer.masksToBounds = YES;
        _closingCostBtn.layer.cornerRadius = 10;
    }
    return _closingCostBtn;
}


@end
