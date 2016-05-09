//
//  BaseTabBarController.m
//  仿美团
//
//  Created by ma c on 16/3/5.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "BaseTabBarController.h"
#import "TabbarSet.h"
#import "CYYNavigationController.h"


@interface BaseTabBarController()<TabbarSetDelegate>

@property (strong, nonatomic)  TabbarSet *customBar;

@end
@implementation BaseTabBarController

- (TabbarSet *)customBar{
    if (!_customBar) {
        _customBar = [[TabbarSet alloc] initWithFrame:self.tabBar.bounds];
        _customBar.delegate = self;
    }
    return _customBar;
}

#pragma mark - TabbarSetDelegate methods

- (void)tabbar:(TabbarSet *)tabbar selectedAtIndex:(DockItemType)type{
    self.selectedIndex = type;
}

#pragma mark - private methods

- (void)configController{
    NSMutableArray *viewControllers = [NSMutableArray arrayWithArray:@[@"Sell",@"Taxonomist",@"Shopping",@"My"]];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"TabbarList" ofType:@"plist"];
    NSArray *plistArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *titles = [NSMutableArray array];
    for (NSDictionary *dict in plistArray) {
        [titles addObject:dict[@"title"]];
    }
    for (NSInteger i = 0; i < viewControllers.count; i++) {
        NSString *vcName = [viewControllers[i] stringByAppendingString:@"ViewController"];
        UIViewController *vc = [[NSClassFromString(vcName) alloc] init];
        vc.title = titles[i];
         CYYNavigationController*nav = [[CYYNavigationController alloc] initWithRootViewController:vc];
//        nav.navigationBar.translucent = NO;

        [viewControllers replaceObjectAtIndex:i withObject:nav];
    }
    self.viewControllers = viewControllers;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.设置子控制器
    [self configController];
    //2.自定义tabbar
    [self.tabBar addSubview:self.customBar];
}







@end
