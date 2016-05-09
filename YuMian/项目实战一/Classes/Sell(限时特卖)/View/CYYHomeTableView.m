//
//  CYYHomeTableView.m
//  项目实战一
//
//  Created by ma c on 16/4/6.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "CYYHomeTableView.h"
#import "CYYSingleTableViewCell.h"
#import "CYYGroupTableViewCell.h"

static NSString *identifier1 = @"CYYSingleTableViewCell";
static NSString *identifier2 = @"CYYGroupTableViewCell";

@interface CYYHomeTableView ()<UITableViewDelegate, UITableViewDataSource>

@end
@implementation CYYHomeTableView
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self registerClass:[CYYSingleTableViewCell class] forCellReuseIdentifier:identifier1];
        [self registerClass:[CYYGroupTableViewCell class] forCellReuseIdentifier:identifier2];
    }
    return self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //根据isSingle的值来设定对应cell的个数
    if (_isSingle) {
        return _singleListArray.count;
    }else{
        return _groupBuyListArray.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    //根据isSingle的值来设定对应cell的高度
    if (_isSingle) {
        return 170;
    }else
        return 175;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
     //根据isSingle的值来判断显示哪一个cell
    if (_isSingle) {
        CYYSingleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier1];
        cell.singleList = self.singleListArray[indexPath.row];
        return cell;
    }else{
        CYYGroupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier2];
        cell.groupList = self.groupBuyListArray[indexPath.row];
        return cell;
    }
    
}

//选择跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_isSingle) {
        if (_selectSingle) {
            _selectSingle([self.singleListArray[indexPath.row] GoodsId]);
        }
    }else{
        if (_selectGroup) {
            _selectGroup([self.groupBuyListArray[indexPath.row] ActivityId]);
        }
    }
}
@end
