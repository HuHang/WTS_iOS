//
//  ItemDetailTableViewController.m
//  WTSProject
//
//  Created by Charlot on 2017/3/30.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import "ItemDetailTableViewController.h"
#import "ItemDetailTableViewCell.h"
#import "ScanViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "ItemDetailModel.h"


@interface ItemDetailTableViewController ()<ScanViewControllerDelegate>
@property (nonatomic,strong) NSArray *itemDetailArray;
@end

@implementation ItemDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.orderNumber;
    [self createNavigationView];
    [self callHttpForItemDetail];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self callHttpForItemDetail];
        [self.tableView.mj_header endRefreshing];
    }];
//    [SGQRCodeNotificationCenter addObserver:self selector:@selector(SGQRCodeInformationFromeScanning:) name:SGQRCodeInformationFromeScanning object:nil];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createNavigationView{

    UIButton *scanButton = [UIButton buttonWithString:FontAweStr(FAIconQrcode)
                              withBackgroundColor:[UIColor clearColor]
                                withTextAlignment:(NSTextAlignmentCenter)
                                    withTextColor:[UIColor whiteColor]
                                         withFont:FontAweStrFont(20.f)];
    scanButton.frame = CGRectMake(0, 0, 30, 40);
    [scanButton addTarget:self action:@selector(scanButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *scanButtonItem=[[UIBarButtonItem alloc]initWithCustomView:scanButton];
    self.navigationItem.rightBarButtonItem=scanButtonItem;
}

#pragma mark - http
- (void)callHttpForItemDetail{
    __weak ItemDetailTableViewController *weakSealf = self;
    NSString *url = [NSString stringWithFormat:@"%@positionId=%d",[URLList getAndSendItemDetail_url],self.positionId];
    [CallHttpManager getWithUrlString:url
                               success:^(id data) {
                                   if (data) {
                                       weakSealf.itemDetailArray = [[ItemDetailModel alloc] getDataWithObject:data];
                                       [weakSealf.tableView reloadData];
                                   }
                               }
                               failure:^(NSError *error) {
                                   NSLog(@"2");
                               }];
}
- (void)callHttpForAddItemDetail:(NSString *)packageNr{
    __weak ItemDetailTableViewController *weakSealf = self;
    NSString *url = [NSString stringWithFormat:@"%@packageNr=%@&deliveryNodeId=%d&transportId=%d&positionId=%d&carId=%d&packQuantity=",[URLList getAndSend_add_url],packageNr,self.deliveryNodeId,self.transportId,self.positionId,self.carID];
    [CallHttpManager postWithUrlString:url
                            parameters:nil
                              success:^(id data) {
                                  if (data) {
                                      if ([data[@"Success"] integerValue] == 1) {
                                          [weakSealf.tableView.mj_header beginRefreshing];
                                      }
                                      [PCMBProgressHUD showLoadingTipsInView:weakSealf.view title:nil detail:data[@"Content"] withIsAutoHide:YES];
                                      
                                  }else{
                                  }
                              }
                              failure:^(NSError *error) {
                              }];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.itemDetailArray count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ItemDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ItemDetailTableViewCell class])];
    ItemDetailModel *item = (ItemDetailModel *)self.itemDetailArray[indexPath.row];
    if (cell == nil) {
        cell = [[ItemDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([ItemDetailTableViewCell class])];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    [cell setCellDataWith:item.nr countStr:[NSString stringWithFormat:@"%u",item.kltContent] timeStr:[NSString formatDateTimeForCN:item.checkedAt]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110.f;
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
#pragma mark - scan delegate


- (void)passDataBack:(NSString *)data{
    [self performSelector:@selector(callHttpForAddItemDetail:) withObject:data afterDelay:0.25];
}
- (void)alertShow:(id)string{
        [UIAlertViewManager alertWithTitle:@"确定添加" message:string withCancelButton:(YES) textFieldPlaceholders:@[] actionTitles:@[@"确定"] textFieldHandler:^(UITextField *textField, NSUInteger index) {
    
        } actionHandler:^(UIAlertAction *action, NSUInteger index, NSArray *textFields) {
            [self callHttpForAddItemDetail:string];
        }];
}

@end
