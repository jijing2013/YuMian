//
//  CYYMakeSureView.m
//  项目实战一
//
//  Created by ma c on 16/5/4.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "CYYMakeSureView.h"
#import "CYYMakeSureTableViewCell.h"
#import "CYYMakeSureAddTableViewCell.h"

static NSString *identifier1 = @"tableViewCell";
static NSString *identifier2 = @"addTableViewCell";
@interface CYYMakeSureView ()<UITableViewDataSource, UITableViewDelegate>

@end
@implementation CYYMakeSureView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        //分割线
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.bounces = NO;
        self.backgroundColor = RGB(245, 245, 245);
        //注册
        [self registerClass:[CYYMakeSureTableViewCell class] forCellReuseIdentifier:identifier1];
        [self registerClass:[CYYMakeSureAddTableViewCell class] forCellReuseIdentifier:identifier2];
    }
    return self;
}
#pragma mark - UITableViewDataSource methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return self.orderDataArray.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        CYYMakeSureAddTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier2];
        
        return cell;
    }else{
        CYYMakeSureTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier1];
        cell.sureModel = self.orderDataArray[indexPath.row];
        //设置cell选中风格
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

#pragma mark - UITableViewDelegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 65.0;
    }else{
        return 95.0;
    }
}

@end
