//
//  SellViewController.m
//  项目实战一
//
//  Created by ma c on 16/4/5.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "SellViewController.h"
#import "NetWorkingSingle.h"
#import "MJExtension.h"
#import "CYYHeadModel.h"

#import "SXTHeadView.h"
#import "CYYButton.h"
#import "SingleModel.h"
#import "GroupModel.h"
#import "CYYHomeTableView.h"

#import "DetailViewController.h"
#import "CYYSearchViewController.h"
#import "SameBrandViewController.h"

@interface SellViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *imageList;
@property (nonatomic, strong) SXTHeadView *headImageView;

@property (nonatomic, strong) CYYButton *buttonView;

@property (nonatomic, strong) CYYHomeTableView *singleTableView;
@property (nonatomic, strong) CYYHomeTableView *groupTableView;

@end

@implementation SellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     *  在iOS 7中，苹果引入了一个新的属性，叫做[UIViewController setEdgesForExtendedLayout:]，它的默认值为UIRectEdgeAll。当你的容器是navigation controller时，默认的布局将从navigation bar的顶部开始。这就是为什么所有的UI元素都往上漂移了44pt
     */
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationItem.title = @"限时购";
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"限时特卖界面搜索按钮" hightImage:@"限时特卖界面搜索按钮" target:self action:@selector(searchClick:)];
    
    self.view.backgroundColor = RGB(223, 223, 223);
    
    [self.view addSubview:self.scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [_scrollView addSubview:self.headImageView];
    
    
    [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.scrollView.mas_left);
        make.top.equalTo(self.scrollView.mas_top);
        make.size.equalTo(CGSizeMake(SCREEN_WIDTH, 230));
    }];
    
    [_scrollView addSubview:self.singleTableView];
    [_scrollView addSubview:self.groupTableView];
    [_scrollView addSubview:self.buttonView];
    
    [self loadData];
}


#pragma mark - setter methods
- (NSMutableArray *)imageList{
    if (!_imageList) {
        _imageList = [NSMutableArray array];
    }
    return _imageList;
}

- (SXTHeadView *)headImageView{
    if (!_headImageView) {
        _headImageView = [[SXTHeadView alloc] init];
    }
    return _headImageView;
}
- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView  = [[UIScrollView alloc] init];
        _scrollView.delegate = self;
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    return _scrollView;
}

