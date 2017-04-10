//
//  BoxChangeTableViewController.m
//  WTSProject
//
//  Created by Charlot on 2017/3/29.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import "BoxChangeTableViewController.h"
#import "BoxChangeTableViewCell.h"
#import "ChangeBoxModel.h"
#import "ScanViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface BoxChangeTableViewController ()<ScanViewControllerDelegate>
@property (nonatomic,strong)NSArray *changeBoxArray;

@end

@implementation BoxChangeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNavigationView];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self callHttpForChangeBoxData];
        [self.tableView.mj_header endRefreshing];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView.mj_header beginRefreshing];
}
- (void)createNavigationView{
    if (!self.isSent) {
        if (self.isPickOver) {
            UIBarButtonItem *doneForGet=[[UIBarButtonItem alloc]initWithTitle:@"确认送达" style:UIBarButtonItemStylePlain target:self action:@selector(doneButtonClick)];
            self.navigationItem.rightBarButtonItem=doneForGet;
        }else{
            UIBarButtonItem *doneForGet=[[UIBarButtonItem alloc]initWithTitle:@"运单操作" style:UIBarButtonItemStylePlain target:self action:@selector(doneButtonClick)];
            self.navigationItem.rightBarButtonItem=doneForGet;
        }
    }

}

#pragma mark - http
- (void)callHttpForChangeBoxData{
    __weak BoxChangeTableViewController *weakSelf = self;
    NSString *url = [NSString stringWithFormat:@"%@deliveryNodeId=%d",[URLList changeItem_get_url],self.deliveryNodeId];
    [CallHttpManager getWithUrlString:url
                               success:^(id data) {
                                   if (data) {
                                       weakSelf.changeBoxArray =  [[ChangeBoxModel alloc] getDataWithObject:data];
                                       [weakSelf.tableView reloadData];
                                   }
                               }
                               failure:^(NSError *error) {
                                   NSLog(@"2");
                               }];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.changeBoxArray count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BoxChangeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([BoxChangeTableViewCell class])];
    ChangeBoxModel *item = (ChangeBoxModel *)self.changeBoxArray[indexPath.row];
    if (cell == nil) {
        cell = [[BoxChangeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([BoxChangeTableViewCell class])];
//        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    [cell setCellDataWith:item.nr orderStr:item.partNr timeStr:[NSString formatDateTimeForCN:item.checkedAt] boxStr:item.orderno];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - action
- (void)doneButtonClick{
    if (self.isPickOver) {

        [UIAlertViewManager alertWithTitle:@"提醒" message:@"确认已经将货物全部送达" withCancelButton:YES textFieldPlaceholders:@[] actionTitles:@[@"确定"] textFieldHandler:^(UITextField *textField, NSUInteger index) {
            
        } actionHandler:^(UIAlertAction *action, NSUInteger index, NSArray *textFields) {
            
        }];
    }else{
        [UIAlertViewManager actionSheettWithTitle:@"选择运单操作" message:nil withCancelButton:YES actionTitles:@[@"扫描SM码",@"取货完成"] actionHandler:^(UIAlertAction *action, NSUInteger index) {
            if (index == 0) {
                [self scanButtonClick];
            }
        }];
    }
   
}


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
            [PCMBProgressHUD showLoadingTipsInView:self.view title:@"抱歉" detail:@"系统原因, 无法访问相册" withIsAutoHide:YES];
        }
    } else {
        [UIAlertViewManager alertWithTitle:@"温馨提示"  message:@"未检测到您的摄像头" withCancelButton:(NO) textFieldPlaceholders:@[] actionTitles:@[@"确定"] textFieldHandler:^(UITextField *textField, NSUInteger index) {
        } actionHandler:^(UIAlertAction *action, NSUInteger index, NSArray *textFields) {
        }];
    }
    
}
#pragma mark - scan delegate


- (void)passDataBack:(NSString *)data{
    NSLog(@"%@",data);
//    [self performSelector:@selector(callHttpForAddItemDetail:) withObject:data afterDelay:0.25];
}

@end
