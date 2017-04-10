//
//  ItemTableViewCell.h
//  WTSProject
//
//  Created by Charlot on 2017/3/28.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemTableViewCell : UITableViewCell

@property (nonatomic,strong)UILabel *signView;
@property (nonatomic,strong)UILabel *numberLabel;
@property (nonatomic,strong)UILabel *orderLabel;
@property (nonatomic,strong)UILabel *palletLabel;
@property (nonatomic,strong)UILabel *boxLabel;



- (void)setCellDataWith:(NSString *)numberStr
               orderStr:(NSString *)orderStr
              palletStr:(NSString *)palletStr
                 boxStr:(NSString *)boxStr;
@end
