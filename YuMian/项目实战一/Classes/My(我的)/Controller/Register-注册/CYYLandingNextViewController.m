//
//  CYYLandingNextViewController.m
//  项目实战一
//
//  Created by ma c on 16/5/3.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "CYYLandingNextViewController.h"
#import "CYYLandingNextView.h"
#import "NetWorkingSingle.h"
#import "SVProgressHUD.h"

@interface CYYLandingNextViewController ()
@property (nonatomic, strong) CYYLandingNextView *nextView;
@end

@implementation CYYLandingNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"验证手机号";
    self.navigationItem.hidesBackButton = YES;
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setBackgroundImage:[UIImage imageNamed:@"ButtonReturn"] forState:UIControlStateNormal];
    backButton.size = backButton.currentBackgroundImage.size;
    [backButton addTarget:self action:@selector(backCLick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    self.edgesForExtendedLayout = 0;
    self.view.backgroundColor = RGB(223, 223, 223);
    [self.view addSubview:self.nextView];
    //添加约束
    [self addLayoutIn];
    
}
- (CYYLandingNextView *)nextView{
    if (!_nextView) {
        _nextView = [[CYYLandingNextView alloc] init];
        [_nextView.referButton addTarget:self action:@selector(requestVerification) forControlEvents:(UIControlEventTouchUpInside)];
        [_nextView.landingButton addTarget:self action:@selector(landingMethod) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _nextView;
}
//添加约束
- (void)addLayoutIn{
    WS(weakSelf);
    [_nextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.height.equalTo(180);
    }];
}

#pragma mark - click 点击事件 methods

- (void)backCLick:(UIButton *)backButton{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)requestVerification{//appMember/createSeekPwdCode.do?Telephone=17721025595
    WS(weakSelf);
    [[NetWorkingSingle sharedManager] postDataWithUrl:@"http://123.57.141.249:8080/beautalk/appMember/createCode.do" parameter:@{@"MemberId":_parameterDic[@"LoginName"]} success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *dic = responseObject;
        if ([dic[@"result"] isEqual:@"success"]) {
            [weakSelf GCDTimeMethod];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

- (void)landingMethod{
   [[NetWorkingSingle sharedManager] getDateWithUrl:@"http://123.57.141.249:8080/beautalk/appMember/appRegistration.do" parameter:[self makeLandingParameter] success:^(NSURLSessionDataTask *task, id responseObject) {
       NSDictionary *dic = responseObject;
       if ([dic[@"result"] isEqual:@"success"]) {
           [SVProgressHUD showSuccessWithStatus:@"注册成功"];
       }
   } failure:^(NSURLSessionDataTask *task, NSError *error) {
       
   }];
}

//短信倒计时
- (void)GCDTimeMethod{
    __block NSInteger timeout= 60;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                self.nextView.referButton.userInteractionEnabled = YES;
                self.nextView.timeLabel.text = @"验证码";
            });
        }else
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                self.nextView.referButton.userInteractionEnabled = NO;
                self.nextView.timeLabel.text = [NSString stringWithFormat:@"%li秒后重试",timeout];
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}
- (NSDictionary *)makeLandingParameter{
    
    return @{@"LoginName":_parameterDic[@"LoginName"],@"Lpassword":_parameterDic[@"Lpassword"],@"Code":_nextView.verificationText.text,@"Telephone":_parameterDic[@"LoginName"]};
}

@end
