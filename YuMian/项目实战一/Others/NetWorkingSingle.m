//
//  NetWorkingSingle.m
//  项目实战一
//
//  Created by ma c on 16/4/6.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "NetWorkingSingle.h"
#import "AFNetworking.h"
#import "UIView+Toast.h"
#import <objc/runtime.h>
#import "SVProgressHUD.h"

@interface NetWorkingSingle ()

@property (strong, nonatomic) AFHTTPSessionManager *manager;

@end
@implementation NetWorkingSingle
- (instancetype)init{
    self = [super init];
    if (self) {
        self.manager = [AFHTTPSessionManager manager];
        //设置请求类型
        self.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        //设置响应类型
        self.manager.responseSerializer = [AFJSONResponseSerializer serializer];
        self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/json", @"text/javascript",@"text/plain",@"image/gif", nil];
        
    }
    return self;
}
+ (NetWorkingSingle *)sharedManager{
    
    static NetWorkingSingle *sharedNetWorkSingle = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedNetWorkSingle  = [[self alloc] init];
    });
    return sharedNetWorkSingle;
}

- (void)getDateWithUrl:(NSString *)url parameter:(NSDictionary *)parameter success:(successBlock)success failure:(failureBlock)failure{
    
    NSString *urlStr = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    
    [self.manager GET:urlStr parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [SVProgressHUD dismiss];
        
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"加载信息失败"];
        if (error) {
            failure(task, error);
        }
    }];
}

- (void)postDataWithUrl:(NSString *)url parameter:(NSDictionary *)parameter success:(successBlock)success failure:(failureBlock)failure{
    NSString *urlStr = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [self.manager POST:urlStr parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            failure(task, error);
        }
    }];
}
@end
