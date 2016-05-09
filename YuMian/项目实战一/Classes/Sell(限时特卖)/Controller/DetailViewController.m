//
//  DetailViewController.m
//  项目实战一
//
//  Created by ma c on 16/4/8.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "DetailViewController.h"
#import "NetWorkingSingle.h"
#import "MJExtension.h"
#import "CYYfindGoodsImgListModel.h"
#import "CYYfindGoodsDetailListModel.h"
#import "CYYfindGoodsDetailModel.h"
#import "SameBrandViewController.h"


#import "CYYDetailHeadView.h"
#import "CYYDetailGoodsContentView.h"
#import "CYYDetailAllImageView.h"
#import "CYYDetailAllLabelView.h"
#import "CYYDetailBuyView.h"
#import "UIImage+ColorMakeImage.h"
#import "UMSocial.h"

@interface DetailViewController ()<UIScrollViewDelegate, UMSocialUIDelegate>

@property (nonatomic, strong) CYYDetailHeadView *headView;
@property (nonatomic, strong) CYYDetailGoodsContentView *contentView;
@property (nonatomic, strong) CYYDetailAllImageView *allImageView;
@property (nonatomic, strong) CYYDetailAllLabelView *allLabelView;

@property (nonatomic, strong) CYYDetailBuyView *buyView;
//滚动视图的view
@property (nonatomic, strong) UIView *mainScrollView;
//滚动视图
@property (nonatomic, strong) UIScrollView *scrollView;
//记录scroll的高度
@property (nonatomic, assign) CGFloat scrollViewContentHeight;

@property (nonatomic, strong) UIButton *shareButton;
@property (nonatomic, strong) UIButton *latticeButton;
@property (nonatomic, strong) UIButton *backButton;

//存储shopID
@property (nonatomic, copy) NSString *shopID;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeTop;
    self.scrollViewContentHeight = 360;
    //自适应sroll的内边距
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationItem.hidesBackButton = YES;

    UIBarButtonItem *latticeItem = [[UIBarButtonItem alloc] initWithCustomView:self.latticeButton];
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithCustomView:self.shareButton];
    self.navigationItem.rightBarButtonItems = @[latticeItem, shareItem];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.backButton];
    
    //控制nav的透明度
    UIColor * whiteColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    UIImage * whiteImage = [UIImage imageWithColor:whiteColor];
    //给navigationBar设背景
    [self.navigationController.navigationBar setBackgroundImage:whiteImage forBarMetrics:UIBarMetricsDefault];
    //设置navigationBar阴影
    [self.navigationController.navigationBar setShadowImage:whiteImage];
    

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.mainScrollView];
    [self.mainScrollView addSubview:self.headView];
    [self.mainScrollView addSubview:self.contentView];
    [self.mainScrollView addSubview:self.allLabelView];
    [self.mainScrollView addSubview:self.allImageView];

    [self.view addSubview:self.buyView];
    [self addLayout];
    [self loadGoodsDate];
}

