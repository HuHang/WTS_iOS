//
//  OrderIfonListViewController.h
//  WTSProject
//
//  Created by Charlot on 2017/3/28.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import <XLForm/XLForm.h>
#import "AddressInfoModel.h"

@interface OrderIfonListViewController : XLFormViewController
@property (nonatomic,strong)AddressInfoModel *sourceWhouse;
@property (nonatomic,strong)AddressInfoModel *destinationWhouse;
@end
