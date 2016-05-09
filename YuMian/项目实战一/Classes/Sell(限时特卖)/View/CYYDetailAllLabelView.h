//
//  CYYDetailAllLabelView.h
//  项目实战一
//
//  Created by ma c on 16/4/8.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^labelHeight)(CGFloat height);
@interface CYYDetailAllLabelView : UIView
//存储数据模型的数组
@property (nonatomic, strong) NSArray *detailListModel;
//返回Label的高度
@property (nonatomic, copy) labelHeight labelHeightBlock;

@end
