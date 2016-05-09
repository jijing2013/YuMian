//
//  CYYDetailBuyView.m
//  项目实战一
//
//  Created by ma c on 16/4/8.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "CYYDetailBuyView.h"

@interface CYYDetailBuyView ()


@end

@implementation CYYDetailBuyView

#pragma mark - setter methods

- (UIButton *)shoppingCart{
    if (!_shoppingCart) {
        _shoppingCart = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shoppingCart setImage:[UIImage imageNamed:@"详情界面购物车按钮"] forState:UIControlStateNormal];
        [_shoppingCart addTarget:self action:@selector(shoppingCartClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shoppingCart;
}

- (UIButton *)addShopping{
    if (!_addShopping) {
        _addShopping = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addShopping setTitle:@"加入购物车" forState:UIControlStateNormal];
        [_addShopping setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _addShopping.backgroundColor = RGB(88, 215, 251);
        _addShopping.layer.masksToBounds = YES;
        _addShopping.layer.cornerRadius = 10;
        [_addShopping addTarget:self action:@selector(addClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addShopping;
}


- (UIButton *)buyButton{
    if (!_buyButton) {
        _buyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_buyButton setTitle:@"立即购买" forState:UIControlStateNormal];
        [_buyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _buyButton.backgroundColor = RGB(66, 181, 244);
        _buyButton.layer.masksToBounds = YES;
        _buyButton.layer.cornerRadius = 10;
        [_buyButton addTarget:self action:@selector(buyClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buyButton;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.shoppingCart];
        [self addSubview:self.addShopping];
        [self addSubview:self.buyButton];
    }
    return self;
}


- (void)layoutSubviews{
    WS(weakSelf);
    [_shoppingCart mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(12);
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.size.equalTo(CGSizeMake(25, 25));
    }];
    
    [_addShopping mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(9);
        make.left.equalTo(weakSelf.shoppingCart.mas_right).offset(30);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-5);
        make.right.equalTo(weakSelf.buyButton.mas_left).offset(-15);
    }];
    
    [_buyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(9);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-5);
        make.width.equalTo(weakSelf.addShopping.mas_width);
    }];
    
}


#pragma mark - 点击事件 methods

- (void)shoppingCartClick:(UIButton *)shoppingCartClick{
    CYYLog(@"%s",__func__);
}

- (void)addClick:(UIButton *)addClick{
    CYYLog(@"%s",__func__);
}

- (void)buyClick:(UIButton *)buyClick{
    CYYLog(@"%s",__func__);
}
@end
