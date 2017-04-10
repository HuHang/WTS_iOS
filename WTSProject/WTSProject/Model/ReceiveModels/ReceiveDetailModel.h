//
//  ReceiveDetailModel.h
//  WTSProject
//
//  Created by Charlot on 2017/4/10.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReceiveDetailModel : NSObject
@property (assign, nonatomic)unsigned int ID;
@property (copy, nonatomic)NSString *nr;
@property (copy, nonatomic)NSString *partNr;
@property (copy, nonatomic)NSString *dockPointCode;
@property (copy, nonatomic)NSString *quantityperpack;
@property (copy, nonatomic)NSString *sendTime;
@end
