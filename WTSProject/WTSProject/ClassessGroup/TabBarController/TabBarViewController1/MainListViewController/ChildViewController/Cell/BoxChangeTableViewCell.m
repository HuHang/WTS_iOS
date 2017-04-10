//
//  BoxChangeTableViewCell.m
//  WTSProject
//
//  Created by Charlot on 2017/3/29.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import "BoxChangeTableViewCell.h"

@implementation BoxChangeTableViewCell

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
    self.signView = [UILabel labelWithString:@"箱"
                           withTextAlignment:(NSTextAlignmentCenter)
                               withTextColor:[UIColor whiteColor]
                         withBackgroundColor:UIColorFromHEX(0x20B2AA, 1.0)
                                    withFont:SystemFont(18.f)];
    self.numberLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft)
                                         withTextColor:[UIColor blackColor]
                                              withFont:SystemFont(16.f)];
    self.orderLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft)
                                        withTextColor:[UIColor blackColor]
                                             withFont:SystemFont(12.f)];
    self.timeLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft)
                                         withTextColor:[UIColor blackColor]
                                              withFont:SystemFont(12.f)];
    self.boxLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft)
                                      withTextColor:[UIColor blackColor]
                                           withFont:SystemFont(12.f)];
    
    
    
    [self.contentView addSubview:self.signView];
    [self.contentView addSubview:self.numberLabel];
    [self.contentView addSubview:self.orderLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.boxLabel];
    
    
    [self.signView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 40));
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.mas_equalTo(16);
    }];
    
    [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.equalTo(self.signView.mas_right).with.mas_offset(18);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(30);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(20);
        make.left.and.right.equalTo(self.numberLabel);
        make.top.equalTo(self.numberLabel.mas_bottom);
    }];
    
    [self.orderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.left.equalTo(self.timeLabel);
        make.top.equalTo(self.timeLabel.mas_bottom);
    }];
    
    [self.boxLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.left.equalTo(self.orderLabel);
        make.top.equalTo(self.orderLabel.mas_bottom);
    }];
 
    
    
    self.signView.layer.cornerRadius = 20;
    self.signView.layer.masksToBounds = YES;
    self.boxLabel.adjustsFontSizeToFitWidth = YES;
    self.timeLabel.adjustsFontSizeToFitWidth = YES;
    
    
}

- (void)setCellDataWith:(NSString *)numberStr
               orderStr:(NSString *)orderStr
                timeStr:(NSString *)timeStr
                 boxStr:(NSString *)boxStr{
    self.numberLabel.text = numberStr;
    self.timeLabel.text = [NSString stringWithFormat:@"扫描时间:%@",timeStr];
    self.orderLabel.text = [NSString stringWithFormat:@"零件号:%@",orderStr];
    self.boxLabel.text = [NSString stringWithFormat:@"订单号:%@",boxStr];

    
    
}


@end
