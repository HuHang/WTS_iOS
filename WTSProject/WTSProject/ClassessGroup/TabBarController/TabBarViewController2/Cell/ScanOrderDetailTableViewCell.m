//
//  ScanOrderDetailTableViewCell.m
//  WTSProject
//
//  Created by Charlot on 2017/4/10.
//  Copyright © 2017年 Charlot. All rights reserved.
//

/*
 @property (nonatomic,strong)UILabel *partNumberLabel;
 @property (nonatomic,strong)UILabel *dockPointLabel;
 @property (nonatomic,strong)UILabel *receiveQuantityLabel;
 @property (nonatomic,strong)UILabel *sentTimeLable;
 */

#import "ScanOrderDetailTableViewCell.h"

@implementation ScanOrderDetailTableViewCell

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
    self.partNumberLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft) withTextColor:[UIColor grayColor] withFont:SystemFont(12.f)];
    self.dockPointLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft) withTextColor:[UIColor grayColor] withFont:SystemFont(12.f)];
    self.receiveQuantityLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft) withTextColor:[UIColor grayColor] withFont:SystemFont(12.f)];
    self.sentTimeLable = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft) withTextColor:[UIColor grayColor] withFont:SystemFont(12.f)];
    
    UILabel *partTitle = [UILabel labelWithString:@"零件号：" withTextAlignment:(NSTextAlignmentLeft) withTextColor:[UIColor blackColor] withFont:SystemFont(12.f)];
    UILabel *dockTitle = [UILabel labelWithString:@"卸货口：" withTextAlignment:(NSTextAlignmentLeft) withTextColor:[UIColor blackColor] withFont:SystemFont(12.f)];
    UILabel *receiveTitle = [UILabel labelWithString:@"接收托数：" withTextAlignment:(NSTextAlignmentLeft) withTextColor:[UIColor blackColor] withFont:SystemFont(12.f)];
    UILabel *timeTitle = [UILabel labelWithString:@"送达时间：" withTextAlignment:(NSTextAlignmentLeft) withTextColor:[UIColor blackColor] withFont:SystemFont(12.f)];
    
    UIView *lineView = [self viewWithColor:UIColorFromHEX(0xD9D9D9,1.0)];
    [self.contentView addSubview:self.partNumberLabel];
    [self.contentView addSubview:self.dockPointLabel];
    [self.contentView addSubview:self.receiveQuantityLabel];
    [self.contentView addSubview:self.sentTimeLable];
    
    [self.contentView addSubview:partTitle];
    [self.contentView addSubview:dockTitle];
    [self.contentView addSubview:receiveTitle];
    [self.contentView addSubview:timeTitle];
    [self.contentView addSubview:lineView];
    
    [partTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(80, 26));
    }];
    [self.partNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.height.equalTo(partTitle);
        make.left.equalTo(partTitle.mas_right);
        make.width.mas_equalTo(120);
    }];
    
    [dockTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.top.equalTo(partTitle);
        make.left.equalTo(self.partNumberLabel.mas_right);
    }];
    [self.dockPointLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.top.equalTo(self.partNumberLabel);
        make.left.equalTo(dockTitle.mas_right);
    }];
    
    [receiveTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.left.equalTo(partTitle);
        make.top.equalTo(partTitle.mas_bottom);
    }];
    [self.receiveQuantityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.partNumberLabel);
        make.top.equalTo(receiveTitle);
        make.left.equalTo(receiveTitle.mas_right);
    }];
    
    [timeTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.left.equalTo(receiveTitle);
        make.top.equalTo(receiveTitle.mas_bottom);
    }];
    [self.sentTimeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.height.equalTo(timeTitle);
        make.left.equalTo(timeTitle.mas_right);
        make.right.mas_equalTo(-10);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.right.mas_equalTo(-16);
        make.height.mas_equalTo(1);
        make.bottom.equalTo(@0);
    }];
    
    
    
    
    
}

#pragma mark 懒加载
- (UIView *)viewWithColor:(UIColor *)viewColor {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = viewColor;
    return view;
}

@end
