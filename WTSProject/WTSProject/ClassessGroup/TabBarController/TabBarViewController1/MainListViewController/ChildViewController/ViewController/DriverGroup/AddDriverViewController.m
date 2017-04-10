//
//  AddDriverViewController.m
//  WTSProject
//
//  Created by Charlot on 2017/4/7.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import "AddDriverViewController.h"

@interface AddDriverViewController ()
@property (nonatomic,strong)UITextField *carTextField;
@property (nonatomic,strong)UITextField *driverTextField;
@property (nonatomic,strong)UITextField *theDriverTextField;
@end

@implementation AddDriverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"添加车辆";
    [self layoutView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)layoutView{
    
    self.carTextField = [UITextField textFieldWithTextAlignment:(NSTextAlignmentCenter) withTextColor:[UIColor blackColor] withFont:SystemFont(14.f) withPlaceholder:@"请选择车辆"];
    self.driverTextField = [UITextField textFieldWithTextAlignment:(NSTextAlignmentCenter) withTextColor:[UIColor blackColor] withFont:SystemFont(14.f) withPlaceholder:@"请选择货车司机"];
    self.theDriverTextField = [UITextField textFieldWithTextAlignment:(NSTextAlignmentCenter) withTextColor:[UIColor blackColor] withFont:SystemFont(14.f) withPlaceholder:@"请选择货车车挂号"];
    
    UIButton *sureAcceptButton = [UIButton buttonWithString:@"确认添加" withBackgroundColor:WTSBlueColor withTextAlignment:(NSTextAlignmentCenter) withTextColor:[UIColor whiteColor] withFont:SystemFont(14.f)];
    
    NSArray *titleArray = @[@"车辆",@"司机",@"车挂"];
    NSArray *textFieldArray = @[self.carTextField,self.driverTextField,self.theDriverTextField];
    for (int i = 0; i < [titleArray count]; i ++) {
        UILabel *titleLabel = [UILabel labelWithString:titleArray[i]
                                     withTextAlignment:(NSTextAlignmentLeft)
                                         withTextColor:[UIColor blackColor]
                                              withFont:SystemFont(14.f)];
        UITextField *textField = textFieldArray[i];
        UIView *lineView = [self lineView:WTSBlueColor];
        [self.view addSubview:titleLabel];
        [self.view addSubview:textField];
        [self.view addSubview:lineView];
        
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(26);
            make.size.mas_equalTo(CGSizeMake(60, 30));
            make.top.mas_equalTo(0).with.mas_offset(i*84);
        }];
        [textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(titleLabel);
            make.right.equalTo(self.view).with.mas_offset(-26);
            make.top.equalTo(titleLabel.mas_bottom);
            make.height.equalTo(titleLabel);
        }];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(textField);
            make.top.equalTo(textField.mas_bottom);
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
