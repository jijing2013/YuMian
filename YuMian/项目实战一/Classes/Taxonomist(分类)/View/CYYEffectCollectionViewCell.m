//
//  CYYEffectCollectionViewCell.m
//  项目实战一
//
//  Created by ma c on 16/5/5.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "CYYEffectCollectionViewCell.h"
#import "CYYEffectClassModel.h"

@interface CYYEffectCollectionViewCell ()

/** 标题 */
@property (strong, nonatomic)   UILabel *iconTitle;
/** 图片 */
@property (strong, nonatomic)   UIImageView *iconImage;
@end
@implementation CYYEffectCollectionViewCell

- (void)setEffectModel:(CYYEffectClassModel *)effectModel{
    _effectModel = effectModel;
    [self.iconImage downloadImage:effectModel.ImgView place:[UIImage imageNamed:@"default"]];
    self.iconTitle.text = effectModel.GoodsTypeName;
    
}
- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.iconImage];
        [self addSubview:self.iconTitle];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (UILabel *)iconTitle{
    if (!_iconTitle) {
        _iconTitle = [[UILabel alloc] init];
        _iconTitle.font = [UIFont systemFontOfSize:12];
        _iconTitle.textColor = [UIColor blackColor];
        _iconTitle.textAlignment = NSTextAlignmentCenter;
    }
    return _iconTitle;
}

- (UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc] init];
    }
    return _iconImage;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof(self) weakSelf = self;
    
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(10, 20, 30, 20));
    }];
    [_iconTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.iconImage.mas_bottom);
        make.bottom.and.left.and.right.equalTo(weakSelf);
    }];
}

@end
