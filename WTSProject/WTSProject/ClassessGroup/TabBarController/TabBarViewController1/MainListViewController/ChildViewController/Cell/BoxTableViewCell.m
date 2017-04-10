//
//  BoxTableViewCell.m
//  WTSProject
//
//  Created by Charlot on 2017/3/28.
//  Copyright © 2017年 Charlot. All rights reserved.
//

//@property (nonatomic,strong)UIImageView *signView;
//@property (nonatomic,strong)UILabel *numberLabel;
//@property (nonatomic,strong)UILabel *palletLabel;
//@property (nonatomic,strong)UILabel *boxLabel;
//@property (nonatomic,strong)UILabel *unloadingLabel;
//@property (nonatomic,strong)UILabel *supplierLabel;

#import "BoxTableViewCell.h"

@implementation BoxTableViewCell

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
    self.signView = [UILabel labelWithString:FontAweStr(FAIconInbox)
                           withTextAlignment:(NSTextAlignmentCenter)
                               withTextColor:[UIColor whiteColor]
                         withBackgroundColor:WTSBlueColor
                                    withFont:FontAweStrFont(20.f)];
    self.numberLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft)
                                         withTextColor:[UIColor blackColor]
                                              withFont:SystemFont(16.f)];
    self.palletLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft)
                                         withTextColor:[UIColor blackColor]
                                              withFont:SystemFont(12.f)];
    self.boxLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft)
                                         withTextColor:[UIColor blackColor]
                                              withFont:SystemFont(12.f)];
    self.unloadingLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft)
                                         withTextColor:[UIColor blackColor]
                                              withFont:SystemFont(12.f)];
    self.supplierLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft)
                                         withTextColor:[UIColor blackColor]
                                              withFont:SystemFont(12.f)];
    
    [self.contentView addSubview:self.signView];
    [self.contentView addSubview:self.numberLabel];
    [self.contentView addSubview:self.palletLabel];
    [self.contentView addSubview:self.boxLabel];
    [self.contentView addSubview:self.unloadingLabel];
    [self.contentView addSubview:self.supplierLabel];

    [self.signView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 40));
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.mas_equalTo(14);
    }];
    
    [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.equalTo(self.signView.mas_right).with.mas_offset(18);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(26);
    }];
    
    [self.palletLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.and.left.equalTo(self.numberLabel);
        make.top.equalTo(self.numberLabel.mas_bottom);
        make.width.mas_equalTo(100);
    }];
    [self.boxLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.top.equalTo(self.palletLabel);
        make.left.equalTo(self.palletLabel.mas_right);
    }];
    
    [self.unloadingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.left.equalTo(self.numberLabel);
        make.top.equalTo(self.palletLabel.mas_bottom);
    }];
    
    [self.supplierLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.left.equalTo(self.numberLabel);
        make.top.equalTo(self.unloadingLabel.mas_bottom);
    }];
    
    self.signView.layer.cornerRadius = 20;
    self.signView.layer.masksToBounds = YES;
}

- (void)setCellDataWith:(NSString *)numberStr
              palletStr:(NSString *)palletStr
                 boxStr:(NSString *)boxStr
           unloadingStr:(NSString *)unloadingStr
            supplierStr:(NSString *)supplierStr{
    self.numberLabel.text = numberStr;
    self.palletLabel.text = [NSString stringWithFormat:@"托盘数:%@",palletStr];
    self.boxLabel.text = [NSString stringWithFormat:@"箱数:%@",boxStr];
    self.unloadingLabel.text = [NSString stringWithFormat:@"卸货口:%@",unloadingStr];
    self.supplierLabel.text = [NSString stringWithFormat:@"供应商:%@",supplierStr];
}
@end
