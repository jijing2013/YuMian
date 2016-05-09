//
//  CYYTypeViewController.m
//  项目实战一
//
//  Created by ma c on 16/5/5.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "CYYTypeViewController.h"
#import "NetWorkingSingle.h"

@interface CYYTypeViewController ()

@end

@implementation CYYTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadData];
}

- (void)loadData{
    
    NSDictionary *param = @{@"TypeId":self.paramer};
    NSLog(@"%@",self.paramer);
    [[NetWorkingSingle sharedManager] getDateWithUrl:@"http://123.57.141.249:8080/beautalk/classifyApp/appTypeGoodsList.do" parameter:param success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
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
