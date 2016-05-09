//
//  MyViewController.m
//  项目实战一
//
//  Created by ma c on 16/4/5.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "MyViewController.h"
#import "CYYLoginTableViewCell.h"
#import "CYYLoginData.h"

#import "LoginViewController.h"
#import "RegisterViewController.h"


static NSString *identifier = @"CYYLoginTableViewCell";

@interface MyViewController ()<UITableViewDataSource, UITableViewDelegate>
//背景
@property (nonatomic, strong) UIView *headerView;
/**登陆按钮*/
@property (nonatomic, strong) UIButton *loginButton;
/**注册按钮*/
@property (nonatomic, strong) UIButton *registerButton;
/**背景*/
@property (nonatomic, strong) UIView *backView;
/**数据*/
@property (nonatomic, strong) NSArray *dataList;
/**内容*/
@property (nonatomic, strong) UITableView *tableView;
/**头像*/
@property (nonatomic, strong) UIImageView *iconImage;
/**用户名字*/
@property (strong, nonatomic) UILabel *userNameLabel;
/**等级*/
@property (strong, nonatomic) UILabel *gradeLabel;

/**推出view*/
@property (nonatomic, strong) UIView *exitFootView;
/**退出按钮*/
@property (nonatomic, strong) UIButton *exitButton;
@end

@implementation MyViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self isLoginShow];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(223, 223, 223);
//    [self.view addSubview:self.headerView];
    [self.headerView addSubview:self.backView];
    [self.backView addSubview:self.iconImage];
    [self.backView addSubview:self.userNameLabel];
    [self.backView addSubview:self.gradeLabel];
    
    [self.backView addSubview:self.loginButton];
    [self.backView addSubview:self.registerButton];
    [self.view addSubview:self.tableView];
    [self addLayout];
    
}

#pragma mark - setter methods

- (NSArray *)dataList{
    if (!_dataList) {
        _dataList = [CYYLoginData loadData];
    }
    return _dataList;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerClass:[CYYLoginTableViewCell class] forCellReuseIdentifier:identifier];
    }
    return _tableView;
}

- (UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc] init];
        _headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 160);
        _headerView.backgroundColor = RGB(245, 245, 245);
    }
    return _headerView;
}
//头像
- (UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc] init];
        _iconImage.image = [UIImage imageNamed:@"登录界面微信登录"];
    }
    return _iconImage;
}
//用户名
- (UILabel *)userNameLabel{
    if (!_userNameLabel) {
        _userNameLabel = [[UILabel alloc] init];
    }
    return _userNameLabel;
}
//等级
- (UILabel *)gradeLabel{
    if (!_gradeLabel) {
        _gradeLabel = [[UILabel alloc] init];
    }
    return _gradeLabel;
}
//登陆按钮
- (UIButton *)loginButton{
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _loginButton.contentHorizontalAlignment = NSTextAlignmentCenter;
        
        [_loginButton addTarget:self action:@selector(loginClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}
//注册按钮
- (UIButton *)registerButton{
    if (!_registerButton) {
        _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
        [_registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _registerButton.contentHorizontalAlignment = NSTextAlignmentCenter;
        [_registerButton addTarget:self action:@selector(registerClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerButton;
}

- (UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = RGB(113, 206, 228);
    }
    return _backView;
}

//推出view
- (UIView *)exitFootView{
    if (!_exitFootView) {
        _exitFootView = [[UIView alloc] init];
        _exitFootView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 120);
        _exitFootView.backgroundColor = RGB(245, 245, 245);
        [_exitFootView addSubview:self.exitButton];
    }
    return _exitFootView;
}
//退出按钮
- (UIButton *)exitButton{
    if (!_exitButton) {
        _exitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _exitButton.frame = CGRectMake(50, 40, SCREEN_WIDTH - 100, 40);
        _exitButton.backgroundColor = RGB(67, 182, 245);
        _exitButton.layer.masksToBounds = YES;
        _exitButton.layer.cornerRadius = 5.0;
        [_exitButton setTitle:@"退  出  登  录" forState:(UIControlStateNormal)];
        [_exitButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_exitButton addTarget:self action:@selector(exitButtonMethod) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _exitButton;
}
- (void)addLayout{
    
    WS(weakSelf);
    
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.headerView.mas_top);
        make.left.equalTo(weakSelf.headerView.mas_left);
        make.right.equalTo(weakSelf.headerView.mas_right);
        make.height.equalTo(125);
    }];
    
    
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backView.mas_top).offset(50);
        make.left.equalTo(weakSelf.backView.mas_left).offset(100);
        make.size.equalTo(CGSizeMake(40, 30));
    }];
    
    
    [_registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backView.mas_top).offset(50);
        make.right.equalTo(weakSelf.headerView.mas_right).offset(-100);
        make.size.equalTo(CGSizeMake(40, 30));
    }];
    
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.headerView.mas_centerY);
        make.size.equalTo(CGSizeMake(75, 75));
        make.left.equalTo(60);
    }];
    
    [_userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.iconImage.mas_right).offset(40);
        make.top.equalTo(weakSelf.iconImage.mas_top).offset(10);
        make.right.equalTo(weakSelf.headerView.mas_right).offset(-20);
        make.height.equalTo(15);
    }];
    
    [_gradeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.iconImage.mas_bottom).offset(-10);
        make.left.equalTo(weakSelf.iconImage.mas_right).offset(40);
        make.height.equalTo(15);
        make.right.equalTo(weakSelf.headerView.mas_right).offset(-20);
    }];
}


