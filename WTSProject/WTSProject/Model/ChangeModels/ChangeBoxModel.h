//
//  ChangeBoxModel.h
//  WTSProject
//
//  Created by Charlot on 2017/4/5.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChangeBoxModel : NSObject


@property (assign, nonatomic) unsigned int ID;
//单号
@property (copy,nonatomic)NSString *nr;
//扫描时间
@property (copy,nonatomic)NSString *checkedAt;
//零件号
@property (copy,nonatomic)NSString *partNr;
//订单号
@property (copy,nonatomic)NSString *orderno;
- (NSArray *)getDataWithObject:(NSArray *)dictArray;
@end
