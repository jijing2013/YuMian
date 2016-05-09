//
//  CYYSearchViewController.m
//  项目实战一
//
//  Created by ma c on 16/4/14.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "CYYSearchViewController.h"
#import "SameBrandViewController.h"


@interface CYYSearchViewController ()<UISearchBarDelegate>
//搜索
@property (nonatomic, strong) UISearchBar *goodsSearch;

@end

@implementation CYYSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(223, 223, 223);
    self.navigationItem.titleView = self.goodsSearch;
}

- (UISearchBar *)goodsSearch{
    if (!_goodsSearch) {
        _goodsSearch = [[UISearchBar alloc] init];
        _goodsSearch.frame = CGRectMake(0, 0, SCREEN_WIDTH, 40);
        _goodsSearch.placeholder = @"输入要搜索的商品";
        _goodsSearch.showsCancelButton = YES;
        _goodsSearch.returnKeyType = UIReturnKeySearch;
        _goodsSearch.delegate = self;
    }
    return _goodsSearch;
}

//点击屏幕任何地方取消方法

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.goodsSearch resignFirstResponder];
}

#pragma mark - UISearchBarDelegate methods

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self.goodsSearch resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{

    SameBrandViewController *brandVC = [[SameBrandViewController alloc] init];
    brandVC.idDictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://123.57.141.249:8080/beautalk/appSearch/searchList.do",@"URL",searchBar.text,@"ID",@"search",@"keyword", nil];
    
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:brandVC animated:YES];
    
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationItem.hidesBackButton = YES;
//    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidDisappear:(BOOL)animated{
  
    self.navigationItem.hidesBackButton = NO;
//    self.tabBarController.tabBar.hidden = NO;
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
