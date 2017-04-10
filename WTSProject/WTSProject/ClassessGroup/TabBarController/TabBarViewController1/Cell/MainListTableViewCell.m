//
//  MainListTableViewCell.m
//  WTSProject
//
//  Created by Charlot on 2017/3/27.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import "MainListTableViewCell.h"


@implementation MainListTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 初始化子视图
        [self initLayout];
    }
    return self;
}

- (void)layoutSubviews{
    for (UIView *subView in self.subviews) {
        if([subView isKindOfClass:NSClassFromString(@"UITableViewCellDeleteConfirmationView")]) {
            
            UIView *deleteConfirmationView = subView.subviews[0];
            //改背景颜色
            deleteConfirmationView.backgroundColor = [UIColor colorWithRed:204.0/255.0 green:42.0/255.0 blue:62.0/255.0 alpha:1.0];
            for (UIView *deleteView in deleteConfirmationView.subviews) {
                UILabel *imageLabel = [UILabel labelWithString:FontAweStr(FAIconTrash)
                                             withTextAlignment:(NSTextAlignmentCenter)
                                                 withTextColor:UIColorFromHEX(0xD9D9D9,1.0)
                                                      withFont:FontAweStrFont(25.f)];
                imageLabel.frame = CGRectMake(0, 0, deleteView.frame.size.width, deleteView.frame.size.height);
//                ButtonItemWithTitleImage *thirdBtn = [[ButtonItemWithTitleImage alloc]initWithFrame:CGRectMake(0, 0, 40, 50) WithImageName:@"ZDlogo" WithImageWidth:30 WithImageHeightPercentInItem:.7 WithTitle:@"删除" WithFontSize:10.f WithFontColor:[UIColor whiteColor] WithGap:-5];
                
                [deleteView addSubview:imageLabel];
            }
            
            // 这里是右边的
            UIView *shareConfirmationView = subView.subviews[1];
            shareConfirmationView.backgroundColor = [UIColor colorWithRed:142.0/255.0 green:201.0/255.0 blue:75.0/255.0 alpha:1.0];
            for (UIView *shareView in shareConfirmationView.subviews) {
                UILabel *imageLabel = [UILabel labelWithString:FontAweStr(FAIconListAlt)
                                             withTextAlignment:(NSTextAlignmentCenter)
                                                 withTextColor:UIColorFromHEX(0xD9D9D9,1.0)
                                                      withFont:FontAweStrFont(25.f)];
                imageLabel.frame = CGRectMake(0, 0, shareView.frame.size.width, shareView.frame.size.height);
                
                [shareView addSubview:imageLabel];
            }
        }
    }
}
- (void)initLayout{
    self.backView = [[UIView alloc] init];
    self.signImage = [UILabel labelWithTextAlignment:(NSTextAlignmentCenter) withTextColor:[UIColor whiteColor] withFont:SystemFont(22.f)];
    self.orderNumberLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft) withTextColor:[UIColor blackColor] withFont:SystemFont(20.f)];
    self.getTimeLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft) withTextColor:[UIColor lightGrayColor] withFont:SystemFont(12.f)];
    self.sendTimeLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft) withTextColor:[UIColor lightGrayColor] withFont:SystemFont(12.f)];
    UILabel *getTitle = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft) withTextColor:[UIColor lightGrayColor] withFont:SystemFont(12.f)];
    UILabel *sendTitle = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft) withTextColor:[UIColor lightGrayColor] withFont:SystemFont(12.f)];
    UIView *lineView = [self viewWithColor:UIColorFromHEX(0xD9D9D9,1.0)];
    
    [self.contentView addSubview:self.backView];
    [self.backView addSubview:self.signImage];
    [self.backView addSubview:self.orderNumberLabel];
    [self.backView addSubview:getTitle];
    [self.backView addSubview:self.getTimeLabel];
    [self.backView addSubview:sendTitle];
    [self.backView addSubview:self.sendTimeLabel];
    [self.backView addSubview:lineView];
    
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(1);
        make.bottom.mas_offset(-1);
        make.left.and.right.mas_equalTo(0);
    }];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(1);
        make.right.equalTo(@0);
        make.bottom.mas_equalTo(self.backView.mas_bottom);
    }];
    
    [self.signImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(46, 46));
        make.top.and.left.mas_equalTo(15);
    }];
    
    [self.orderNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.signImage.mas_centerY);
        make.left.equalTo(self.signImage.mas_right).with.mas_offset(18);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(10);
        
    }];
    
    [getTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(30);
        make.left.equalTo(self.orderNumberLabel);
        make.top.equalTo(self.orderNumberLabel.mas_bottom);
        make.bottom.equalTo(lineView.mas_top);
        
    }];
    
    [self.getTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(80);
        make.height.and.top.equalTo(getTitle);
        make.left.equalTo(getTitle.mas_right);
        
    }];
    
    [sendTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.top.equalTo(getTitle);
        make.left.equalTo(self.getTimeLabel.mas_right);
    }];
    
    [self.sendTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.top.equalTo(self.getTimeLabel);
        make.left.equalTo(sendTitle.mas_right);
    }];
    
   
    
    self.backView.backgroundColor = [UIColor whiteColor];
    self.contentView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    getTitle.text = @"取货:";
    sendTitle.text = @"到货:";
    self.signImage.layer.cornerRadius = 23.f;
    self.signImage.layer.masksToBounds = YES;
    
}


- (void)setCellData:(NSString *)orderNumber getTime:(NSString *)getTime sendTime:(NSString *)sendTime orderType:(int)orderType{
    self.orderNumberLabel.text = orderNumber;
    self.getTimeLabel.text = getTime;
    self.sendTimeLabel.text = sendTime;
    [self formartTaskType:orderType];
}

- (void)formartTaskType:(int)type{
    NSString *typeStr;
    UIColor *backColor;
    switch (type) {
        case 100:
            typeStr = @"运";
            backColor = WTSBlueColor;
            break;
        case 200:
            typeStr = @"提";
            backColor = UIColorFromHEX(0xFFA500, 1.0);
            break;
        case 300:
            typeStr = @"转";
            backColor = UIColorFromHEX(0x20B2AA, 1.0);
            break;
        default:
            typeStr = @"未";
            backColor = UIColorFromHEX(0x808080, 1.0);
            break;
    }
    self.signImage.text = typeStr;
    self.signImage.backgroundColor = backColor;
}
#pragma mark 懒加载
- (UIView *)viewWithColor:(UIColor *)viewColor {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = viewColor;
    return view;
}

@end
