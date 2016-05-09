//
//  CYYClassCollectionViewCell.m
//  项目实战一
//
//  Created by ma c on 16/5/5.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "CYYClassCollectionViewCell.h"
#import "CYYClassModel.h"

@interface CYYClassCollectionViewCell ()
 /** 商品图片 */
@property (strong, nonatomic) UIImageView *iconImageView;
/** 商品品牌 */
@property (strong, nonatomic) UILabel *iconTitle;

@end
@implementation CYYClassCollectionViewCell

- (void)setClassModel:(CYYClassModel *)classModel{
    _classModel = classModel;
    [self.iconImageView downloadImage:classModel.ImgView place:[UIImage imageNamed:@"default"]];
    self.iconTitle.text = classModel.CommodityText;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.iconTitle];
        [self addSubview:self.iconImageView];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
    }
    return _iconImageView;
}

- (UILabel *)iconTitle{
    if (!_iconImageView) {
        _iconTitle = [[UILabel alloc] init];
        _iconTitle.font = [UIFont systemFontOfSize:12];
        _iconTitle.textColor = [UIColor blackColor];
        _iconTitle.textAlignment = NSTextAlignmentCenter;
    }
    return _iconTitle;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof(self) weakSelf = self;
    
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(10, 20, 30, 20));
    }];
    [_iconTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.iconImageView.mas_bottom);
        make.bottom.and.left.and.right.equalTo(weakSelf);
    }];
}
@end
