//
//  ItemDetailModel.h
//  WTSProject
//
//  Created by Charlot on 2017/3/31.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemDetailModel : NSObject

//单号
@property (copy,nonatomic)NSString *nr;

//件数
@property (assign, nonatomic) unsigned int kltContent;

//扫描时间
@property (copy, nonatomic) NSString *checkedAt;

- (NSArray *)getDataWithObject:(NSArray *)dictArray;
@end
