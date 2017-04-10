//
//  BoxTableViewController.m
//  WTSProject
//
//  Created by Charlot on 2017/3/29.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import "BoxTableViewController.h"
#import "BoxTableViewCell.h"
#import "ItemTableViewController.h"
#import "BoxTableModel.h"

@interface BoxTableViewController ()
@property (nonatomic,strong) NSArray *boxArray;
@end

@implementation BoxTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.orderNumber;
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"订单" style:(UIBarButtonItemStylePlain) target:nil action:nil];
    [self createNavigationView];
    [self callHttpForBoxData];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self callHttpForBoxData];
        [self.tableView.mj_header endRefreshing];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createNavigationView{
    UIBarButtonItem *doneForGet=[[UIBarButtonItem alloc]initWithTitle:@"取货完成" style:UIBarButtonItemStylePlain target:self action:@selector(doneButtonClick)];
    self.navigationItem.rightBarButtonItem=doneForGet;
}

#pragma mark - http
- (void)callHttpForBoxData{
    __weak BoxTableViewController *weakSelf = self;
    NSString *url = [NSString stringWithFormat:@"%@deliveryNodeId=%d",[URLList getAndSend_url],self.deliveryNodeId];
    [CallHttpManager getWithUrlString:url
                               success:^(id data) {
                                   if (data) {
                                       weakSelf.boxArray =  [[BoxTableModel alloc] getDataWithObject:data];
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
    return [self.boxArray count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BoxTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([BoxTableViewCell class])];
    BoxTableModel *item = (BoxTableModel *)self.boxArray[indexPath.row];
    if (cell == nil) {
        cell = [[BoxTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([BoxTableViewCell class])];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    [cell setCellDataWith:item.transportnumber
                palletStr:[NSString stringWithFormat:@"%u/%u",item.totalCheckedTrayCount,item.totalTrayCount]
                   boxStr:[NSString stringWithFormat:@"%u/%u",item.totalDeliveryCheckedPackageCount,item.totalCheckedPackageCount]
             unloadingStr:item.customerdock
              supplierStr:item.supplierName];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 124.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BoxTableModel *item = (BoxTableModel *)self.boxArray[indexPath.row];
    ItemTableViewController *itemVC = [[ItemTableViewController alloc] init];
    itemVC.transportId = item.ID;
    itemVC.deliveryNodeId = self.deliveryNodeId;
    itemVC.carID = self.carID;
    itemVC.orderNumber = item.transportnumber;
    [self.navigationController pushViewController:itemVC animated:YES];
}

#pragma mark - action
- (void)doneButtonClick{
    [UIAlertViewManager actionSheettWithTitle:@"提醒" message:@"确定取货完成?" withCancelButton:YES actionTitles:@[@"确定"] actionHandler:^(UIAlertAction *action, NSUInteger index) {
        
    }];
}
@end
