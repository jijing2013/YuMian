//
//  CYYDetailAllImageView.h
//  项目实战一
//
//  Created by ma c on 16/4/8.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^imageHeightBlock)(CGFloat height);
@interface CYYDetailAllImageView : UIView

@property (nonatomic, strong) NSArray *imageArray;

@property (nonatomic, copy) imageHeightBlock imageBlock;
@end
