//
//  NetWorkingSingle.h
//  项目实战一
//
//  Created by ma c on 16/4/6.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

#define TIMEOUT 30

typedef void(^successBlock) (NSURLSessionDataTask *task, id responseObject);
typedef void(^failureBlock) (NSURLSessionDataTask *task, NSError *error);
@interface NetWorkingSingle : NSObject

+ (NetWorkingSingle *)sharedManager;

- (void)getDateWithUrl:(NSString *)url parameter:(NSDictionary *)parameter success:(successBlock)success failure:(failureBlock)failure;

- (void)postDataWithUrl:(NSString *)url parameter:(NSDictionary *)parameter success:(successBlock)success failure:(failureBlock)failure;

@end