- (UIButton *)backButton{
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _backButton.frame = CGRectMake(15, 35, 30, 30);
        [_backButton setImage:[UIImage imageNamed:@"详情界面返回按钮"] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _backButton;
}

- (UIButton *)latticeButton{
    if (!_latticeButton) {
        _latticeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _latticeButton.frame = CGRectMake(SCREEN_WIDTH - 45, 35, 30, 30);
        [_latticeButton setImage:[UIImage imageNamed:@"详情界面收藏按钮"] forState:UIControlStateNormal];
        [_latticeButton addTarget:self action:@selector(latticeClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _latticeButton;
}

- (UIButton *)shareButton{
    if (!_shareButton) {
        _shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _shareButton.frame = CGRectMake(SCREEN_WIDTH - 100, 35, 30, 30);
        [_shareButton setImage:[UIImage imageNamed:@"详情界面转发按钮"] forState:UIControlStateNormal];
        [_shareButton addTarget:self action:@selector(shareClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shareButton;
}


- (void)addLayout{
    WS(weakSelf);
    
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mainScrollView.mas_top).offset(360);
        make.right.equalTo(weakSelf.mainScrollView.mas_right);
        make.left.equalTo(weakSelf.mainScrollView.mas_left);
        make.height.equalTo(1);
    }];

    [_allLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.contentView.mas_bottom);
        make.right.equalTo(weakSelf.mainScrollView.mas_right);
        make.left.equalTo(weakSelf.mainScrollView.mas_left);
        make.height.equalTo(1);
    }];
    
    [_allImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.allLabelView.mas_bottom);
        make.right.equalTo(weakSelf.mainScrollView.mas_right);
        make.left.equalTo(weakSelf.mainScrollView.mas_left);
        make.height.equalTo(1);
    }];
    
    [_buyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.view.mas_bottom);
        make.right.equalTo(weakSelf.mainScrollView.mas_right);
        make.left.equalTo(weakSelf.mainScrollView.mas_left);
        make.height.equalTo(49);
        
    }];
}
#pragma mark - setter  methods
- (CYYDetailHeadView *)headView{
    if (!_headView) {
        _headView = [[CYYDetailHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 360)];
        _headView.backgroundColor = [UIColor whiteColor];
        
    }
    return _headView;
}

- (CYYDetailGoodsContentView *)contentView{
    if (!_contentView) {
        _contentView = [[CYYDetailGoodsContentView alloc] init];
        _contentView.backgroundColor = [UIColor whiteColor];
        [_contentView.brandButton addTarget:self action:@selector(sameBrandClick:) forControlEvents:UIControlEventTouchUpInside];
        WS(weakSelf);
        _contentView.heightBlock = ^(CGFloat height){
            [weakSelf.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(height);
            }];
            weakSelf.scrollViewContentHeight += height;
        };
        
        
        _contentView.ShopIdBlock = ^(NSString *ShopId){
            weakSelf.shopID = ShopId;
        };
    }
    return _contentView;
}

- (CYYDetailAllLabelView *)allLabelView{
    if (!_allLabelView) {
        _allLabelView = [[CYYDetailAllLabelView alloc] init];
        WS(weakSelf);
        _allLabelView.labelHeightBlock = ^(CGFloat height){
            [weakSelf.allLabelView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(height);
            }];
            weakSelf.scrollViewContentHeight += height;
        };
    }
    return _allLabelView;
}

- (CYYDetailAllImageView *)allImageView{
    if (!_allImageView) {
        _allImageView = [[CYYDetailAllImageView alloc] init];
        WS(weakSelf);
        _allImageView.imageBlock = ^(CGFloat height){
            [weakSelf.allImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(height);
            }];
            weakSelf.scrollViewContentHeight += height;
        };
    }
    return _allImageView;
}

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _scrollView.delegate = self;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        //关闭，不关闭不好使
//        _scrollView.userInteractionEnabled = YES;
//        _scrollView.translatesAutoresizingMaskIntoConstraints = NO;
        _scrollView.contentSize = CGSizeMake(0, 360);
    }
    return _scrollView;
}
- (UIView *)mainScrollView{
    if (!_mainScrollView) {
        _mainScrollView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _mainScrollView.backgroundColor = RGB(245, 245, 245);

    }
    return _mainScrollView;
}

