//
//  CYYGroupTableViewCell.m
//  项目实战一
//
//  Created by ma c on 16/4/6.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "CYYGroupTableViewCell.h"

@interface CYYGroupTableViewCell ()

@property (strong, nonatomic)   UIImageView *groupImage;

@end
@implementation CYYGroupTableViewCell

- (void)setGroupList:(GroupModel *)groupList{
    [self.groupImage downloadImage:groupList.ImgView place:[UIImage imageNamed:@"default.jpg"]];
}

#pragma mark - setter methods
- (UIImageView *)groupImage{
    if (!_groupImage) {
        _groupImage = [[UIImageView alloc]init];
    }
    return _groupImage;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self addSubview:self.groupImage];
        self.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

- (void)layoutSubviews{
    WS(weakSelf);
    [_groupImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(0, 0, 10, 0));
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
