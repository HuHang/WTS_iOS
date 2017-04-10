//
//  ItemDetailTableViewCell.m
//  WTSProject
//
//  Created by Charlot on 2017/3/30.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import "ItemDetailTableViewCell.h"

@implementation ItemDetailTableViewCell

//@property (nonatomic,strong)UILabel *signView;
//@property (nonatomic,strong)UILabel *numberLabel;
//@property (nonatomic,strong)UILabel *countLabel;
//@property (nonatomic,strong)UILabel *timeLabel;




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
                         withBackgroundColor:WTSBlueColor
                                    withFont:SystemFont(20.f)];
    self.numberLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft)
                                         withTextColor:[UIColor blackColor]
                                              withFont:SystemFont(16.f)];
    self.countLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft)
                                        withTextColor:[UIColor blackColor]
                                             withFont:SystemFont(12.f)];
    self.timeLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft)
                                         withTextColor:[UIColor blackColor]
                                              withFont:SystemFont(12.f)];
  
    
    
    
    [self.contentView addSubview:self.signView];
    [self.contentView addSubview:self.numberLabel];
    [self.contentView addSubview:self.countLabel];
    [self.contentView addSubview:self.timeLabel];
    
    
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
    
    [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.left.equalTo(self.numberLabel);
        make.top.equalTo(self.numberLabel.mas_bottom);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.left.equalTo(self.countLabel);
        make.top.equalTo(self.countLabel.mas_bottom);
    }];

    self.signView.layer.cornerRadius = 20;
    self.signView.layer.masksToBounds = YES;
    
    
}

- (void)setCellDataWith:(NSString *)numberStr
               countStr:(NSString *)countStr
                timeStr:(NSString *)timeStr{
    self.numberLabel.text = numberStr;
    self.countLabel.text = [NSString stringWithFormat:@"件数:%@.0",countStr];
    self.timeLabel.text = [NSString stringWithFormat:@"扫描:%@",timeStr];
    
    
}
@end
