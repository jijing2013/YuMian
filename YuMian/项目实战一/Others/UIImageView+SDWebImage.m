//
//  UIImageView+SDWebImage.m
//  01-实战练习
//
//  Created by 大欢 on 16/3/6.
//  Copyright © 2016年 大欢. All rights reserved.
//

#import "UIImageView+SDWebImage.h"

@implementation UIImageView (SDWebImage)

- (void)downloadImage:(NSString *)url
                place:(UIImage *)place
{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:place options:SDWebImageLowPriority | SDWebImageRetryFailed];
}


- (void)downloadImage:(NSString *)url
                place:(UIImage *)place
              success:(DownloadSuccessBlock)success
              failure:(DownloadFailureBlock)failure
             received:(DownloadProgressBlock)progress
{

    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:place options:SDWebImageRetryFailed | SDWebImageLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
        progress((float)receivedSize/expectedSize);
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (error) {
            failure(error);
        }else{
            // image是下载好的图片
            self.image = image;
            success(cacheType, image);
        }
    }];
}

@end
