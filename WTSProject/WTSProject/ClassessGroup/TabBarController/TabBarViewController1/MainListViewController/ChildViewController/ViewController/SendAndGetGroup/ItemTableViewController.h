//
//  ItemTableViewController.h
//  WTSProject
//
//  Created by Charlot on 2017/3/29.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemTableViewController : UITableViewController

@property int deliveryNodeId;
@property int carID;
@property int transportId;

@property(nonatomic,strong)NSString *orderNumber;

@end
