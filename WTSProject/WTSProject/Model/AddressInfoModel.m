//
//  AddressInfoModel.m
//  WTSProject
//
//  Created by Charlot on 2017/3/29.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import "AddressInfoModel.h"

@implementation AddressInfoModel

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property{
    if ([NSString isEmpty:oldValue]) {
        return  @"暂无";
    }
    return oldValue;
}

- (AddressInfoModel*)getAddressInfo:(NSDictionary *)dictionary{
    AddressInfoModel *addressInfo = [AddressInfoModel mj_objectWithKeyValues:dictionary];
    return addressInfo;
}
@end
