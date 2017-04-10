//
//  ItemDetailTableViewCell.h
//  WTSProject
//
//  Created by Charlot on 2017/3/30.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemDetailTableViewCell : UITableViewCell

@property (nonatomic,strong)UILabel *signView;
@property (nonatomic,strong)UILabel *numberLabel;
@property (nonatomic,strong)UILabel *countLabel;
@property (nonatomic,strong)UILabel *timeLabel;




- (void)setCellDataWith:(NSString *)numberStr
               countStr:(NSString *)countStr
                timeStr:(NSString *)timeStr;
@end
