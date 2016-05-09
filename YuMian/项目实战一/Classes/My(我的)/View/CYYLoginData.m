//
//  CYYLoginData.m
//  项目实战一
//
//  Created by ma c on 16/4/15.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "CYYLoginData.h"
#import "CYYLoginDataModel.h"
@implementation CYYLoginData

+ (NSArray *)loadData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"LoginData" ofType:@"plist"];
    
    NSArray *dataListArray = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *dataList = [NSMutableArray array];
    for (NSDictionary *dict in dataListArray) {
        CYYLoginDataModel *model = [[CYYLoginDataModel alloc] init];
        [model setValuesForKeysWithDictionary:dict];
        [dataList addObject:model];
    }
    return dataList;
}

@end
