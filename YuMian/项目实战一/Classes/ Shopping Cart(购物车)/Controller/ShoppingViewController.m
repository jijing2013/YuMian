//
//  ShoppingViewController.m
//  项目实战一
//
//  Created by ma c on 16/4/5.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "ShoppingViewController.h"
#import "CYYBuyCarTableView.h"
#import "CYYBuyCarModel.h"
#import "CYYBuyCarTotlePriceView.h"
#import "NetWorkingSingle.h"
#import "MJExtension.h"
#import "CYYMakeSureViewController.h"

@interface ShoppingViewController ()
/** 购物车列表*/
@property (nonatomic, strong) CYYBuyCarTableView *buyCarTableView;
/** 存储购物车数据的数组 */
@property (strong, nonatomic)   NSMutableArray *buyCarData;

/**价格总计*/
@property (nonatomic, strong) CYYBuyCarTotlePriceView *priceView;

@end

@implementation ShoppingViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self loadData];
}
//将要消失时将数据传给服务器
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    __block NSString *GoodsString = nil;
    __block NSMutableArray *GoodsArray = [NSMutableArray array];
    [_buyCarData enumerateObjectsUsingBlock:^(CYYBuyCarModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        GoodsString = [NSString stringWithFormat:@"%@,%li",obj.UUID,obj.GoodsCount];
        [GoodsArray addObject:GoodsString];
    }];
    
    GoodsString = [GoodsArray componentsJoinedByString:@"#"];
    //更新服务器数据
    [[NetWorkingSingle sharedManager] postDataWithUrl:@"http://123.57.141.249:8080/beautalk/appShopCart/appUpdateCart.do" parameter:@{@"updateCartMsg":GoodsString} success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSLog(@"responseObject --%@",responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(223, 223, 223);
    [self.view addSubview:self.buyCarTableView];
    [self.view addSubview:self.priceView];
    
    WS(weakSelf);
    [_buyCarTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view).with.insets(UIEdgeInsetsMake(0, 0, 49, 0));
    }];
    
    [_priceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-44);
        make.left.equalTo(weakSelf.view.mas_left);
        make.height.equalTo(55);
        make.right.equalTo(weakSelf.view.mas_right);
    }];
    [self loadData];
}

- (CYYBuyCarTableView *)buyCarTableView{
    if (!_buyCarTableView) {
        _buyCarTableView = [[CYYBuyCarTableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
        WS(weakSelf);
        _buyCarTableView.dataArrayBlock = ^(NSMutableArray *array){
            weakSelf.buyCarData = array;
            [weakSelf countTotalPrice];
        };
    }
    return _buyCarTableView;
}
- (CYYBuyCarTotlePriceView *)priceView{
    if (!_priceView) {
        _priceView = [[CYYBuyCarTotlePriceView alloc] init];
        [_priceView.closingCostBtn addTarget:self action:@selector(pushToSureOrderViewController) forControlEvents:UIControlEventTouchUpInside];
    }
    return _priceView;
}
//加载数据
- (void)loadData{
    
    NSDictionary *memberDic = [[NSUserDefaults standardUserDefaults] valueForKey:@"ISLOGIN"];
    [[NetWorkingSingle sharedManager] getDateWithUrl:@"http://123.57.141.249:8080/beautalk/appShopCart/appCartGoodsList.do" parameter:@{@"MemberId":memberDic[@"MemberId"]}
 success:^(NSURLSessionDataTask *task, id responseObject) {
     
     //存储数据
     self.buyCarData = [CYYBuyCarModel mj_objectArrayWithKeyValuesArray:responseObject];
     [self.buyCarData enumerateObjectsUsingBlock:^(CYYBuyCarModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
         [obj setIsSelectButton:YES];
     }];
     //传数据
     self.buyCarTableView.dataArray = self.buyCarData;
     //更新
     [self.buyCarTableView reloadData];
     
     [self countTotalPrice];
 } failure:^(NSURLSessionDataTask *task, NSError *error) {
     
 }];
}

- (void)countTotalPrice{
    __block CGFloat totalPrice = 0.0;
    __block NSInteger goodsCount = 0;
    [self.buyCarData enumerateObjectsUsingBlock:^(CYYBuyCarModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.isSelectButton) {
            totalPrice += obj.Price * obj.GoodsCount;
        }
        goodsCount += obj.GoodsCount;
    }];
    self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%li", goodsCount];
    self.priceView.priceLabel.text = [NSString stringWithFormat:@"¥%.2lf",totalPrice];
}
- (void)pushToSureOrderViewController{
    CYYMakeSureViewController *makeSure = [[CYYMakeSureViewController alloc] init];
    
    self.hidesBottomBarWhenPushed = YES;
    makeSure.makeSureArray = [self getOrderDataArray];
    makeSure.totalMoney = self.priceView.priceLabel.text;
    [self.navigationController pushViewController:makeSure animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
//获得数据
- (NSArray *)getOrderDataArray{
    NSMutableArray *dataArray = [NSMutableArray array];
    [_buyCarData enumerateObjectsUsingBlock:^(CYYBuyCarModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.isSelectButton) {
            [dataArray addObject:obj];
        }
    }];
    return dataArray;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
