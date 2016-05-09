//
//  TaxonomistViewController.m
//  项目实战一
//
//  Created by ma c on 16/4/5.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "TaxonomistViewController.h"
#import "NetWorkingSingle.h"
#import "CYYClassCollectionView.h"
#import "CYYClassModel.h"
#import "CYYEffectClassModel.h"
#import "MJExtension.h"


#import "CYYTypeViewController.h"

@interface TaxonomistViewController ()

/** 分类列表*/
@property (nonatomic, strong) CYYClassCollectionView *classCollection;

@end

@implementation TaxonomistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(223, 223, 223);
    [self.view addSubview:self.classCollection];
    [self loadData];
}

- (CYYClassCollectionView *)classCollection{
    if (!_classCollection) {

        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
        NSInteger itemWidth = (SCREEN_WIDTH - 3) / 4;
        flowLayout.itemSize = CGSizeMake(itemWidth, itemWidth);
        flowLayout.minimumLineSpacing = 1;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 1, 0);
        flowLayout.headerReferenceSize = CGSizeMake(0, 35);
        _classCollection = [[CYYClassCollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) collectionViewLayout:flowLayout];

        _classCollection.backgroundColor = RGB(245, 245, 245);
        WS(weakSelf);
        //功效
        _classCollection.effectBlock = ^(NSString *GoodsType){
            CYYTypeViewController *effectVC = [[CYYTypeViewController alloc] init];
            effectVC.paramer = GoodsType;
            [weakSelf.navigationController pushViewController:effectVC animated:YES];
            NSLog(@"%@",GoodsType);
        };
        //经典
        
        _classCollection.classicBlock = ^(NSString *ShopId){
            CYYTypeViewController *classicVC = [[CYYTypeViewController alloc] init];
            classicVC.paramer = ShopId;
            [weakSelf.navigationController pushViewController:classicVC animated:YES];
            NSLog(@"%@",ShopId);
        };
        /**
         *  推荐
         */
        _classCollection.recommendBlock = ^(NSString *ShopId){
            NSLog(@"%@",ShopId);
        };
        
    }
    return _classCollection;
}
- (void)loadData{
    
    //功效
    [[NetWorkingSingle sharedManager] getDateWithUrl:@"http://123.57.141.249:8080/beautalk/appBrandareatype/findBrandareatype.do" parameter:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        self.classCollection.effectArray = [CYYEffectClassModel mj_objectArrayWithKeyValuesArray:responseObject];
//        NSLog(@"%@",responseObject);
        [self.classCollection reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];

    //推荐
    [[NetWorkingSingle sharedManager] getDateWithUrl:@"http://123.57.141.249:8080/beautalk/appBrandareanew/findBrandareanew.do" parameter:nil success:^(NSURLSessionDataTask *task, id responseObject) {
         self.classCollection.classicClassArray = [CYYClassModel mj_objectArrayWithKeyValuesArray:responseObject];
//        NSLog(@"%@",responseObject);
        [self.classCollection reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
    //经典
    [[NetWorkingSingle sharedManager] getDateWithUrl:@"http://123.57.141.249:8080/beautalk/appBrandarea/asianBrand.do" parameter:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        self.classCollection.recommendClassArray = [CYYClassModel mj_objectArrayWithKeyValuesArray:responseObject];
   
        [self.classCollection reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
