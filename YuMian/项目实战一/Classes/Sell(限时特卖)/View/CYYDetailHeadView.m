//
//  CYYDetailHeadView.m
//  项目实战一
//
//  Created by ma c on 16/4/8.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "CYYDetailHeadView.h"
#import "SXTCycleScrollView.h"

@interface CYYDetailHeadView ()

@property (strong, nonatomic)   UILabel *numberLabel;                 /** 显示已经卖掉的个数 */



@end

@implementation CYYDetailHeadView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.headImage];
        [self addSubview:self.numberLabel];
    }
    return self;
}
- (void)layoutSubviews{
    WS(weakSelf);
    [_headImage mas_makeConstraints:^(MASConstraintMaker *make) {

        make.edges.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(85, 22));
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-30);
        make.right.equalTo(weakSelf.mas_right).offset(11);
    }];
}
-(void)setHaveBuy:(NSString *)haveBuy{
   self.numberLabel.text = [NSString stringWithFormat:@"%@人已购买",haveBuy];
}


- (UILabel *)numberLabel{
    if (!_numberLabel) {
        _numberLabel = [[UILabel alloc]init];
        _numberLabel.layer.masksToBounds = YES;
        _numberLabel.layer.cornerRadius = 11.0;
        _numberLabel.backgroundColor = RGB(238, 74, 47);
        [_numberLabel setTextColor:[UIColor whiteColor]];
        _numberLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _numberLabel;
}

- (SXTHeadView *)headImage{
    if (!_headImage) {
        _headImage = [[SXTHeadView alloc]init];
    }
    return _headImage;
}




@end
