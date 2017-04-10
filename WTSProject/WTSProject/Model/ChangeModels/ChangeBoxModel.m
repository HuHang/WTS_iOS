//
//  ChangeBoxModel.m
//  WTSProject
//
//  Created by Charlot on 2017/4/5.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import "ChangeBoxModel.h"

@implementation ChangeBoxModel

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
    return [ChangeBoxModel mj_objectArrayWithKeyValuesArray:dictArray];
}

@end
