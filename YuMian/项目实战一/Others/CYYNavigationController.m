//
//  CYYNavigationController.m
//  项目实战一
//
//  Created by ma c on 16/4/13.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "CYYNavigationController.h"

@interface CYYNavigationController ()

@end

@implementation CYYNavigationController
// nav的设置只需要设置一次即可， 保证只初始化一次
+ (void)initialize {
    // 获取UINavigationBar
    UINavigationBar *navBar = [UINavigationBar appearance];
    // 设置navBar背景图片
    [navBar setBackgroundImage:[UIImage imageNamed:@"nav_backImage"] forBarMetrics:UIBarMetricsDefault];
    //设置nav是否为半透明或者透明
        navBar.translucent = NO;
    // 设置navBar的背景颜色
    //    [navBar setBarTintColor:[UIColor whiteColor]];
    navBar.barTintColor = [UIColor whiteColor];
    // 设置导航栏标题颜色为白色
    [navBar setTitleTextAttributes:@{
                                     NSForegroundColorAttributeName : RGB(0, 0, 0),
                                     NSFontAttributeName : [UIFont boldSystemFontOfSize:20]
                                     }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
