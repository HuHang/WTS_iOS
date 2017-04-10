//
//  UserInfoView.h
//  WTSProject
//
//  Created by Charlot on 2017/4/5.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserInfoView : UIView
@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UILabel *jobNrLabel;
@property (nonatomic,strong)UILabel *roleLabel;
@property (nonatomic,strong)UILabel *phoneLabel;
@property (nonatomic,strong)UILabel *emailLabel;

-(void)loadDataWithImageStr:(NSString *)image nameStr:(NSString *)name jobNrStr:(NSString *)jobNr roleStr:(NSString *)role phoneStr:(NSString *)phone emailStr:(NSString *)email;

@end
