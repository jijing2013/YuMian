//
//  CYYPayView.m
//  项目实战一
//
//  Created by ma c on 16/5/4.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "CYYPayView.h"

@interface CYYPayView ()
/** 价格 */
@property (strong, nonatomic)   UILabel *priceLabel;
 /** 支付按钮 */
@property (strong, nonatomic)   UIButton *payButton;
@end

@implementation CYYPayView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.priceLabel];
        [self addSubview:self.payButton];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    WS(weakSelf);
    [_payButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(110, 35));
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.payButton.mas_left).offset(-15);
        make.left.equalTo(weakSelf.mas_left);
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
}

- (void)setPayMoneyString:(NSAttributedString *)payMoneyString{
    _priceLabel.attributedText = payMoneyString;
}

- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.textAlignment = NSTextAlignmentRight;
    }
    return _priceLabel;
}

- (UIButton *)payButton{
    if (!_payButton) {
        _payButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_payButton setTitle:@"立即支付" forState:(UIControlStateNormal)];
        [_payButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        _payButton.backgroundColor = RGB(67, 182, 245);
        _payButton.layer.masksToBounds = YES;
        _payButton.layer.cornerRadius = 5.0;
        [_payButton addTarget:self action:@selector(payButtonMethod) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _payButton;
}

- (void)payButtonMethod{
    if (_payBlock) {
        _payBlock();
    }
}


@end
