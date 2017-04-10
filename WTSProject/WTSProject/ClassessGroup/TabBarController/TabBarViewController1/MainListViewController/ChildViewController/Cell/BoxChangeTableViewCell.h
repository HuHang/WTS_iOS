//
//  BoxChangeTableViewCell.h
//  WTSProject
//
//  Created by Charlot on 2017/3/29.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BoxChangeTableViewCell : UITableViewCell
@property (nonatomic,strong)UILabel *signView;
@property (nonatomic,strong)UILabel *numberLabel;
@property (nonatomic,strong)UILabel *orderLabel;
@property (nonatomic,strong)UILabel *timeLabel;
@property (nonatomic,strong)UILabel *boxLabel;



- (void)setCellDataWith:(NSString *)numberStr
               orderStr:(NSString *)orderStr
                timeStr:(NSString *)timeStr
                 boxStr:(NSString *)boxStr;
@end
