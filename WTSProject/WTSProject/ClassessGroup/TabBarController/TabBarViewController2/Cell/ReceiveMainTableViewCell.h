//
//  ReceiveMainTableViewCell.h
//  WTSProject
//
//  Created by Charlot on 2017/4/10.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReceiveMainTableViewCell : UITableViewCell
@property (nonatomic,strong)UILabel *orderNumberLabel;
@property (nonatomic,strong)UILabel *orderTypeLabel;
@property (nonatomic,strong)UILabel *toWareHouseLabel;
@property (nonatomic,strong)UILabel *receiveTypeLabel;
@property (nonatomic,strong)UILabel *carNrLabel;
@property (nonatomic,strong)UILabel *driverNameLabel;
@property (nonatomic,strong)UILabel *receiveTimeLabel;
@property (nonatomic,strong)UILabel *createTimeLabel;

-(void)setCellDataWithOrder:(NSString *)oriderStr orderType:(NSString *)orderTypeStr toWhereHouse:(NSString *)toWhereHouseStr driver:(NSString *)driverStr carNr:(NSString *)carNrStr createTimeType:(NSString *)createTimeTypeStr;

@end
