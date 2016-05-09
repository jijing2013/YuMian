//
//  TabbarSet.h
//  仿美团
//
//  Created by ma c on 16/3/5.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DockItemType) {
    DockItemTypeTuan,
    DockItemTypeFu,
    DockItemTypeShang,
    DockItemTypeMine,
    DockItemTypeGeng
};

@class TabbarSet;

@protocol TabbarSetDelegate <NSObject>

- (void)tabbar:(TabbarSet *)tabbar selectedAtIndex:(DockItemType)type;

@end
@interface TabbarSet : UIView

@property (weak, nonatomic) id<TabbarSetDelegate> delegate;

@end
