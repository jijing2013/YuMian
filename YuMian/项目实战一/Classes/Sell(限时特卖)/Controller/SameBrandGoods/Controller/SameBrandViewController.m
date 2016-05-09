//
//  SameBrandViewController.m
//  项目实战一
//
//  Created by ma c on 16/4/13.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "SameBrandViewController.h"
#import "NetWorkingSingle.h"
#import "CYYBrandCollectionViewCell.h"
#import "CYYBrandCollectionModel.h"

#import "MJExtension.h"

static NSString *identifier = @"CYYBrandCollectionViewCell";
static CGFloat kMargin = 5.f;
@interface SameBrandViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;


//存储数据数组
@property (nonatomic, strong) NSArray *brandListHost;
@property (nonatomic, strong) NSArray *brandListPrice;
@property (nonatomic, strong) NSArray *brandListTime;
@property (nonatomic, strong) NSArray *brandListScore;

@property (nonatomic, strong) NSArray *brandList;

@property (nonatomic, strong) NSArray *brandListGroup;

@property (nonatomic, strong) UIView *buttonBackView;
//下部指示线
@property (nonatomic, strong) UILabel *lineLabel;
@property (nonatomic, strong) UIButton *selectButton;

@end

@implementation SameBrandViewController

- (NSMutableDictionary *)idDictionary{
    if (!_idDictionary) {
        _idDictionary = [NSMutableDictionary dictionary];
    }
    return _idDictionary;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"抗氧防衰";

    CYYBrandCollectionViewCell *collectionCell = [[CYYBrandCollectionViewCell alloc] init];
    collectionCell.selectedGoods = ^(NSString *goodsID){
        NSLog(@"%@",goodsID);
    };
    //请求数据
    [self loadData:@{@"OrderName":@"host",@"OrderType":@"DESC",_idDictionary[@"keyword"]:_idDictionary[@"ID"]}];
    
    [self setHeadButton];
    
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.buttonBackView];
    self.view.backgroundColor = [UIColor whiteColor];
}



- (UIView *)buttonBackView{
    if (!_buttonBackView) {
        _buttonBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    }
    return _buttonBackView;
}

- (UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc] init];
        _lineLabel.backgroundColor = RGB(0, 187, 244);
    }
    return _lineLabel;
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        CGFloat itemWidth = (self.view.bounds.size.width - kMargin) / 2.0;
        
        flowLayout.itemSize = CGSizeMake(itemWidth, itemWidth / 0.65);
        flowLayout.minimumLineSpacing = 5;
        flowLayout.minimumInteritemSpacing = 5;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:flowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = RGB(223, 223, 223);
     
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerClass:[CYYBrandCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    }
    return _collectionView;
}

