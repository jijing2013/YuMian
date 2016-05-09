//
//  CYYDetailGoodsContentView.m
//  项目实战一
//
//  Created by ma c on 16/4/8.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "CYYDetailGoodsContentView.h"
#import "NSString+help.h"
#import "NSMutableAttributedString+Extension.h"

@interface CYYDetailGoodsContentView ()
//商品名称
@property (nonatomic, strong) UILabel *goodsTitleLabel;
//价格
@property (nonatomic, strong) UILabel *priceLabel;
//线1
@property (nonatomic, strong) UILabel *lineLabel1;
//详情描述
@property (nonatomic, strong) UILabel *describeLabel;

@property (nonatomic, strong) UILabel *backLabel1;
//品牌图片
@property (nonatomic, strong) UIImageView *brandImage;
//品牌名称
@property (nonatomic, strong) UILabel *brandNameLabel;
//品牌国旗
@property (nonatomic, strong) UIImageView *countryImage;
//品牌国家
@property (nonatomic, strong) UILabel *countryNameLabel;
//查看同品牌
@property (nonatomic, strong) UILabel *sameBrandLabel;

@property (nonatomic, strong) UILabel *backLabel2;
//图文详情
@property (nonatomic, strong) UILabel *ImageTextLabel;
@property (nonatomic, strong) UILabel *lineLabel2;

@end

@implementation CYYDetailGoodsContentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.goodsTitleLabel];
        [self addSubview:self.priceLabel];
        [self addSubview:self.lineLabel1];
        [self addSubview:self.describeLabel];
        [self addSubview:self.backLabel1];
        [self addSubview:self.brandButton];
        [self addSubview:self.brandImage];
        [self addSubview:self.brandNameLabel];
        [self addSubview:self.countryImage];
        [self addSubview:self.countryNameLabel];
        [self addSubview:self.sameBrandLabel];
        [self addSubview:self.backLabel2];
        [self addSubview:self.ImageTextLabel];
        [self addSubview:self.lineLabel2];
    }
    return self;
}

- (void)layoutSubviews{
    WS(weakSelf);
    [_goodsTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(15);
        make.left.equalTo(weakSelf.mas_left).offset(30);
        make.right.equalTo(weakSelf.mas_right).offset(-30);
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.goodsTitleLabel.mas_bottom).offset(26);
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.height.equalTo(25);
    }];
    
    [_lineLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.priceLabel.mas_bottom).offset(26);
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.height.equalTo(1);
    }];
    
    [_describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.lineLabel1.mas_bottom).offset(18);
        make.left.equalTo(weakSelf.mas_left).offset(18);
        make.right.equalTo(weakSelf.mas_right).offset(-18);
    }];
    
    [_backLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.describeLabel.mas_bottom).offset(18);
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.height.equalTo(10);
    }];
    
    [_brandButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backLabel1.mas_bottom);
        make.left.equalTo(weakSelf.mas_left);
        make.size.equalTo(CGSizeMake(SCREEN_WIDTH, 80));
    }];
    
    [_brandImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.size.equalTo(CGSizeMake(50, 50));
        make.centerY.equalTo(weakSelf.brandButton.mas_centerY);
    }];
    
    [_brandNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.brandImage.mas_top).offset(5);
        make.left.equalTo(weakSelf.brandImage.mas_right).offset(16);
        make.width.equalTo(200);
        make.height.equalTo(16);
    }];
    
    [_countryImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(weakSelf.brandImage.mas_right).offset(15);
        make.bottom.equalTo(weakSelf.brandImage.mas_bottom).offset(-5);
        make.size.equalTo(CGSizeMake(20, 16));
    }];
    
    [_countryNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.countryImage.mas_right).offset(10);
        make.width.equalTo(160);
        make.height.equalTo(16);
        make.centerY.equalTo(weakSelf.countryImage.mas_centerY);
    }];
    
    [_sameBrandLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).equalTo(-30);
        make.centerY.equalTo(weakSelf.brandButton.mas_centerY);
        make.size.equalTo(CGSizeMake(120, 15));
    }];
    
    [_backLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.brandButton.mas_bottom);
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.height.equalTo(10);
    }];
    
    [_ImageTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backLabel2.mas_bottom).offset(18);
        make.left.equalTo(weakSelf.mas_left).offset(16);
        make.size.equalTo(CGSizeMake(70, 15));
    }];
    
    [_lineLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.ImageTextLabel.mas_bottom).offset(18);
        make.left.equalTo(weakSelf.mas_left).offset(16);
        make.right.equalTo(weakSelf.mas_right).offset(-16);
        make.height.equalTo(1);
    }];
}


#pragma mark - setter methods

