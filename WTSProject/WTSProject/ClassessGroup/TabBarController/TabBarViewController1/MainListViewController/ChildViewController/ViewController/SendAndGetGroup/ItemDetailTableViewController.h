//
//  ItemDetailTableViewController.h
//  WTSProject
//
//  Created by Charlot on 2017/3/30.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SGQRCode.h"

@interface ItemDetailTableViewController : UITableViewController
@property int deliveryNodeId;
@property int carID;
@property int transportId;
@property int positionId;

@property(nonatomic,strong)NSString *orderNumber;
@end
