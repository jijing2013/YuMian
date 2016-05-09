//
//  CYYThirdView.m
//  项目实战一
//
//  Created by ma c on 16/4/16.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "CYYThirdView.h"

@interface CYYThirdView ()


//下边半部分

@property (nonatomic, strong) UIView *thirdbgView;
@property (nonatomic, strong) UILabel *firstLoginLabel;
@property (nonatomic, strong) UILabel *lineLeftLabel;
@property (nonatomic, strong) UILabel *lineRightLabel;

@end

@implementation CYYThirdView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.thirdbgView];
        [self.thirdbgView addSubview:self.firstLoginLabel];
        [self.thirdbgView addSubview:self.lineLeftLabel];
        [self.thirdbgView addSubview:self.lineRightLabel];
        [self.thirdbgView addSubview:self.qqButton];
        [self.thirdbgView addSubview:self.weChatButton];
        [self.thirdbgView addSubview:self.weiboButton];

    }
    return self;
}

- (void)layoutSubviews{
    //下边
    WS(weakSelf);
    [_thirdbgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top);
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.height.equalTo(120);
    }];
    
    [_firstLoginLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.thirdbgView.mas_top).offset(5);
        make.centerX.equalTo(weakSelf.thirdbgView.mas_centerX);
        make.size.equalTo(CGSizeMake(80, 18));
    }];
    
    [_lineLeftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.firstLoginLabel.mas_centerY);
        make.left.equalTo(weakSelf.thirdbgView.mas_left).offset(16);
        make.right.equalTo(weakSelf.firstLoginLabel.mas_left).offset(-5);
        make.height.equalTo(1);
    }];
    
    [_lineRightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.firstLoginLabel.mas_centerY);
        make.left.equalTo(weakSelf.firstLoginLabel.mas_right).offset(5);
        make.right.equalTo(weakSelf.thirdbgView.mas_right).offset(-16);
        make.height.equalTo(1);
    }];
    
    [_weChatButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.thirdbgView.mas_centerX);
        make.top.equalTo(weakSelf.firstLoginLabel.mas_bottom).offset(20);
        make.size.equalTo(CGSizeMake(46, 46));
    }];
    
    [_qqButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.weChatButton.mas_top);
        make.left.equalTo(weakSelf.thirdbgView).offset(60);
        make.size.equalTo(CGSizeMake(46, 46));
    }];
    
    [_weiboButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.weChatButton.mas_top);
        make.right.equalTo(weakSelf.thirdbgView).offset(-60);
        make.size.equalTo(CGSizeMake(46, 46));
    }];
}

//third部分

- (UIView *)thirdbgView{
    if (!_thirdbgView) {
        _thirdbgView = [[UIView alloc] init];
        
    }
    return _thirdbgView;
}

- (UILabel *)firstLoginLabel{
    if (!_firstLoginLabel) {
        _firstLoginLabel = [[UILabel alloc] init];
        _firstLoginLabel.text = @"一键登录";
        _firstLoginLabel.textAlignment = NSTextAlignmentCenter;
        _firstLoginLabel.font = [UIFont systemFontOfSize:18];
    }
    return _firstLoginLabel;
}

- (UILabel *)lineLeftLabel{
    if (!_lineLeftLabel) {
        _lineLeftLabel = [[UILabel alloc] init];
        _lineLeftLabel.backgroundColor = RGB(223, 223, 223);
    }
    return _lineLeftLabel;
}

- (UILabel *)lineRightLabel{
    if (!_lineRightLabel) {
        _lineRightLabel = [[UILabel alloc] init];
        _lineRightLabel.backgroundColor = RGB(223, 223, 223);
    }
    return _lineRightLabel;
}

- (UIButton *)qqButton{
    if (!_qqButton) {
        _qqButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_qqButton setBackgroundImage:[UIImage imageNamed:@"登录界面qq登陆"] forState:UIControlStateNormal];
        [_qqButton addTarget:self action:@selector(qqLoginButon:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _qqButton;
}

- (UIButton *)weChatButton{
    if (!_weChatButton) {
        _weChatButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_weChatButton setBackgroundImage:[UIImage imageNamed:@"登录界面微信登录"] forState:UIControlStateNormal];
        [_weChatButton addTarget:self action:@selector(weiChatLoginButon:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _weChatButton;
}

- (UIButton *)weiboButton{
    if (!_weiboButton) {
        _weiboButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_weiboButton setBackgroundImage:[UIImage imageNamed:@"登陆界面微博登录"] forState:UIControlStateNormal];
//        [_weiboButton addTarget:self action:@selector(weiboLoginButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _weiboButton;
}

#pragma mark - click methods
- (void)qqLoginButon:(UIButton *)qqLogin{
    
    CYYLog(@"%s",__func__);
}

- (void)weiChatLoginButon:(UIButton *)weiChatButon{
    CYYLog(@"%s",__func__);
}

- (void)weiboLoginButton:(UIButton *)weiboButton{
    CYYLog(@"%s",__func__);
}


@end