- (void)setGoodsDetailModel:(CYYfindGoodsDetailModel *)goodsDetailModel{
    
    _goodsDetailModel = goodsDetailModel;
    
    //设置标题文本
    self.goodsTitleLabel.text = goodsDetailModel.Abbreviation;
    CGFloat titleHeight = [NSString autoHeightWithString:goodsDetailModel.Abbreviation Width:SCREEN_WIDTH - 60 Font:[UIFont boldSystemFontOfSize:18.0]];
    [_goodsTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(titleHeight);
    }];
    
    //设置价格
    self.priceLabel.attributedText = [NSMutableAttributedString stringThroughAttributeString:goodsDetailModel.Price backString:goodsDetailModel.OriginalPrice rebateString:goodsDetailModel.Discount];
    //设置详情
    self.describeLabel.text = goodsDetailModel.GoodsIntro;
    CGFloat describeHeight = [NSString autoHeightWithString:goodsDetailModel.GoodsIntro Width:SCREEN_WIDTH - 36 Font:[UIFont systemFontOfSize:16.0]];
    [_describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(describeHeight);
    }];
    [self.brandImage downloadImage:goodsDetailModel.ShopImage place:[UIImage imageNamed:@"default"]];
    self.brandNameLabel.text = goodsDetailModel.BrandCNName;
    self.countryNameLabel.text = goodsDetailModel.CountryName;
    
    if (_heightBlock) {
        _heightBlock(296 + titleHeight + describeHeight);
    }
    
    if (_ShopIdBlock) {
        _ShopIdBlock(goodsDetailModel.ShopId);
    }
    
}

- (UILabel *)goodsTitleLabel{
    if (!_goodsTitleLabel) {
        _goodsTitleLabel = [[UILabel alloc] init];
        _goodsTitleLabel.textAlignment = NSTextAlignmentCenter;
        _goodsTitleLabel.font = [UIFont boldSystemFontOfSize:18];
        _goodsTitleLabel.numberOfLines = 0;
        _goodsTitleLabel.textColor = [UIColor blackColor];
    }
    return _goodsTitleLabel;
}

- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _priceLabel;
}

- (UILabel *)lineLabel1{
    if (!_lineLabel1) {
        _lineLabel1 = [[UILabel alloc] init];
        _lineLabel1.backgroundColor = RGB(245, 245, 245);
    }
    return _lineLabel1;
}

- (UILabel *)describeLabel{
    if (!_describeLabel) {
        _describeLabel = [[UILabel alloc] init];
        _describeLabel.numberOfLines = 0;
        _describeLabel.textAlignment = NSTextAlignmentLeft;
        _describeLabel.font = [UIFont systemFontOfSize:14];
    }
    return _describeLabel;
}

- (UILabel *)backLabel1{
    if (!_backLabel1) {
        _backLabel1 = [[UILabel alloc] init];
        _backLabel1.backgroundColor = RGB(245, 245, 245);
    }
    return _backLabel1;
}

- (UIButton *)brandButton{
    if (!_brandButton) {
        _brandButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _brandButton.backgroundColor = [UIColor whiteColor];
    }
    return _brandButton;
}

- (UIImageView *)brandImage{
    if (!_brandImage) {
        _brandImage = [[UIImageView alloc] init];
        _brandImage.layer.cornerRadius = 20;
    }
    return _brandImage;
}

- (UILabel *)brandNameLabel{
    if (!_brandNameLabel) {
        _brandNameLabel = [[UILabel alloc] init];
        _brandNameLabel.textAlignment = NSTextAlignmentLeft;
        _brandNameLabel.font = [UIFont systemFontOfSize:15];
        _brandNameLabel.textColor = RGB(23, 23, 23);
    }
    return _brandNameLabel;
}

- (UIImageView *)countryImage{
    if (!_countryImage) {
        _countryImage = [[UIImageView alloc] init];
        _countryImage.image = [UIImage imageNamed:@"default"];
//        _countryImage.backgroundColor = [UIColor redColor];
    }
    return _countryImage;
}

- (UILabel *)countryNameLabel{
    if (!_countryNameLabel) {
        _countryNameLabel = [[UILabel alloc] init];
        _countryNameLabel.font = [UIFont systemFontOfSize:15];
        _countryNameLabel.textAlignment = NSTextAlignmentLeft;
       
    }
    return _countryNameLabel;
}

- (UILabel *)sameBrandLabel{
    if (!_sameBrandLabel) {
        _sameBrandLabel = [[UILabel alloc] init];
        _sameBrandLabel.text = @"(查看同品牌商品)";
        _sameBrandLabel.textAlignment = NSTextAlignmentRight;
        _sameBrandLabel.textColor = [UIColor grayColor];
        _sameBrandLabel.font = [UIFont systemFontOfSize:15];
    }
    return _sameBrandLabel;
}
- (UILabel *)backLabel2{
    if (!_backLabel2) {
        _backLabel2 = [[UILabel alloc] init];
        _backLabel2.backgroundColor = RGB(245, 245, 245);
    }
    return _backLabel2;
}

- (UILabel *)ImageTextLabel{
    if (!_ImageTextLabel) {
        _ImageTextLabel = [[UILabel alloc] init];
        _ImageTextLabel.textAlignment = NSTextAlignmentLeft;
        _ImageTextLabel.font = [UIFont systemFontOfSize:15];
        _ImageTextLabel.text = @"图文详情";
    }
    return _ImageTextLabel;
}

- (UILabel *)lineLabel2{
    if (!_lineLabel2) {
        _lineLabel2 = [[UILabel alloc] init];
        _lineLabel2.backgroundColor = RGB(245, 245, 245);
    }
    return _lineLabel2;
}
@end
