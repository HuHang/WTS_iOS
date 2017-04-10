//
//  BoxItemTableModel.h
//  WTSProject
//
//  Created by Charlot on 2017/3/31.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BoxItemTableModel : NSObject
@property (assign, nonatomic) unsigned int ID;
//单号
@property (copy,nonatomic)NSString *partNr;
//订单号
@property (copy,nonatomic)NSString *orderno;

//托盘总
@property (assign, nonatomic) unsigned int trayCount;
//托盘
@property (assign, nonatomic) unsigned int singlePackageCount;

//箱 总
@property (assign, nonatomic) unsigned int checkedPackageCount;
//箱
@property (assign, nonatomic) unsigned int checkedTrayCount;


//createdAt
//updatedAt

- (NSArray *)getDataWithObject:(NSArray *)dictArray;
@end
