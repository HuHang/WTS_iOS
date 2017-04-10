//
//  MainListTableViewCell.h
//  WTSProject
//
//  Created by Charlot on 2017/3/27.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainListTableViewCell : UITableViewCell

@property (nonatomic,strong)UILabel *signImage;

@property (nonatomic,strong)UILabel *orderNumberLabel;
@property (nonatomic,strong)UILabel *getTimeLabel;
@property (nonatomic,strong)UILabel *sendTimeLabel;
@property (nonatomic,strong) UIView *backView;

- (void)setCellData:(NSString *)orderNumber getTime:(NSString *)getTime sendTime:(NSString *)sendTime orderType:(int)orderType;
@end
