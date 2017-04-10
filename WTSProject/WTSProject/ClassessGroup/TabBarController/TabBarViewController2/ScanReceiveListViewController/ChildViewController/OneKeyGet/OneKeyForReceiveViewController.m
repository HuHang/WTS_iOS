//
//  OneKeyForReceiveViewController.m
//  WTSProject
//
//  Created by Charlot on 2017/4/5.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import "OneKeyForReceiveViewController.h"

@interface OneKeyForReceiveViewController ()
@property (nonatomic,strong)UITextField *orderNumberTextField;
@property (nonatomic,strong)UITextField *unloadingPortTextField;
@property (nonatomic,strong)UITextField *carTextField;
@property (nonatomic,strong)UITextField *theCarTextField;
@property (nonatomic,strong)UITextField *driverTextField;
@property (nonatomic,strong)UITextField *positionTextField;
@end

@implementation OneKeyForReceiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"一键接收";
    self.view.backgroundColor = [UIColor whiteColor];
    [self layoutView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)layoutView{
    
    self.orderNumberTextField = [UITextField textFieldWithTextAlignment:(NSTextAlignmentCenter) withTextColor:[UIColor blackColor] withFont:SystemFont(14.f) withPlaceholder:@"请选择运输单号"];
    self.unloadingPortTextField = [UITextField textFieldWithTextAlignment:(NSTextAlignmentCenter) withTextColor:[UIColor blackColor] withFont:SystemFont(14.f) withPlaceholder:@"请选择卸货口"];
    self.carTextField = [UITextField textFieldWithTextAlignment:(NSTextAlignmentCenter) withTextColor:[UIColor blackColor] withFont:SystemFont(14.f) withPlaceholder:@"请选择车辆"];
    self.theCarTextField = [UITextField textFieldWithTextAlignment:(NSTextAlignmentCenter) withTextColor:[UIColor blackColor] withFont:SystemFont(14.f) withPlaceholder:@"请选择车挂号"];
    self.driverTextField = [UITextField textFieldWithTextAlignment:(NSTextAlignmentCenter) withTextColor:[UIColor blackColor] withFont:SystemFont(14.f) withPlaceholder:@"请选择驾驶员"];
    self.positionTextField = [UITextField textFieldWithTextAlignment:(NSTextAlignmentCenter) withTextColor:[UIColor blackColor] withFont:SystemFont(14.f) withPlaceholder:@"请选择目的地"];
    UIButton *sureAcceptButton = [UIButton buttonWithString:@"确认接收" withBackgroundColor:WTSBlueColor withTextAlignment:(NSTextAlignmentCenter) withTextColor:[UIColor whiteColor] withFont:SystemFont(14.f)];

    NSArray *titleArray = @[@"运输单号",@"卸货口",@"车辆",@"车挂",@"驾驶员",@"目的地"];
    NSArray *textFieldArray = @[self.orderNumberTextField,self.unloadingPortTextField,self.carTextField,self.theCarTextField,self.driverTextField,self.positionTextField];
    for (int i = 0; i < 6; i ++) {
        UILabel *titleLabel = [UILabel labelWithString:titleArray[i]
                                     withTextAlignment:(NSTextAlignmentCenter)
                                         withTextColor:[UIColor blackColor]
                                              withFont:SystemFont(14.f)];
        UITextField *textField = textFieldArray[i];
        UIView *lineView = [self lineView:UIColorFromHEX(0xD9D9D9, 1.0)];
        [self.view addSubview:titleLabel];
        [self.view addSubview:textField];
        [self.view addSubview:lineView];
        
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(5);
            make.size.mas_equalTo(CGSizeMake(60, 40));
            make.top.mas_equalTo(0).with.mas_offset(i*51 +50);
        }];
        [textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(titleLabel.mas_right);
            make.right.equalTo(self.view).with.mas_offset(-20);
            make.top.and.bottom.equalTo(titleLabel);
        }];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(textField);
            make.top.equalTo(titleLabel.mas_bottom);
            make.height.mas_equalTo(1);
        }];
    }
    [self.view addSubview:sureAcceptButton];
    [sureAcceptButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 44));
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(@0).with.offset(-45);
    }];
    
    sureAcceptButton.layer.cornerRadius = 22;
    sureAcceptButton.layer.masksToBounds = YES;
    
}

#pragma mark 懒加载
- (UIView *)lineView:(UIColor *)lineColor {
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = lineColor;
    return line;
}

@end
