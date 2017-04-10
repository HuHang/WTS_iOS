//
//  MainListModel.h
//  WTSProject
//
//  Created by Charlot on 2017/3/29.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MainListModel : NSObject
@property (assign, nonatomic) unsigned int ID;

@property (assign, nonatomic) unsigned int carId;

//任务单号
@property (copy, nonatomic)NSString *deliveryNodeNr;
//取货时间
@property (copy, nonatomic)NSString *deliveryNodeGoToPickDateTime;
//到货时间
@property (copy, nonatomic)NSString *deliveryNodeShouldSentArrivalDateTime;
//类型
@property (assign, nonatomic) unsigned int deliveryNodeDeliveryMode;
//车队判断
@property (assign, nonatomic) BOOL deliveryNodeIsCarTroopDelivery;

//始发地
@property (copy, nonatomic)NSDictionary *deliveryNodeSourceWhouse;
//目的地
@property (copy, nonatomic)NSDictionary *deliveryNodeDestinationWhouse;
//转运单判断
@property (assign, nonatomic) BOOL isSent;
//转运单判断
@property (assign, nonatomic) BOOL isPickOver;

- (NSArray *)getDataWithObject:(NSArray *)dictArray;
@end
