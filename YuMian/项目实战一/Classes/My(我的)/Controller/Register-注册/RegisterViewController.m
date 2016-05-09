//
//  RegisterViewController.m
//  项目实战一
//
//  Created by ma c on 16/4/15.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "RegisterViewController.h"
#import "CYYLandingView.h"
#import "CYYThirdView.h"
#import "LoginViewController.h"
#import "CYYLandingNextViewController.h"

@interface RegisterViewController ()<UITextFieldDelegate>

/**注册view*/
@property (nonatomic, strong) CYYLandingView *landView;
/**三方view*/
@property (nonatomic, strong) CYYThirdView *thirdView;

@end

@implementation RegisterViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"注册";
    self.navigationItem.hidesBackButton = YES;
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setBackgroundImage:[UIImage imageNamed:@"ButtonReturn"] forState:UIControlStateNormal];
    backButton.size = backButton.currentBackgroundImage.size;
    [backButton addTarget:self action:@selector(backCLick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    self.edgesForExtendedLayout = 0;
    self.view.backgroundColor = RGB(223, 223, 223);
    [self.view addSubview:self.landView];
    [self.view addSubview:self.thirdView];
    [self addLayoutIn];
}

- (CYYLandingView *)landView{
    if (!_landView) {
        _landView = [[CYYLandingView alloc] init];
        WS(weakSelf);
        _landView.landingBlock = ^(NSDictionary *dict){
            [weakSelf pushToNextView:dict];
        };
        _landView.loginBlock = ^(){
            [weakSelf pushToLoginView];
        };
    }
    return _landView;
}
- (CYYThirdView *)thirdView{
    if (!_thirdView) {
        _thirdView = [[CYYThirdView alloc] init];
    }
    return _thirdView;
}
- (void)addLayoutIn{
    WS(weakSelf);
    [_landView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).offset(15);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.height.equalTo(215);
    }];
    
    [_thirdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.landView.mas_bottom).offset(20);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.height.equalTo(85);
    }];
}

#pragma mark - click 点击事件 methods

- (void)backCLick:(UIButton *)backButton{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)pushToNextView:(NSDictionary *)dict{
    CYYLandingNextViewController *landNetx = [[CYYLandingNextViewController alloc] init];
    landNetx.parameterDic = dict;
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:landNetx animated:YES];
}
- (void)pushToLoginView{
    LoginViewController *login = [[LoginViewController alloc] init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:login animated:YES];
}
@end
