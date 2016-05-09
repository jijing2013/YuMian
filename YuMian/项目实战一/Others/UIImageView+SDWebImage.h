//
//  UIImageView+SDWebImage.h
//  01-实战练习
//
//  Created by 大欢 on 16/3/6.
//  Copyright © 2016年 大欢. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"

typedef void (^DownloadSuccessBlock) (SDImageCacheType cacheType, UIImage *image);
typedef void (^DownloadFailureBlock) (NSError *error);
typedef void (^DownloadProgressBlock) (CGFloat progress);

@interface UIImageView (SDWebImage)

/**
 *  SDWebImage 下载并缓存图片
 *
 *  @param url 图片的url
 *
 *  @param place 还未下载成功时的替换图片
 *
 */
- (void)downloadImage:(NSString *)url
                place:(UIImage *)place;

/**
 *  SDWebImage 下载并缓存图片和下载进度
 *
 *  @param url 图片的url
 *
 *  @param place 还未下载成功时的替换图片
 *
 *  @param success 图片下载成功
 *
 *  @param failure 图片下载失败
 *
 *  @param progress 图片下载进度
 */
- (void)downloadImage:(NSString *)url
                place:(UIImage *)place
              success:(DownloadSuccessBlock)success
              failure:(DownloadFailureBlock)failure
             received:(DownloadProgressBlock)progress;



@end
