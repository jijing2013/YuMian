//
//  CYYBrandCollectionViewCell.m
//  项目实战一
//
//  Created by ma c on 16/4/13.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "CYYBrandCollectionViewCell.h"
#import "NSMutableAttributedString+Extension.h"

@interface CYYBrandCollectionViewCell ()

@property (nonatomic, strong) UIImageView *imagView;
@property (nonatomic ,strong) UIImageView *countryImgView;
@property (nonatomic, strong) UILabel *abbreviationLabel;
@property (nonatomic, strong) UILabel *priceLabel;

@end
@implementation CYYBrandCollectionViewCell

-(void)setBrandDataList:(CYYBrandCollectionModel *)brandDataList{
    _brandDataList = brandDataList;
    
    [self.imagView downloadImage:brandDataList.ImgView place:[UIImage imageNamed:@"default"]];
    [self.countryImgView downloadImage:brandDataList.CountryImg place:[UIImage imageNamed:@"default"]];
    self.priceLabel.attributedText = [NSMutableAttributedString stringThroughAttributeString:brandDataList.DomesticPrice backString:brandDataList.BuyCount rebateString:nil];
    self.abbreviationLabel.text = brandDataList.Abbreviation;
    
    if (_selectedGoods) {
        _selectedGoods(brandDataList.GoodsId);
    }
    
}

#pragma mark - setter methods
- (UIImageView *)imagView{
    if (!_imagView) {
        _imagView = [[UIImageView alloc] init];
    }
    return _imagView;
}

- (UIImageView *)countryImgView{
    if (!_countryImgView) {
        _countryImgView = [[UIImageView alloc] init];
        
    }
    return _countryImgView;
}

- (UILabel *)abbreviationLabel{
    if (!_abbreviationLabel) {
        _abbreviationLabel = [[UILabel alloc] init];
        _abbreviationLabel.textColor = [UIColor blackColor];
        _abbreviationLabel.font = [UIFont systemFontOfSize:18];
        _abbreviationLabel.numberOfLines = 0;
    }
    return _abbreviationLabel;
}

- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _priceLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imagView];
        [self addSubview:self.countryImgView];
        [self addSubview:self.priceLabel];
        [self addSubview:self.abbreviationLabel];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];

    CGFloat height = CGRectGetHeight(self.bounds);
    
    WS(weakSelf);
    [_countryImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(10);
        make.left.equalTo(weakSelf.mas_left).offset(10);
        make.size.equalTo(CGSizeMake(25, 20));
    }];
    

    [_imagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top);
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.height.equalTo(height * 0.7);
    }];
    
    
  //  self.imagView.frame = CGRectMake(0, 0, width, height - 90);
    
    [_abbreviationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.imagView.mas_bottom).offset(10);
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.height.equalTo(45);
    }];

    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.abbreviationLabel.mas_bottom).offset(12);
        make.left.equalTo(weakSelf.mas_left).offset(10);
        make.right.equalTo(weakSelf.mas_right).offset(-10);
        make.height.equalTo(23);
    }];
    
}

@end
