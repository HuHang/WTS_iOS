//
//  MainListModel.m
//  WTSProject
//
//  Created by Charlot on 2017/3/29.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import "MainListModel.h"

@implementation MainListModel

- (instancetype)init {
    self = [super init];
    
    return self;
}

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property{
    if ([NSString isEmpty:oldValue]) {
        return  @"";
    }
    return oldValue;
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID": @"id"};
}

- (NSArray *)getDataWithObject:(NSArray *)dictArray{
    NSArray *taskArray = [MainListModel mj_objectArrayWithKeyValuesArray:dictArray];
    return taskArray;
}

@end
