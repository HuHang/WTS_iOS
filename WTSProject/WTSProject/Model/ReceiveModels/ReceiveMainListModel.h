//
//  ReceiveMainListModel.h
//  WTSProject
//
//  Created by Charlot on 2017/4/10.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReceiveMainListModel : NSObject
@property (assign, nonatomic)unsigned int ID;
//
@property (copy, nonatomic)NSString *nr;
//创建时间
@property (copy, nonatomic)NSString *receivedAt;
//车号
@property (copy, nonatomic)NSString *carNr;
//司机
@property (copy, nonatomic)NSString *driverName;
//目的仓库
@property (copy, nonatomic)NSString *toWhouseName;

//状态
@property (copy, nonatomic)NSString *statusStr;
- (NSArray *)getDataWithObject:(NSArray *)dictArray;
@end
