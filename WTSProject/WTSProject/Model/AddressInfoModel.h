//
//  AddressInfoModel.h
//  WTSProject
//
//  Created by Charlot on 2017/3/29.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressInfoModel : NSObject
@property (copy, nonatomic)NSString *nr;
@property (copy, nonatomic)NSString *name;
@property (copy, nonatomic)NSString *address;
@property (copy, nonatomic)NSString *typeStr;
@property (copy, nonatomic)NSString *linkMan;
@property (copy, nonatomic)NSString *linkPhone;

- (AddressInfoModel*)getAddressInfo:(NSDictionary *)dictionary;

@end