#pragma mark - UICollectionViewDataSource methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if ([_idDictionary[@"keyword"] isEqualToString:@"search"]){
        return self.brandList.count;
    }else if([_idDictionary[@"keyword"] isEqualToString:@"GrouponId"]){
        return self.brandListGroup.count;
    }else{
        if (self.selectButton.tag == 100) {
            return self.brandListHost.count;
        }else if (self.selectButton.tag == 101){
            return self.brandListPrice.count;
        }else if (self.selectButton.tag == 102){
            return self.brandListTime.count;
        }else{
            return self.brandListScore.count;
        }
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CYYBrandCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    if ([_idDictionary[@"keyword"] isEqualToString:@"search"]){
        cell.brandDataList = self.brandList[indexPath.row];
        return cell;
    }else if([_idDictionary[@"keyword"] isEqualToString:@"GrouponId"]){
        
        cell.brandDataList = self.brandListGroup[indexPath.row];
        return cell;
        
    }else{
        if (self.selectButton.tag == 100) {
            cell.brandDataList = self.brandListHost[indexPath.row];
            
            return cell;
        }else if (self.selectButton.tag == 101){
            cell.brandDataList = self.brandListPrice[indexPath.row];
            return cell;
        }else if (self.selectButton.tag == 102){
            cell.brandDataList = self.brandListTime[indexPath.row];
            return cell;
        }else{
            cell.brandDataList = self.brandListScore[indexPath.row];
            return cell;
        }
    }
}
- (void)setHeadButton{
    CGFloat width = SCREEN_WIDTH / 4;
    CGFloat height = 50;
    NSArray *titleName = @[@"热门",@"价格",@"好评",@"新品"];
    for (NSInteger i = 0; i < 4; i++) {

        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i * width, 0, width, height);
        
        [button setTitle:titleName[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:RGB(0, 187, 244) forState:UIControlStateSelected];
        [button addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i+100;

        if (i == 0) {
            button.selected = YES;
            self.selectButton = button;
            self.lineLabel.frame = CGRectMake(i * width + 15, 45, width - 30, 2);
        }
        
        [self.buttonBackView addSubview:button];
        [self.buttonBackView addSubview:self.lineLabel];
        
    }
}

#pragma mark - titleLabelClick methods

- (void)titleButtonClick:(UIButton *)buttonClick{

    if (buttonClick == self.selectButton) return;
    
    NSInteger index = buttonClick.tag - 100;
    CGFloat width = SCREEN_WIDTH / 4;
    buttonClick.selected = YES;
    self.selectButton.selected = NO;
    self.selectButton = buttonClick;
    //刷新
    [self.collectionView reloadData];
    
    [UIView animateWithDuration:0.2 animations:^{
        
        self.lineLabel.frame = CGRectMake(index * width + 15, 45, width - 30, 2);
        
    }];
    
}

#pragma mark - 加载数据 methods

- (void)loadData:(NSDictionary *)params{

    if ([_idDictionary[@"keyword"] isEqualToString:@"search"]) {
        [[NetWorkingSingle sharedManager] postDataWithUrl:_idDictionary[@"URL"] parameter:[self makeParameterDic:params] success:^(NSURLSessionDataTask *task, id responseObject) {
            self.brandList = [CYYBrandCollectionModel mj_objectArrayWithKeyValuesArray:responseObject];
//            NSLog(@"-----%@",self.brandList);
            //加载数据
            [self.collectionView reloadData];
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"----error%@",error);
            
        }];
    }else if ([_idDictionary[@"keyword"] isEqualToString:@"GrouponId"]){
        
        [[NetWorkingSingle sharedManager] getDateWithUrl:_idDictionary[@"URL"] parameter:[self makeParameterDic:params] success:^(NSURLSessionDataTask *task, id responseObject) {
            
            self.brandListGroup = [CYYBrandCollectionModel mj_objectArrayWithKeyValuesArray:responseObject];
            //加载数据
            [self.collectionView reloadData];
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
            NSLog(@"----error%@",error);
            
        }];
        
    }else{
        NSDictionary *paramsHost = @{_idDictionary[@"keyword"]:_idDictionary[@"ID"],
                                     @"OrderName":@"host",
                                     @"OrderType":@"EDSC"};
        
        [[NetWorkingSingle sharedManager] getDateWithUrl:_idDictionary[@"URL"] parameter:paramsHost success:^(NSURLSessionDataTask *task, id responseObject) {
            
            self.brandListHost = [CYYBrandCollectionModel mj_objectArrayWithKeyValuesArray:responseObject];
            //刷新数据
            [self.collectionView reloadData];
            
            NSLog(@"%@",responseObject);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
            NSLog(@"----error%@",error);
        }];
        
        NSDictionary *paramsPrice = @{_idDictionary[@"keyword"]:_idDictionary[@"ID"],
                                      @"OrderName":@"price",
                                      @"OrderType":@"EDSC"};
        
        [[NetWorkingSingle sharedManager] getDateWithUrl:_idDictionary[@"URL"] parameter:paramsPrice success:^(NSURLSessionDataTask *task, id responseObject) {
            
            self.brandListPrice = [CYYBrandCollectionModel mj_objectArrayWithKeyValuesArray:responseObject];
            //刷新数据
            [self.collectionView reloadData];
            
            NSLog(@"%@",responseObject);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
            NSLog(@"----error%@",error);
        }];
        
        NSDictionary *paramsTime = @{_idDictionary[@"keyword"]:_idDictionary[@"ID"],
                                     @"OrderName":@"time",
                                     @"OrderType":@"ASC"};
        
        [[NetWorkingSingle sharedManager] getDateWithUrl:_idDictionary[@"URL"] parameter:paramsTime success:^(NSURLSessionDataTask *task, id responseObject) {
            
            self.brandListTime = [CYYBrandCollectionModel mj_objectArrayWithKeyValuesArray:responseObject];
            //刷新数据
            [self.collectionView reloadData];
            
            NSLog(@"%@",responseObject);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
            NSLog(@"----error%@",error);
        }];
        
        
        NSDictionary *paramsScore = @{_idDictionary[@"keyword"]:_idDictionary[@"ID"],
                                      @"OrderName":@"score",
                                      @"OrderType":@"EDSC"};
        
        [[NetWorkingSingle sharedManager] getDateWithUrl:_idDictionary[@"URL"] parameter:paramsScore success:^(NSURLSessionDataTask *task, id responseObject) {
            
            self.brandListScore = [CYYBrandCollectionModel mj_objectArrayWithKeyValuesArray:responseObject];
            //刷新数据
            [self.collectionView reloadData];
            
            NSLog(@"%@",responseObject);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
            NSLog(@"----error%@",error);
        }];
    }
    
}


- (NSDictionary *)makeParameterDic:(NSDictionary *)dict{
    //@"OrderName":@"host",@"OrderType":@"DESC",@"ShopId":self.shopID
    NSDictionary *parameter = @{@"OrderName":dict[@"OrderName"],@"OrderType":dict[@"OrderType"],_idDictionary[@"keyword"]:_idDictionary[@"ID"]};
    return parameter;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}



@end
