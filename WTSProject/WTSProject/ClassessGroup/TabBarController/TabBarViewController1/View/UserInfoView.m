//
//  UserInfoView.m
//  WTSProject
//
//  Created by Charlot on 2017/4/5.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import "UserInfoView.h"
@interface UserInfoView()
@property (nonatomic, weak) UIWindow *keyWindow;
@property (nonatomic, strong) UIView *shadeView;
@property (nonatomic, strong) UIView *contentView;
@end
@implementation UserInfoView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.keyWindow = [UIApplication sharedApplication].keyWindow;
        self.shadeView = [[UIView alloc] initWithFrame:frame];
        [self.keyWindow addSubview:self.shadeView];
        
        self.contentView = [[UIView alloc] init];
        UIImageView *photoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
        self.nameLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentCenter) withTextColor:[UIColor grayColor] withFont:SystemFont(14.f)];
        self.jobNrLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentCenter) withTextColor:[UIColor grayColor] withFont:SystemFont(14.f)];
        self.roleLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentCenter) withTextColor:[UIColor grayColor] withFont:SystemFont(14.f)];
        self.phoneLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentCenter) withTextColor:[UIColor grayColor] withFont:SystemFont(14.f)];
        self.emailLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentCenter) withTextColor:[UIColor grayColor] withFont:SystemFont(14.f)];
        
        UIView *lineView01 = [self viewWithColor:UIColorFromHEX(0xD9D9D9,1.0)];
        UIView *lineView02 = [self viewWithColor:UIColorFromHEX(0xD9D9D9,1.0)];
        
        [self addSubview:self.contentView];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.jobNrLabel];
        [self.contentView addSubview:self.roleLabel];
        [self.contentView addSubview:self.phoneLabel];
        [self.contentView addSubview:self.emailLabel];
        [self.contentView addSubview:lineView01];
        [self.contentView addSubview:lineView02];
        
        
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH - 10, SCREEN_HEIGHT *3/5));
            make.center.equalTo(self.shadeView);
        }];
        
        [photoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(30, 30));
            make.left.and.top.mas_equalTo(10);
        }];
        
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(100, 30));
            make.top.equalTo(photoView);
            make.left.equalTo(photoView.mas_right).with.mas_offset(10);
        }];
        
        [self.jobNrLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.and.left.equalTo(self.nameLabel);
            make.top.equalTo(self.nameLabel.mas_bottom);
        }];
        
        [self.roleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(self.nameLabel);
            make.centerY.equalTo(photoView);
            make.right.mas_equalTo(-10);
        }];
        
        [lineView01 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(1);
            make.left.equalTo(photoView);
            make.right.equalTo(self.roleLabel);
            make.top.equalTo(photoView.mas_bottom).with.mas_offset(5);
        }];
        
        [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(28);
            make.left.equalTo(photoView);
            make.right.equalTo(lineView01);
            make.top.equalTo(lineView01.mas_bottom);
        }];
        [self.emailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.and.left.equalTo(self.phoneLabel);
            make.top.equalTo(self.phoneLabel.mas_bottom);
        }];
        
        [lineView02 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.and.left.equalTo(lineView01);
            make.top.equalTo(self.emailLabel.mas_bottom).with.mas_offset(5);
        }];
        
    }
    return  self;
}

#pragma mark - loadData
-(void)loadDataWithImageStr:(NSString *)image nameStr:(NSString *)name jobNrStr:(NSString *)jobNr roleStr:(NSString *)role phoneStr:(NSString *)phone emailStr:(NSString *)email{
    self.nameLabel.text = name;
    self.roleLabel.text = role;
    self.jobNrLabel.text = jobNr;
    self.phoneLabel.text = phone;
    self.emailLabel.text = email;
};

#pragma mark 懒加载
- (UIView *)viewWithColor:(UIColor *)viewColor {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = viewColor;
    return view;
}

@end