#pragma mark - 点击事件 methods
//登陆按钮
- (void)loginClick:(UIButton *)loginButton{
   
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:loginVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
//注册按钮
- (void)registerClick:(UIButton *)registerButton{
    
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:registerVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
   
}
//退出登陆
- (void)exitButtonMethod{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"ISLOGIN"];
    [self.tableView reloadData];
    [self isLoginShow];
}
#pragma mark - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSDictionary *isLogin = [[NSUserDefaults standardUserDefaults]valueForKey:@"ISLOGIN"];
    if (isLogin.count != 0) {
        return 6;
    }else{
        return 4;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CYYLoginTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.data = self.dataList[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.row == 3) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        UILabel *phoneNumber = [[UILabel alloc] init];
        phoneNumber.text = @"4006668800";
        [cell addSubview:phoneNumber];
        __weak typeof(cell) weakCell = cell;
        [phoneNumber mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(weakCell.mas_right).offset(-15);
            make.size.equalTo(CGSizeMake(115, 15));
            make.centerY.equalTo(weakCell.mas_centerY);
        }];
    }
    return cell;
}
//header
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return self.headerView;
}
//header高度
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 160;
}
//设置footer（退出登陆）
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    NSDictionary *isLogin = [[NSUserDefaults standardUserDefaults] valueForKey:@"ISLOGIN"];
    if (isLogin.count != 0) {
        return self.exitFootView;
    }else
        return nil;
}
//footer高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    NSDictionary *isLogin = [[NSUserDefaults standardUserDefaults] valueForKey:@"ISLOGIN"];
    if (isLogin.count != 0) {
        return 120.0;
    }else{
        return 0.0;
    }
}
- (void)isLoginShow{
    NSDictionary *isLogin = [[NSUserDefaults standardUserDefaults] valueForKey:@"ISLOGIN"];
    NSLog(@"%@",isLogin);
    if (isLogin.count != 0) {
        self.headerView.hidden = NO;
        self.backView.hidden = NO;
        self.iconImage.hidden = NO;
        self.userNameLabel.hidden = NO;
        self.gradeLabel.hidden = NO;
        self.loginButton.hidden = YES;
        self.registerButton.hidden = YES;
        
        //为名字和等级赋值
        self.userNameLabel.text = isLogin[@"MemberName"];
        self.gradeLabel.text = isLogin[@"MemberLvl"];
    }else{
        self.headerView.hidden = NO;
        self.backView.hidden = NO;
        self.iconImage.hidden = YES;
        self.userNameLabel.hidden = YES;
        self.gradeLabel.hidden = YES;
        self.loginButton.hidden = NO;
        self.registerButton.hidden = NO;
    }
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
