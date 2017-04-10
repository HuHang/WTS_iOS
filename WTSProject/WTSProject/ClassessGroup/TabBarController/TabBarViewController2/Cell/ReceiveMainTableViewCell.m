//
//  ReceiveMainTableViewCell.m
//  WTSProject
//
//  Created by Charlot on 2017/4/10.
//  Copyright © 2017年 Charlot. All rights reserved.
//

/*
 @property (nonatomic,strong)UILabel *orderNumberLabel;
 @property (nonatomic,strong)UILabel *orderTypeLabel;
 @property (nonatomic,strong)UILabel *toWareHouseLabel;
 @property (nonatomic,strong)UILabel *receiveTypeLabel;
 @property (nonatomic,strong)UILabel *carNrLabel;
 @property (nonatomic,strong)UILabel *driverNameLabel;
 @property (nonatomic,strong)UILabel *receiveTimeLabel;
 @property (nonatomic,strong)UILabel *createTimeLabel;
 */

#import "ReceiveMainTableViewCell.h"


@implementation ReceiveMainTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 初始化子视图
        [self initLayout];
    }
    return self;
}

- (void)initLayout{
    self.orderNumberLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft) withTextColor:[UIColor blackColor] withFont:SystemFont(16.f)];
    self.orderTypeLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentCenter) withTextColor:WTSBlueColor withFont:SystemFont(12.f)];
    self.toWareHouseLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft) withTextColor:[UIColor blackColor] withFont:SystemFont(12.f)];
    self.carNrLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft) withTextColor:[UIColor blackColor] withFont:SystemFont(12.f)];
    self.driverNameLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft) withTextColor:[UIColor blackColor] withFont:SystemFont(12.f)];
    self.receiveTimeLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft) withTextColor:[UIColor blackColor] withFont:SystemFont(12.f)];
    
    [self.contentView addSubview:self.orderNumberLabel];
    [self.contentView addSubview:self.orderTypeLabel];
    [self.contentView addSubview:self.toWareHouseLabel];
    [self.contentView addSubview:self.carNrLabel];
    [self.contentView addSubview:self.driverNameLabel];
    [self.contentView addSubview:self.receiveTimeLabel];
    
    [self.orderTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.size.mas_equalTo(CGSizeMake(60, 40));
    }];
    [self.orderNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.mas_equalTo(10);
        make.right.equalTo(self.orderTypeLabel.mas_left);
        make.height.equalTo(self.orderTypeLabel);
    }];
    
    [self.toWareHouseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.orderNumberLabel);
        make.height.mas_equalTo(26);
        make.top.equalTo(self.orderNumberLabel.mas_bottom);
    }];
    
    [self.driverNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.height.equalTo(self.toWareHouseLabel);
        make.top.equalTo(self.toWareHouseLabel.mas_bottom);
        make.width.mas_equalTo(SCREEN_WIDTH/2);
    }];
    
    [self.carNrLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.height.equalTo(self.driverNameLabel);
        make.left.equalTo(self.driverNameLabel.mas_right);
        make.right.mas_equalTo(-10);
    }];
    
    [self.receiveTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.left.equalTo(self.toWareHouseLabel);
        make.top.equalTo(self.driverNameLabel.mas_bottom);
    }];
    
}

-(void)setCellDataWithOrder:(NSString *)oriderStr orderType:(NSString *)orderTypeStr toWhereHouse:(NSString *)toWhereHouseStr driver:(NSString *)driverStr carNr:(NSString *)carNrStr createTimeType:(NSString *)createTimeTypeStr{
    self.orderNumberLabel.text = oriderStr;
    self.orderTypeLabel.text = orderTypeStr;
    self.toWareHouseLabel.text = [NSString stringWithFormat:@"目的仓库:%@",toWhereHouseStr];
    self.driverNameLabel.text = [NSString stringWithFormat:@"司机:%@",driverStr];
    self.carNrLabel.text = [NSString stringWithFormat:@"车牌号:%@",carNrStr];
    self.createTimeLabel.text = oriderStr;
}

@end
