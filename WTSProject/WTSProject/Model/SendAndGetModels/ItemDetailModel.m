//
//  ItemDetailModel.m
//  WTSProject
//
//  Created by Charlot on 2017/3/31.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import "ItemDetailModel.h"

@implementation ItemDetailModel


- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property{
    if ([NSString isEmpty:oldValue]) {
        return  @"";
    }
    return oldValue;
}


- (NSArray *)getDataWithObject:(NSArray *)dictArray{
    return [ItemDetailModel mj_objectArrayWithKeyValuesArray:dictArray];
}
@end
