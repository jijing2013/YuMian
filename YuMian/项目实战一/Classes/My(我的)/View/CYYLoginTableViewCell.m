//
//  CYYLoginTableViewCell.m
//  项目实战一
//
//  Created by ma c on 16/4/15.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "CYYLoginTableViewCell.h"

@interface CYYLoginTableViewCell ()
@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation CYYLoginTableViewCell
#pragma mark - setter methods

-(void)setData:(CYYLoginDataModel *)data{
    _data = data;
    self.image.image = [UIImage imageNamed:data.image];
    self.titleLabel.text = data.title;
}

- (UIImageView *)image{
    if (!_image) {
        _image = [[UIImageView alloc] init];
        _image.layer.cornerRadius = 10;
        _image.layer.masksToBounds = YES;
    }
    return _image;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _titleLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.image];
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    WS(weakSelf);
    [_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(15);
        make.left.equalTo(weakSelf.mas_left).offset(10);
        make.size.equalTo(CGSizeMake(20, 20));
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.image.mas_right).offset(15);
        make.height.equalTo(20);
        make.width.equalTo(SCREEN_WIDTH - 100);
        make.centerY.equalTo(weakSelf.image.mas_centerY);
    }];
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