- (CYYButton *)buttonView{
    if (!_buttonView) {
        _buttonView = [[CYYButton alloc] initWithFrame:CGRectMake(0, 230, SCREEN_WIDTH, 50)];
        [_buttonView.singleButton addTarget:self action:@selector(singleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonView.groupButton addTarget:self action:@selector(groupButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonView;
}

#pragma mark - buttonClick methods
- (void)singleButtonClick:(UIButton *)singleButton{
    if (singleButton == _buttonView.singleButton) {
        _buttonView.singleButton.selected = YES;
        _buttonView.groupButton.selected = NO;
        _scrollView.contentSize = CGSizeMake(0, _singleTableView.singleListArray.count *175 + 280);
        [UIView animateWithDuration:0.5 animations:^{
            CGRect singleRect = _singleTableView.frame;
            singleRect.origin.x = 0;
            _singleTableView.frame = singleRect;
            
            CGRect groupRect = _groupTableView.frame;
            groupRect.origin.x = SCREEN_WIDTH;
            _groupTableView.frame = groupRect;
        }];
    }
    
}

- (void)groupButtonClick:(UIButton *)groupButton{
    if (groupButton == _buttonView.groupButton) {
        _buttonView.singleButton.selected = NO;
        _buttonView.groupButton.selected = YES;
        _scrollView.contentSize = CGSizeMake(0, _groupTableView.groupBuyListArray.count*175+280);
        [UIView animateWithDuration:0.5 animations:^{
            CGRect singleRect = _singleTableView.frame;
            singleRect.origin.x = -SCREEN_WIDTH;
            _singleTableView.frame = singleRect;
            
            CGRect groupRect = _groupTableView.frame;
            groupRect.origin.x = 0;
            _groupTableView.frame = groupRect;
        }];
    }
}

- (void)searchClick:(UIButton *)button{
    
    CYYSearchViewController *searchVC = [[CYYSearchViewController alloc] init];
    
    self.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:searchVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}


//- (void)ButtonClick:(UIButton *)Button{
//   
//
//    if (Button == _buttonView.singleButton) {
//        _buttonView.singleButton.selected = YES;
//        _buttonView.groupButton.selected = NO;
//        _scrollView.contentSize = CGSizeMake(0, _singleTableView.singleListArray.count *175 + 280);
//        [UIView animateWithDuration:0.5 animations:^{
//            CGRect singleRect = _singleTableView.frame;
//            singleRect.origin.x = 0;
//            _singleTableView.frame = singleRect;
//            
//            CGRect groupRect = _groupTableView.frame;
//            groupRect.origin.x = SCREEN_WIDTH;
//            _groupTableView.frame = groupRect;
//        }];
//    }else{
//        _buttonView.singleButton.selected = NO;
//        _buttonView.groupButton.selected = YES;
//        _scrollView.contentSize = CGSizeMake(0, _groupTableView.groupBuyListArray.count*175+280);
//        [UIView animateWithDuration:0.5 animations:^{
//            CGRect singleRect = _singleTableView.frame;
//            singleRect.origin.x = -SCREEN_WIDTH;
//            _singleTableView.frame = singleRect;
//            
//            CGRect groupRect = _groupTableView.frame;
//            groupRect.origin.x = 0;
//            _groupTableView.frame = groupRect;
//        }];
//    }
//    
//}


#pragma mark - loadData methods
- (void)loadData{
    
    NSString *url = @"http://123.57.141.249:8080/beautalk/appHome/appHome.do";
    
    [[NetWorkingSingle sharedManager] getDateWithUrl:url parameter:nil success:^(NSURLSessionDataTask *task, id responseObject) {
//        self.imageList = [CYYHeadModel mj_objectArrayWithKeyValuesArray:responseObject];
 
        NSArray *model = [CYYHeadModel mj_objectArrayWithKeyValuesArray:responseObject];
        NSMutableArray *imageArray = [NSMutableArray arrayWithCapacity:model.count];
        for (CYYHeadModel *mod in model) {
            [imageArray addObject:mod.ImgView];
        }
        self.headImageView.dataList = [NSArray arrayWithArray:imageArray];
       
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"error-----%@",error);
    }];
    //请求single数据
    NSString *singleUrl = @"http://123.57.141.249:8080/beautalk/appActivity/appHomeGoodsList.do";
    [[NetWorkingSingle sharedManager] getDateWithUrl:singleUrl parameter:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSArray *singleArray = [SingleModel mj_objectArrayWithKeyValuesArray:responseObject];
        self.singleTableView.singleListArray = singleArray;
        self.scrollView.contentSize = CGSizeMake(0, singleArray.count * 170 + 280);
        //改变table的大小，使table不能进行滚动
        CGRect singleRect = _singleTableView.frame;
        singleRect.size.height = singleArray.count * 170;
        _singleTableView.frame = singleRect;
        
        [self.singleTableView reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"error----%@",error);
    }];
    
    //请求group数据
    NSString *groupUrl = @"http://123.57.141.249:8080/beautalk/appActivity/appActivityList.do";
    [[NetWorkingSingle sharedManager] getDateWithUrl:groupUrl parameter:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSArray *groupArray = [GroupModel mj_objectArrayWithKeyValuesArray:responseObject];
        
        self.groupTableView.groupBuyListArray = groupArray;
        
        CGRect groupRect = _groupTableView.frame;
        groupRect.size.height = groupArray.count * 175;
        _groupTableView.frame = groupRect;
        
        [self.groupTableView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"error----%@",error);
    }];
    
    
}
#pragma mark - tableView methods
//单品团购table
- (CYYHomeTableView *)singleTableView{
    
    if (!_singleTableView) {
        _singleTableView = [[CYYHomeTableView alloc] initWithFrame:CGRectMake(0, 280, SCREEN_WIDTH, 0) style:UITableViewStylePlain];
        _singleTableView.isSingle = YES;
        
        //block块传值
        WS(weakSelf);
        _singleTableView.selectSingle = ^(NSString *GoodsId){
            DetailViewController *detailController = [[DetailViewController alloc] init];
            detailController.GoodsId = GoodsId;
            weakSelf.hidesBottomBarWhenPushed = YES;

            [weakSelf.navigationController pushViewController:detailController animated:YES];
            weakSelf.hidesBottomBarWhenPushed = NO;
        };
    }
    return _singleTableView;
}
//品牌团购table
- (CYYHomeTableView *)groupTableView{
    if (!_groupTableView) {
        _groupTableView = [[CYYHomeTableView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 280, SCREEN_WIDTH, 0) style:UITableViewStylePlain];
        _groupTableView.isSingle = NO;
        
        WS(weakSelf);
        _groupTableView.selectGroup = ^(NSString *groupId){
        
            SameBrandViewController *groupVC = [[SameBrandViewController alloc] init];
            groupVC.idDictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://123.57.141.249:8080/beautalk/appGgroupon/appGrounpGoodsList.do",@"URL",groupId,@"ID",@"GrouponId",@"keyword", nil];
            
            weakSelf.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:groupVC animated:YES];
            weakSelf.hidesBottomBarWhenPushed = NO;
        };
    }
    return _groupTableView;
}


//设置悬停效果
#pragma mark - scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ([scrollView isEqual:_scrollView]) {
        if (scrollView.contentOffset.y > 230) {
            CGRect twoBtnRect = _buttonView.frame;
            twoBtnRect.origin.y = scrollView.contentOffset.y;
            _buttonView.frame = twoBtnRect;
        }else{
            _buttonView.frame = CGRectMake(0, 230, SCREEN_WIDTH, 50);
        }
    }
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
