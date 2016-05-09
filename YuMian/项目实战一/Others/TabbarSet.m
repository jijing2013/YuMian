//
//  TabbarSet.m
//  仿美团
//
//  Created by ma c on 16/3/5.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "TabbarSet.h"
#import "DockItem.h"

#define kTag 1000
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface TabbarSet()

@property (strong, nonatomic) NSArray *TabbarList;
@property (strong, nonatomic) DockItem *selectItem;

@end
@implementation TabbarSet

#pragma mark - setter and getter methods

- (NSArray *)TabbarList{
    if (!_TabbarList) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"TabbarList" ofType:@"plist"];
        _TabbarList = [NSArray arrayWithContentsOfFile:path];
    }
    return _TabbarList;
}

#pragma mark - life cycle

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        CGFloat width = SCREEN_WIDTH / self.TabbarList.count;
        for (NSInteger i = 0; i < self.TabbarList.count; i++) {
            NSDictionary *dict = self.TabbarList[i];
            DockItem *item = [DockItem buttonWithType:UIButtonTypeCustom];
            item.tag = kTag + i;
            [item setTitle:dict[@"title"] forState:UIControlStateNormal];
            [item setTitleColor:[UIColor colorWithRed:0 / 255.0 green:182 / 255.0 blue:245 / 255.0 alpha:1] forState:UIControlStateSelected];
            [item setTitleColor:[UIColor colorWithRed:200 / 255.0 green:200 / 255.0 blue:200 / 255.0 alpha:1] forState:UIControlStateNormal];
            
            [item setImage:[UIImage imageNamed:dict[@"normal"]] forState:UIControlStateNormal];
             [item setImage:[UIImage imageNamed:dict[@"selected"]] forState:UIControlStateSelected];
            
            item.frame = CGRectMake(width * i, 0, width, CGRectGetHeight(self.frame));
            [item addTarget:self action:@selector(doAction:) forControlEvents:UIControlEventTouchUpInside];
            
            
            [self addSubview:item];
            if (i == 0) {
                item.selected = YES;
                self.selectItem = item;
            }
        }
        
        //加线
        UIView * lineView = [[UIView alloc] init];
        lineView.backgroundColor = [UIColor whiteColor];
        lineView.frame = CGRectMake(0, 0, width, 2);
        lineView.tag = 100;
        [self addSubview:lineView];
   }
    return self;
}

#pragma mark - event hander

- (void)doAction:(DockItem *)button{
    if (button == self.selectItem) {
        return;
    }
    button.selected = YES;
    self.selectItem.selected = NO;
    self.selectItem = button;
    
    if ([self.delegate respondsToSelector:@selector(tabbar:selectedAtIndex:)]) {
        [self.delegate tabbar:self selectedAtIndex:button.tag - kTag];
    }
}

@end
