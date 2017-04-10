//
//  BoxTableModel.m
//  WTSProject
//
//  Created by Charlot on 2017/3/31.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import "BoxTableModel.h"

@implementation BoxTableModel

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
    return [BoxTableModel mj_objectArrayWithKeyValuesArray:dictArray];
}
@end
