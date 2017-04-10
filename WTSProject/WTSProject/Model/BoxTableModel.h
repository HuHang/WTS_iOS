//
//  BoxTableModel.h
//  WTSProject
//
//  Created by Charlot on 2017/3/31.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BoxTableModel : NSObject

@property (assign, nonatomic) unsigned int ID;
//单号
@property (copy,nonatomic)NSString *transportnumber;
//托盘 总
@property (assign, nonatomic) unsigned int totalTrayCount;
//托盘
@property (assign, nonatomic) unsigned int totalCheckedTrayCount;

//箱 总
@property (assign, nonatomic) unsigned int totalCheckedPackageCount;
//箱
@property (assign, nonatomic) unsigned int totalDeliveryCheckedPackageCount;

//卸货口
@property (copy,nonatomic)NSString *customerdock;
//供应商
@property (copy,nonatomic)NSString *supplierName;

- (NSArray *)getDataWithObject:(NSArray *)dictArray;
@end
