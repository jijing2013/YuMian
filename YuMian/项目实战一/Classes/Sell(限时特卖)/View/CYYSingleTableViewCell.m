//
//  CYYSingleTableViewCell.m
//  项目实战一
//
//  Created by ma c on 16/4/6.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "CYYSingleTableViewCell.h"
#import "NSMutableAttributedString+Extension.h"
@interface CYYSingleTableViewCell ()

@property (strong, nonatomic)   UIImageView *goodsImage;          /** 商品图片 */
@property (strong, nonatomic)   UIImageView *countryImage;        /** 国旗 */
@property (strong, nonatomic)   UILabel *titleLabel;              /** 显示标题label */
@property (strong, nonatomic)   UILabel *priceLabel;              /** 显示价格label */
@property (strong, nonatomic)   UIButton *buyCarButton;           /** 购物车button */
@property (strong, nonatomic)   UILabel *lineLabel;               /** 分割线label */
@property (strong, nonatomic)   UILabel *contentLabel;            /** 内容Label */

@end

@implementation CYYSingleTableViewCell

- (void)setSingleList:(SingleModel *)singleList{
    
    
    [_goodsImage downloadImage:singleList.ImgView place:[UIImage imageNamed:@"default.jpg"]];
    [_countryImage downloadImage:singleList.CountryImg place:[UIImage imageNamed:@"default.jpg"]];
    _titleLabel.text = singleList.Title;
    _contentLabel.text = singleList.GoodsIntro;
    
    _priceLabel.attributedText = [NSMutableAttributedString stringThroughAttributeString:singleList.DomesticPrice backString:singleList.Price rebateString:nil];
}

- (UIImageView *)goodsImage{
    if (!_goodsImage) {
        _goodsImage = [[UIImageView alloc]init];
    }
    return _goodsImage;
}

- (UIImageView *)countryImage{
    if (!_countryImage) {
        _countryImage = [[UIImageView alloc]init];
    }
    return _countryImage;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.numberOfLines = 4;
        _titleLabel.font = [UIFont systemFontOfSize:18.0];
    }
    return _titleLabel;
}

- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]init];
    }
    return _priceLabel;
}

- (UIButton *)buyCarButton{
    if (!_buyCarButton) {
        _buyCarButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_buyCarButton setImage:[UIImage imageNamed:@"限时特卖界面购物车图标"] forState:(UIControlStateNormal)];
        
    }
    return _buyCarButton;
}

- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont systemFontOfSize:15.0];
        _contentLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _contentLabel;
}
- (UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = RGB(245, 245, 245);
    }
    return _lineLabel;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.goodsImage];
        self.goodsImage.backgroundColor = [UIColor blueColor];
        [self addSubview:self.countryImage];
        self.countryImage.backgroundColor = [UIColor grayColor];
        [self addSubview:self.titleLabel];
        [self addSubview:self.contentLabel];
        [self addSubview:self.priceLabel];
        [self addSubview:self.buyCarButton];
        [self addSubview:self.lineLabel];
    }
    return self;
}

- (void)layoutSubviews{
    WS(weakSelf);
    [_goodsImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(142, 142));
        make.left.equalTo(weakSelf.mas_left).offset(10);
        make.top.equalTo(weakSelf.mas_top).offset(12);
    }];
    
    [_countryImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.goodsImage.mas_top).offset(10);
        make.left.equalTo(weakSelf.goodsImage.mas_left).offset(10);
        make.size.equalTo(CGSizeMake(25, 20));
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.goodsImage.mas_right).offset(10);
        make.top.equalTo(weakSelf.mas_top).offset(25);
        make.right.equalTo(weakSelf.mas_right).offset(-17);
        make.height.equalTo(18);
    }];
    
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.titleLabel.mas_bottom);
        make.height.equalTo(60);
        make.right.equalTo(weakSelf.mas_right).offset(-17);
        make.left.equalTo(weakSelf.goodsImage.mas_right).offset(10);
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(17);
        make.left.equalTo(weakSelf.goodsImage.mas_right).offset(10);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-27);
        make.right.equalTo(weakSelf.mas_right).offset(-17);//
    }];
    
    [_buyCarButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(-45);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-20);
        make.size.equalTo(CGSizeMake(35, 35));
    }];
    
    [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(1);
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.height.equalTo(1);
    }];

}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
