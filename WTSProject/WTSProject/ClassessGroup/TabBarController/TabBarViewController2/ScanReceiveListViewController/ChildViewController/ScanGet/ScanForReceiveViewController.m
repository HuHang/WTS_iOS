//
//  ScanForReceiveViewController.m
//  WTSProject
//
//  Created by Charlot on 2017/4/5.
//  Copyright © 2017年 Charlot. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>
#import "ScanForReceiveViewController.h"
#import "ScanViewController.h"
#import "CheckScanDataTableViewController.h"
#import "MHRadioButton.h"
#import "UIButton+MHExtra.h"
#import "ScanOrderDetailTableViewCell.h"

#import "ReceiveDetailModel.h"

@interface ScanForReceiveViewController ()<UITableViewDelegate,UITableViewDataSource,ScanViewControllerDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)UITextField *smCodeTextField;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property BOOL autoAddData;

@end

@implementation ScanForReceiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"扫描接收";
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataArray = [[NSMutableArray alloc] init];
    [self createNavigationView];
    [self layoutView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)createNavigationView{
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"查看详情" style:(UIBarButtonItemStylePlain) target:self action:@selector(checkDataDetail:)];
}
- (void)layoutView{
    UIButton *scanButton = [UIButton buttonWithString:FontAweStr(FAIconQrcode)
                                  withBackgroundColor:[UIColor clearColor]
                                    withTextAlignment:(NSTextAlignmentCenter)
                                        withTextColor:[UIColor whiteColor]
                                             withFont:FontAweStrFont(18.f)];
    
    scanButton.frame = CGRectMake(0, 0, 30, 40);
    [scanButton addTarget:self action:@selector(scanButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.smCodeTextField = [UITextField textFieldWithPlaceholder:@"S/M码"
                                               withTextAlignment:(NSTextAlignmentCenter) withTextColor:[UIColor whiteColor]
                                                        withFont:SystemFont(14.f)
                                                    withLeftView:nil
                                                   withRightView:scanButton];
    
    UIButton *autoAddButton = [UIButton buttonWithString:FontAweStr(FAIconRemove)
                                  withBackgroundColor:[UIColor clearColor]
                                    withTextAlignment:(NSTextAlignmentCenter)
                                        withTextColor:WTSBlueColor
                                             withFont:FontAweStrFont(14.f)];
    UILabel *autoAddLabel = [UILabel labelWithString:@"自动添加"
                                   withTextAlignment:(NSTextAlignmentLeft)
                                       withTextColor:UIColorFromHEX(0x297fb8,0.8)
                                            withFont:SystemFont(10.f)];
    
    UIButton *addButton = [UIButton buttonWithString:@"确认添加" withBackgroundColor:WTSBlueColor withTextAlignment:(NSTextAlignmentCenter) withTextColor:[UIColor whiteColor] withFont:SystemFont(12.f)];
  
    [self.view addSubview:self.smCodeTextField];
    [self.view addSubview:autoAddButton];
    [self.view addSubview:autoAddLabel];
    [self.view addSubview:addButton];
    
    [self.smCodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(34);
    }];
    
    [autoAddButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.left.equalTo(self.smCodeTextField);
        make.top.equalTo(self.smCodeTextField.mas_bottom).with.mas_offset(10);
    }];
    [autoAddLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.and.top.equalTo(autoAddButton);
        make.left.equalTo(autoAddButton.mas_right);
        make.width.mas_equalTo(100);
    }];
    [addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80, 30));
        make.top.equalTo(autoAddButton);
        make.right.equalTo(self.smCodeTextField);
    }];
 
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 110, SCREEN_WIDTH, SCREEN_HEIGHT_WithNavigationBar - 110) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerClass:[ScanOrderDetailTableViewCell class] forCellReuseIdentifier:NSStringFromClass([ScanOrderDetailTableViewCell class])];

    self.smCodeTextField.backgroundColor = UIColorFromHEX(0xD9D9D9,1.0);
    self.smCodeTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.smCodeTextField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    [autoAddButton setTitle:FontAweStr(FAIconOk) forState:UIControlStateHighlighted];
    [autoAddButton setTitle:FontAweStr(FAIconOk) forState:UIControlStateSelected];
    [autoAddButton addMHCallBackAction:^(UIButton *button) {
        button.selected ^= YES;
        self.autoAddData = button.selected;
    } forControlEvents:(UIControlEventTouchUpInside)];
    
    addButton.layer.cornerRadius = 4;
    addButton.layer.masksToBounds = YES;
    
    
}



#pragma mark - http
-(void) callHttpForData{
    __weak ScanForReceiveViewController *weakself = self;
    [CallHttpManager getWithUrlString:@""
                              success:^(id data) {
                                  NSDictionary *dataReq = data;
                                  
                              }
                              failure:^(NSError *error) {
                              }];
}

#pragma mark - tabeleview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ScanOrderDetailTableViewCell *cell = [[ScanOrderDetailTableViewCell alloc]  initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:NSStringFromClass([ScanOrderDetailTableViewCell class])];
    if (cell == nil) {
        cell = [[ScanOrderDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([ScanOrderDetailTableViewCell class])];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90.f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




#pragma mark - action

- (void)scanButtonClick{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (device) {
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (status == AVAuthorizationStatusNotDetermined) {
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                if (granted) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        ScanViewController *vc = [[ScanViewController alloc] init];
                        vc.delegate = self;
                        [self.navigationController pushViewController:vc animated:YES];
                    });
                    // 用户第一次同意了访问相机权限
                } else {
                    // 用户第一次拒绝了访问相机权限
                }
            }];
        } else if (status == AVAuthorizationStatusAuthorized) {
            // 用户允许当前应用访问相机
            ScanViewController *scanViewController = [[ScanViewController alloc] init];
            scanViewController.delegate = self;
            [self.navigationController pushViewController:scanViewController animated:YES];
        } else if (status == AVAuthorizationStatusDenied) {
            // 用户拒绝当前应用访问相机
            [UIAlertViewManager alertWithTitle:@"⚠️ 警告"  message:@"请去-> [设置 - 隐私 - 相机 - OTWS] 打开访问开关" withCancelButton:(YES) textFieldPlaceholders:@[] actionTitles:@[@"确定"] textFieldHandler:^(UITextField *textField, NSUInteger index) {
            } actionHandler:^(UIAlertAction *action, NSUInteger index, NSArray *textFields) {
            }];
        } else if (status == AVAuthorizationStatusRestricted) {
            [PCMBProgressHUD showLoadingTipsInView:self.view title:@"抱歉" detail:@"系统原因, 无法访问相册" withIsAutoHide:YES];        }
    } else {
        [UIAlertViewManager alertWithTitle:@"温馨提示"  message:@"未检测到您的摄像头" withCancelButton:(NO) textFieldPlaceholders:@[] actionTitles:@[@"确定"] textFieldHandler:^(UITextField *textField, NSUInteger index) {
        } actionHandler:^(UIAlertAction *action, NSUInteger index, NSArray *textFields) {
        }];
    }
    
}

- (void)commitData:(UIButton *)sender{
    
}
- (void)checkDataDetail:(UIButton *)sender{
    CheckScanDataTableViewController *detailView = [[CheckScanDataTableViewController alloc] init];
    [self.navigationController pushViewController:detailView animated:YES];
    
}
#pragma mark - scan delegate


- (void)passDataBack:(NSString *)data{
    if (self.autoAddData) {
        NSLog(@"%@",data);
    }else{
        NSLog(@"no ==%@",data);
    }
    
    //    [self performSelector:@selector(callHttpForAddItemDetail:) withObject:data afterDelay:0.25];
}

@end
