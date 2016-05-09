
//
//  CYYLandingView.m
//  项目实战一
//
//  Created by ma c on 16/5/3.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "CYYLandingView.h"

@interface CYYLandingView ()<UITextFieldDelegate>

@property (strong, nonatomic)   UILabel *tostLabel;             /** 提示文字 */
@property (strong, nonatomic)   UILabel *backLabel;              /** 背景 */
@property (strong, nonatomic)   UILabel *lineLabel;              /** 中间线label */
@property (strong, nonatomic)   UITextField *userNameText;              /** 用户名text */
@property (strong, nonatomic)   UITextField *passwordText;              /** 密码text */
@property (strong, nonatomic)   UIButton *loginButton;              /** 登陆按钮 */
@property (strong, nonatomic)   UIButton *landingButton;              /** 注册button */

@end
@implementation CYYLandingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tostLabel];
        [self addSubview:self.backLabel];
        [self addSubview:self.lineLabel];
        [self addSubview:self.userNameText];
        [self addSubview:self.passwordText];
        [self addSubview:self.loginButton];
        [self addSubview:self.landingButton];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    WS(weakSelf);
    
    [_tostLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(10);
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.right.equalTo(weakSelf.mas_right);
        make.height.equalTo(14);
    }];
    
    [_backLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.tostLabel.mas_bottom).offset(10);
        make.left.equalTo(weakSelf.mas_left).offset(-1);
        make.right.equalTo(weakSelf.mas_right).offset(1);
        make.height.equalTo(88);
    }];
    
    [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.backLabel.mas_left).offset(15);
        make.right.equalTo(weakSelf.backLabel.mas_right).offset(-15);
        make.height.equalTo(1);
        make.centerY.equalTo(weakSelf.backLabel.mas_centerY);
    }];
    
    [_userNameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backLabel.mas_top);
        make.left.equalTo(weakSelf.backLabel.mas_left).offset(15);
        make.right.equalTo(weakSelf.backLabel.mas_right).offset(-15);
        make.bottom.equalTo(weakSelf.lineLabel.mas_top);
    }];
    
    [_passwordText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.lineLabel.mas_bottom);
        make.left.equalTo(weakSelf.backLabel.mas_left).offset(15);
        make.right.equalTo(weakSelf.backLabel.mas_right).offset(-15);
        make.bottom.equalTo(weakSelf.backLabel.mas_bottom);
    }];
    
    [_landingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backLabel.mas_bottom).offset(15);
        make.left.equalTo(weakSelf.backLabel.mas_left).offset(15);
        make.right.equalTo(weakSelf.backLabel.mas_right).offset(-15);
        make.height.equalTo(35);
    }];
    
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.landingButton.mas_bottom).offset(20);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.size.equalTo(CGSizeMake(80, 22));
    }];
    
}

- (UILabel *)tostLabel{
    if (!_tostLabel) {
        _tostLabel = [[UILabel alloc]init];
        _tostLabel.text = @"输入手机号码注册新用户";
        _tostLabel.textColor = RGB(78, 78, 78);
        _tostLabel.font = [UIFont systemFontOfSize:14.0];
    }
    return _tostLabel;
}

- (UILabel *)backLabel{
    if (!_backLabel) {
        _backLabel = [[UILabel alloc]init];
        _backLabel.backgroundColor = [UIColor whiteColor];
        _backLabel.layer.borderWidth = 1.0;
        _backLabel.layer.borderColor = RGB(223, 223, 223).CGColor;
    }
    return _backLabel;
}

- (UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = [UIColor blackColor];
    }
    return _lineLabel;
}

- (UITextField *)userNameText{
    if (!_userNameText) {
        _userNameText = [[UITextField alloc]init];
        _userNameText.delegate = self;
        _userNameText.placeholder = @"输入手机号";
        _userNameText.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _userNameText;
}

- (UITextField *)passwordText{
    if (!_passwordText) {
        _passwordText = [[UITextField alloc]init];
        _passwordText.delegate = self;
        _passwordText.secureTextEntry = YES;
        _passwordText.placeholder = @"输入密码";
    }
    return _passwordText;
}


- (UIButton *)loginButton{
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _loginButton.backgroundColor = [UIColor clearColor];
        [_loginButton setTitle:@"去登录" forState:(UIControlStateNormal)];
        [_loginButton setTitleColor:RGB(67, 182, 245) forState:(UIControlStateNormal)];
        
        [_loginButton addTarget:self action:@selector(loginButtonMethod) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _loginButton;
}

- (UIButton *)landingButton{
    if (!_landingButton) {
        _landingButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _landingButton.backgroundColor = RGB(67, 182, 245);
        _landingButton.layer.masksToBounds = YES;
        _landingButton.layer.cornerRadius = 5.0;
        [_landingButton setTitle:@"下 一 步" forState:(UIControlStateNormal)];
        [_landingButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_landingButton addTarget:self action:@selector(landingButtonMethod) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _landingButton;
}

- (void)loginButtonMethod{
    if (_loginBlock) {
        _loginBlock();
    }
}

- (void)landingButtonMethod{
    if (_landingBlock) {
        _landingBlock(@{@"LoginName":_userNameText.text,@"Lpassword":_passwordText.text});
    }
}


@end
