//
//  OrderIfonListViewController.m
//  WTSProject
//
//  Created by Charlot on 2017/3/28.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import "OrderIfonListViewController.h"

@interface OrderIfonListViewController ()

@end

@implementation OrderIfonListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initializeForm];
    [self createNavigationBarItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initializeForm
{
    XLFormDescriptor * form;
    XLFormSectionDescriptor * section;
    XLFormRowDescriptor * row;
    
    form = [XLFormDescriptor formDescriptorWithTitle:@"任务详情"];
    
    section = [XLFormSectionDescriptor formSectionWithTitle:@"始发地仓库"];
    [form addFormSection:section];
    //
    row = [self createRow:@"originate_nr" title:@"Nr:" value:self.sourceWhouse.nr rowType:XLFormRowDescriptorTypeText];
    [section addFormRow:row];
    row = [self createRow:@"originate_name" title:@"名称:" value:self.sourceWhouse.name rowType:XLFormRowDescriptorTypeText];
    [section addFormRow:row];
    row = [self createRow:@"originate_address" title:@"地址:" value:self.sourceWhouse.address rowType:XLFormRowDescriptorTypeText];
    [section addFormRow:row];
    row = [self createRow:@"originate_type" title:@"类别:" value:self.sourceWhouse.typeStr rowType:XLFormRowDescriptorTypeText];
    [section addFormRow:row];
    row = [self createRow:@"originate_linker" title:@"联系人:" value:self.sourceWhouse.linkMan rowType:XLFormRowDescriptorTypeText];
    [section addFormRow:row];
    row = [self createRow:@"originate_phone" title:@"联系方式:" value:self.sourceWhouse.linkPhone rowType:XLFormRowDescriptorTypeText];
    [section addFormRow:row];

    
    section = [XLFormSectionDescriptor formSectionWithTitle:@"目的地仓库"];
    [form addFormSection:section];
    
    
    //
    row = [self createRow:@"destinate_nr" title:@"Nr:" value:self.destinationWhouse.nr rowType:XLFormRowDescriptorTypeText];
    [section addFormRow:row];
    row = [self createRow:@"destinate_name" title:@"名称:" value:self.destinationWhouse.name rowType:XLFormRowDescriptorTypeText];
    [section addFormRow:row];
    row = [self createRow:@"destinate_address" title:@"地址:" value:self.destinationWhouse.address rowType:XLFormRowDescriptorTypeText];
    [section addFormRow:row];
    row = [self createRow:@"destinate_type" title:@"类别:" value:self.destinationWhouse.typeStr rowType:XLFormRowDescriptorTypeText];
    [section addFormRow:row];
    row = [self createRow:@"destinate_linker" title:@"联系人:" value:self.destinationWhouse.linkMan rowType:XLFormRowDescriptorTypeText];
    [section addFormRow:row];
    row = [self createRow:@"destinate_phone" title:@"联系方式:" value:self.destinationWhouse.linkPhone rowType:XLFormRowDescriptorTypeText];
    [section addFormRow:row];
    
    
    
    section = [XLFormSectionDescriptor formSectionWithTitle:@"车辆信息"];
    [form addFormSection:section];
    // 姓名
    row = [self createRow:@"car_plate" title:@"车牌:" value:@"" rowType:XLFormRowDescriptorTypeText];
    [section addFormRow:row];
    row = [self createRow:@"car_plate1" title:@"车挂:" value:@"" rowType:XLFormRowDescriptorTypeText];
    [section addFormRow:row];
    row = [self createRow:@"car_plate2" title:@"区域代码:" value:@"" rowType:XLFormRowDescriptorTypeText];
    [section addFormRow:row];
    row = [self createRow:@"car_plate3" title:@"车队:" value:@"" rowType:XLFormRowDescriptorTypeText];
    [section addFormRow:row];
    row = [self createRow:@"car_plate4" title:@"司机:" value:@"" rowType:XLFormRowDescriptorTypeText];
    [section addFormRow:row];
    row = [self createRow:@"car_plate5" title:@"电话:" value:@"" rowType:XLFormRowDescriptorTypeText];
    [section addFormRow:row];
    row = [self createRow:@"car_plate6" title:@"邮箱:" value:@"" rowType:XLFormRowDescriptorTypeText];
    [section addFormRow:row];
    
    
    self.form = form;
}
-(XLFormRowDescriptor *)createRow:(NSString *)tag title:(NSString *)title value:(NSString *)value rowType:(NSString *)rowType
{
    XLFormRowDescriptor * row;
    row = [XLFormRowDescriptor formRowDescriptorWithTag:tag rowType:rowType title:title];
    row.value = value;
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentCenter) forKey:@"textField.textAlignment"];
    [row.cellConfig setObject:SystemFont(10.f) forKey:@"textField.font"];
    [row.cellConfig setObject:SystemFont(12.f) forKey:@"textLabel.font"];
    row.disabled = @YES;
    return row;
}


- (void)createNavigationBarItem{
    UIButton *mobileButton = [UIButton buttonWithString:FontAweStr(FAIconPhone)
                             withBackgroundColor:[UIColor clearColor]
                               withTextAlignment:(NSTextAlignmentCenter)
                                   withTextColor:[UIColor whiteColor]
                                        withFont:FontAweStrFont(25)];
    
    mobileButton.frame = CGRectMake(0, 0, 30, 30);
//    mobileButton.layer.cornerRadius = 15;
//    mobileButton.layer.masksToBounds = YES;
    [mobileButton addTarget:self action:@selector(mobileButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:mobileButton];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)mobileButtonClick{
    if ([self.sourceWhouse.linkPhone length] > 8 && [self.destinationWhouse.linkPhone length] >8) {
        [UIAlertViewManager actionSheettWithTitle:@"选择联系人"
                                          message:nil
                                 withCancelButton:YES
                                     actionTitles:@[self.sourceWhouse.linkMan,self.destinationWhouse.linkMan]
                                    actionHandler:^(UIAlertAction *action, NSUInteger index) {
                                        switch (index) {
                                            case 0:
                                                [self callMobilePhone:self.sourceWhouse.linkPhone];
                                                break;
                                            case 1:
                                                [self callMobilePhone:self.destinationWhouse.linkPhone];
                                                break;
                                                
                                            default:
                                                break;
                                        }
                                    }];
    }else if ([self.sourceWhouse.linkPhone length] > 8){
        [self callMobilePhone:self.sourceWhouse.linkPhone];
    }else if ([self.destinationWhouse.linkPhone length] >8){
        [self callMobilePhone:self.destinationWhouse.linkPhone];
    }else{
        [PCMBProgressHUD showLoadingTipsInView:self.view title:@"暂无可用联系人" detail:nil withIsAutoHide:YES];

    }
    
}
- (void)callMobilePhone:(NSString *)number{
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",number];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}
@end
