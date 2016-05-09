//
//  CYYfindGoodsImgListModel.h
//  项目实战一
//
//  Created by ma c on 16/4/8.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYYfindGoodsImgListModel : NSObject

//图片地址 ： ImgView
//图片类型 ： ImgType   【1.轮播位图片；2.详情图片；3.实拍图片】
//图片高度 ： Resolution
@property (nonatomic, copy) NSString *ImgView;

@property (nonatomic, copy) NSString *ImgType;
@property (nonatomic, copy) NSString *Resolution;

@end
