//
//  LoginViewController.m
//  项目实战一
//
//  Created by ma c on 16/4/15.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "NetWorkingSingle.h"
#import "UMSocial.h"
#import "SVProgressHUD.h"

#import "CYYLoginView.h"
#import "CYYThirdView.h"
@interface LoginViewController ()

@property (nonatomic, strong) CYYLoginView *loginView;
@property (nonatomic, strong) CYYThirdView *thirdView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    self.navigationItem.hidesBackButton = YES;

    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setBackgroundImage:[UIImage imageNamed:@"ButtonReturn"] forState:UIControlStateNormal];
    backButton.size = backButton.currentBackgroundImage.size;
    [backButton addTarget:self action:@selector(backCLick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    [self.view addSubview:self.loginView];
    [self.view addSubview:self.thirdView];

    
    [self addLayout];
    self.view.backgroundColor = RGB(223, 223, 223);
    
}

#pragma mark - setter methods

- (CYYLoginView *)loginView{
    if (!_loginView) {
        _loginView = [[CYYLoginView alloc] init];
        [_loginView.freeRegisterButton addTarget:self action:@selector(registerClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        WS(weakSelf);
        _loginView.loginBlock = ^(NSDictionary *dict){
            [weakSelf loginViewMethod:dict];
        };
    }
    return _loginView;
}

- (CYYThirdView *)thirdView{
    if (!_thirdView) {
        _thirdView = [[CYYThirdView alloc] init];
        [_thirdView.weiboButton addTarget:self action:@selector(weiboLoginButton:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _thirdView;
}

- (void)addLayout{
    WS(weakSelf);
    [_loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.height.equalTo(190);
    }];
    
    [_thirdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.loginView.mas_bottom).offset(60);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.height.equalTo(120);
    }];
    
}


#pragma mark - click 点击事件 methods

- (void)backCLick:(UIButton *)backButton{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)registerClick:(UIButton *)registerbutton{
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:registerVC animated:YES];
    
    
}


- (void)loginViewMethod:(NSDictionary *)dict{
    WS(weakSelf);
    [[NetWorkingSingle sharedManager] getDateWithUrl:@"http://123.57.141.249:8080/beautalk/appMember/appLogin.do" parameter:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *dic = responseObject;
        if ([dic[@"ErrorMessage"] isEqualToString:@"登陆成功"]) {
            [[NSUserDefaults standardUserDefaults] setValue:dic forKey:@"ISLOGIN"];
            self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%@",dic[@"result"]];
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }else{
            [SVProgressHUD showErrorWithStatus:dic[@"ErrorMessage"]];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
}


- (void)qqLoginButon:(UIButton *)qqLogin{
    
    CYYLog(@"%s",__func__);
}

- (void)weiChatLoginButon:(UIButton *)weiChatButon{
    CYYLog(@"%s",__func__);
}

- (void)weiboLoginButton:(UIButton *)weiboButton{
    
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToSina];
            
            NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
            
        }});
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
