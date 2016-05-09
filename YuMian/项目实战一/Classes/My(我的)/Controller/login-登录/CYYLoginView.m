//
//  CYYLoginView.m
//  项目实战一
//
//  Created by ma c on 16/4/16.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "CYYLoginView.h"

@interface CYYLoginView ()

@property (nonatomic, strong) UIView *loginbgView;
@property (nonatomic, strong) UIView *textbgView;
@property (nonatomic, strong) UITextField *numberTextField;
@property (nonatomic, strong) UITextField *passTextField;

@property (nonatomic, strong) UIButton *loginButton;

@property (nonatomic, strong) UILabel *lineLabel;

@end

@implementation CYYLoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.loginbgView];
        [self.loginbgView addSubview:self.textbgView];
        [self.textbgView addSubview:self.numberTextField];
        [self.textbgView addSubview:self.lineLabel];
        [self.textbgView addSubview:self.passTextField];
        [self.loginbgView addSubview:self.loginButton];
        
        [self addSubview:self.freeRegisterButton];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    WS(weakSelf);
    [_loginbgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top);
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.height.equalTo(160);
    }];
    
    [_textbgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.loginbgView.mas_top).offset(15);
        make.left.equalTo(weakSelf.loginbgView.mas_left);
        make.right.equalTo(weakSelf.loginbgView.mas_right);
        make.height.equalTo(89);
    }];
    
    [_numberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.textbgView.mas_top);
        make.left.equalTo(weakSelf.textbgView.mas_left).offset(15);
        make.right.equalTo(weakSelf.textbgView.mas_right).offset(-15);
        make.height.equalTo(44);
    }];
    
    [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.numberTextField.mas_bottom);
        make.left.equalTo(weakSelf.textbgView.mas_left).offset(15);
        make.right.equalTo(weakSelf.textbgView.mas_right).offset(-15);
        make.height.equalTo(1);
    }];
    
    [_passTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.lineLabel.mas_bottom);
        make.left.equalTo(weakSelf.textbgView.mas_left).offset(15);
        make.right.equalTo(weakSelf.textbgView.mas_right).offset(-15);
        make.height.equalTo(44);
    }];
    
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.passTextField.mas_bottom).offset(15);
        make.left.equalTo(weakSelf.loginbgView.mas_left).offset(16);
        make.right.equalTo(weakSelf.loginbgView.mas_right).offset(-16);
        make.height.equalTo(35);
    }];
    
    
    [_freeRegisterButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.loginbgView.mas_bottom).offset(15);
        make.right.equalTo(weakSelf.mas_right).offset(-16);
        make.size.equalTo(CGSizeMake(100, 20));
    }];

}
#pragma mark - setter methods
- (UIView *)loginbgView{
    if (!_loginbgView) {
        _loginbgView = [[UIView alloc] init];
        
    }
    return _loginbgView;
}


- (UIView *)textbgView{
    if (!_textbgView) {
        _textbgView = [[UIView alloc] init];
        _textbgView.backgroundColor = [UIColor whiteColor];
    }
    return _textbgView;
}
- (UITextField *)numberTextField{
    if (!_numberTextField) {
        _numberTextField = [[UITextField alloc] init];
        _numberTextField.placeholder = @"请输入手机号";
        _numberTextField.backgroundColor = [UIColor whiteColor];
        _numberTextField.font = [UIFont systemFontOfSize:15];
        _numberTextField.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _numberTextField;
}

- (UITextField *)passTextField{
    if (!_passTextField) {
        _passTextField = [[UITextField alloc] init];
        _passTextField.placeholder = @"请输入密码";
        _passTextField.borderStyle = UITextBorderStyleNone;
        _passTextField.font = [UIFont systemFontOfSize:15];
        _passTextField.backgroundColor = [UIColor whiteColor];
    }
    return _passTextField;
}

- (UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc] init];
        _lineLabel.backgroundColor = RGB(223, 223, 223);
    }
    return _lineLabel;
}

- (UIButton *)loginButton{
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginButton setBackgroundImage:[UIImage imageNamed:@"登录界面登录按钮"] forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(loginButtonMethod) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _loginButton;
}

- (UIButton *)freeRegisterButton{
    if (!_freeRegisterButton) {
        _freeRegisterButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_freeRegisterButton setTitle:@"免费注册" forState:UIControlStateNormal];
        [_freeRegisterButton setTitleColor:RGB(43, 160, 190) forState:UIControlStateNormal];
        [_freeRegisterButton addTarget:self action:@selector(landingButtonMethod) forControlEvents:(UIControlEventTouchUpInside)];
        _freeRegisterButton.contentHorizontalAlignment = NSTextAlignmentRight;
    }
    return _freeRegisterButton;
}


- (void)loginButtonMethod{
    
    if (_loginBlock) {
        _loginBlock(@{@"LoginName":_numberTextField.text,@"Lpassword":_passTextField.text});
    }
}

- (void)landingButtonMethod{
    if (_landingBlock) {
        _landingBlock();
    }
}



@end
