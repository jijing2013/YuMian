//
//  CYYBuyCarTableView.m
//  项目实战一
//
//  Created by ma c on 16/5/4.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "CYYBuyCarTableView.h"
#import "CYYBuyCarTableViewCell.h"
#import "CYYBuyCarModel.h"

static NSString *identifier = @"BuyCarTableViewCell";

@interface CYYBuyCarTableView ()<UITableViewDelegate, UITableViewDataSource>

@end
@implementation CYYBuyCarTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        self.backgroundColor = RGB(223, 223, 223);
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self registerClass:[CYYBuyCarTableViewCell class] forCellReuseIdentifier:identifier];
    }
    return self;
}

#pragma mark - UITableViewDataSource 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CYYBuyCarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.buyCarModel = self.dataArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.tag = indexPath.row + 100;
    [cell.addButton addTarget:self action:@selector(addButtonMethod:) forControlEvents:(UIControlEventTouchUpInside)];
    [cell.cutButton addTarget:self action:@selector(cutButtonMethod:) forControlEvents:(UIControlEventTouchUpInside)];
    [cell.selectButton addTarget:self action:@selector(selectButtonMethod:) forControlEvents:(UIControlEventTouchUpInside)];
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0;
}
//对cell进行编辑
- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    //添加一个删除按钮
    UITableViewRowAction *delete = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        //更新数据
        [self.dataArray removeObjectAtIndex:indexPath.row];
        [self updateDataArray];
        
        //更新UI
        [self deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
    }];
    return @[delete];
}

- (BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
#pragma mark - button事件 methods
//添加
- (void)addButtonMethod:(id)sender{
    UIView *cell = [sender superview];
    CYYBuyCarModel *model = self.dataArray[cell.tag - 100];
    [model setGoodsCount:model.GoodsCount + 1];
    [self updateDataArray];
    
    [self reloadData];
}
//减少
- (void)cutButtonMethod:(id)sender{
    UIView *cell = [sender superview];
    CYYBuyCarModel *model = self.dataArray[cell.tag - 100];
    if (model.GoodsCount > 1) {
        [model setGoodsCount:model.GoodsCount - 1];
        [self updateDataArray];
    }
    [self reloadData];
}

- (void)selectButtonMethod:(id)sender{
    UIView *cell = [sender superview];
    UIButton *selectButton = sender;
    CYYBuyCarModel *model = self.dataArray[cell.tag - 100];
    if (selectButton.selected) {
        [model setIsSelectButton:NO];
    }else{
        [model setIsSelectButton:YES];
    }
    [self updateDataArray];
    [self reloadData];
}
- (void)updateDataArray{
    if (_dataArrayBlock) {
        _dataArrayBlock(self.dataArray);
    }
}
@end
