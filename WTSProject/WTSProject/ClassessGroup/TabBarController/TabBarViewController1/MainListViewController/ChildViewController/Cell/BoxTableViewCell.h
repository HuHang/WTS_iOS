//
//  BoxTableViewCell.h
//  WTSProject
//
//  Created by Charlot on 2017/3/28.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BoxTableViewCell : UITableViewCell
@property (nonatomic,strong)UILabel *signView;
@property (nonatomic,strong)UILabel *numberLabel;
@property (nonatomic,strong)UILabel *palletLabel;
@property (nonatomic,strong)UILabel *boxLabel;
@property (nonatomic,strong)UILabel *unloadingLabel;
@property (nonatomic,strong)UILabel *supplierLabel;

- (void)setCellDataWith:(NSString *)numberStr
              palletStr:(NSString *)palletStr
                 boxStr:(NSString *)boxStr
           unloadingStr:(NSString *)unloadingStr
            supplierStr:(NSString *)supplierStr;
@end
