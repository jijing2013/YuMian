//
//  CYYMakeSureAddTableViewCell.m
//  项目实战一
//
//  Created by ma c on 16/5/4.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "CYYMakeSureAddTableViewCell.h"

@interface CYYMakeSureAddTableViewCell ()
/** 背景图片 */
@property (strong, nonatomic)   UIImageView *backImageView;
/** 地址图标 */
@property (strong, nonatomic)   UIImageView *addressImage;
 /** 收货人 */
@property (strong, nonatomic)   UILabel *consigneeLabel;
/** 收货地址 */
@property (strong, nonatomic)   UILabel *addressLabel;
/** 电话 */
@property (strong, nonatomic)   UILabel *telephoneNumber;
@end


@implementation CYYMakeSureAddTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.backImageView];
        [self addSubview:self.addressImage];
        [self addSubview:self.consigneeLabel];
        [self addSubview:self.addressLabel];
        [self addSubview:self.telephoneNumber];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    WS(weakSelf);
    [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf);
    }];
    
    [_addressImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.size.equalTo(CGSizeMake(24, 24));
        make.left.equalTo(15);
    }];
    
    [_consigneeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(16);
        make.left.equalTo(weakSelf.addressImage.mas_right).offset(10);
        make.size.equalTo(CGSizeMake(130, 15));
    }];
    
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.consigneeLabel.mas_bottom).offset(7);
        make.right.equalTo(weakSelf.mas_right).offset(-30);
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.left.equalTo(weakSelf.addressImage.mas_right).offset(10);
    }];
    
    [_telephoneNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.consigneeLabel.mas_right);
        make.top.equalTo(weakSelf.consigneeLabel.mas_top);
        make.height.equalTo(15);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
    }];
}

- (UIImageView *)backImageView{
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"地址背景"]];;
    }
    return _backImageView;
}

- (UIImageView *)addressImage{
    if (!_addressImage) {
        _addressImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"位置"]];
    }
    return _addressImage;
}

- (UILabel *)consigneeLabel{
    if (!_consigneeLabel) {
        _consigneeLabel = [[UILabel alloc]init];
        _consigneeLabel.textColor = RGB(50, 50, 50);
        _consigneeLabel.font = [UIFont systemFontOfSize:15.0];
        _consigneeLabel.text = @"在哪儿";
        _consigneeLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _consigneeLabel;
}

- (UILabel *)addressLabel{
    if (!_addressLabel) {
        _addressLabel = [[UILabel alloc]init];
        _addressLabel.textColor = RGB(50, 50, 50);
        _addressLabel.font = [UIFont systemFontOfSize:14.0];
        _addressLabel.text = @"北京市昌平区北七家镇东三旗村";
        _addressLabel.numberOfLines = 2;
    }
    return _addressLabel;
}

- (UILabel *)telephoneNumber{
    if (!_telephoneNumber) {
        _telephoneNumber = [[UILabel alloc]init];
        _telephoneNumber.textColor = RGB(50, 50, 50);
        _telephoneNumber.text = @"15779632865";
        _telephoneNumber.font = [UIFont systemFontOfSize:15.0];
    }
    return _telephoneNumber;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