- (CYYDetailBuyView *)buyView{
    if (!_buyView) {
        _buyView = [[CYYDetailBuyView alloc] init];
        _buyView.backgroundColor = [UIColor whiteColor];
        [_buyView.addShopping addTarget:self action:@selector(addGoodsForBuyCar) forControlEvents:UIControlEventTouchUpInside];
        [_buyView.shoppingCart addTarget:self action:@selector(addGoodsForBuyCar) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buyView;
}

#pragma mark - 点击事件 methods
- (void)addGoodsForBuyCar{
    NSDictionary *memberDic = [[NSUserDefaults standardUserDefaults] valueForKey:@"ISLOGIN"];
    [[NetWorkingSingle sharedManager] getDateWithUrl:@"http://123.57.141.249:8080/beautalk/appShopCart/insert.do" parameter:@{@"MemberId":memberDic[@"MemberId"],@"GoodsId":_contentView.goodsDetailModel.GoodsId} success:^(NSURLSessionDataTask *task, id responseObject) {
       
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
}
- (void)shareClick:(UIButton *)shareButton{
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"53290df956240b6b4a0084b3"
                                      shareText:@"你要分享的文字"
                                     shareImage:[UIImage imageNamed:@"default"]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToQzone,UMShareToWechatSession,UMShareToWechatTimeline,nil]
                                       delegate:self];
    
}

- (void)latticeClick:(UIButton *)latticeButton{
    CYYLog(@"%s",__func__);
}
- (void)backClick:(UIButton *)backButton{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
- (void)sameBrandClick:(UIButton *)sameBrandClick{

    SameBrandViewController *sameBrandVC = [[SameBrandViewController alloc] init];
    sameBrandVC.idDictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://123.57.141.249:8080/beautalk/appShop/appShopGoodsList.do",@"URL",self.contentView.goodsDetailModel.ShopId,@"ID",@"ShopId",@"keyword", nil];
    
//    sameBrandVC.ShopId = self.shopID;
    
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:sameBrandVC animated:YES];

}
#pragma mark - 加载数据 methods
- (void)loadGoodsDate{
    
    WS(weakSelf);
    //加载图片列表
    [[NetWorkingSingle sharedManager] getDateWithUrl:@"http://123.57.141.249:8080/beautalk/appGoods/findGoodsImgList.do" parameter:@{@"GoodsId":self.GoodsId} success:^(NSURLSessionDataTask *task, id responseObject) {
 
        NSArray *model = [CYYfindGoodsImgListModel mj_objectArrayWithKeyValuesArray:responseObject];
        NSMutableArray *imgListModel = [NSMutableArray arrayWithCapacity:model.count];
        for (CYYfindGoodsImgListModel *listModel in model) {
            [imgListModel addObject:listModel.ImgView];
        }
        
        weakSelf.headView.headImage.dataList = [NSArray arrayWithArray:imgListModel];
        weakSelf.allImageView.imageArray = model;
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"------%@",error);
    }];
    //加载商品描述
    [[NetWorkingSingle sharedManager] getDateWithUrl:@"http://123.57.141.249:8080/beautalk/appGoods/findGoodsDetailList.do" parameter:@{@"GoodsId":self.GoodsId} success:^(NSURLSessionDataTask *task, id responseObject) {
//        NSLog(@"%@",responseObject);
        weakSelf.allLabelView.detailListModel = [CYYfindGoodsDetailListModel mj_objectArrayWithKeyValuesArray:responseObject];
       
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"------%@",error);
    }];
 
    //加载商品详细信息
    [[NetWorkingSingle sharedManager] getDateWithUrl:@"http://123.57.141.249:8080/beautalk/appGoods/findGoodsDetail.do" parameter:@{@"GoodsId":self.GoodsId} success:^(NSURLSessionDataTask *task, id responseObject) {
       
        
        weakSelf.contentView.goodsDetailModel = [CYYfindGoodsDetailModel mj_objectWithKeyValues:responseObject];
    
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"------%@",error);
    }];
    
}
//设置head动画
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y < 170) {
        //实现上面headImage滚动比其他内容慢一点的操作
        CGRect rect = _headView.frame;
        rect.origin.y = scrollView.contentOffset.y/2;
        _headView.frame = rect;
        
        //通过类别将颜色转换为图片
        UIColor * whiteColor = [UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:248.0/255.0 alpha:scrollView.contentOffset.y/170];
        UIImage * whiteImage = [UIImage imageWithColor:whiteColor];
        [self.navigationController.navigationBar setBackgroundImage:whiteImage forBarMetrics:UIBarMetricsDefault];
    }
    
}

- (void)setScrollViewContentHeight:(CGFloat)scrollViewContentHeight{
    _scrollViewContentHeight = scrollViewContentHeight;
    _scrollView.contentSize = CGSizeMake(0, _scrollViewContentHeight);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
