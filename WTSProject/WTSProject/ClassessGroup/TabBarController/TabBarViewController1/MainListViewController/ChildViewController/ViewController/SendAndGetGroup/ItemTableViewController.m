//
//  ItemTableViewController.m
//  WTSProject
//
//  Created by Charlot on 2017/3/29.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import "ItemTableViewController.h"
#import "ItemTableViewCell.h"
#import "ItemDetailTableViewController.h"
#import "BoxItemTableModel.h"

@interface ItemTableViewController ()
@property (nonatomic,strong) NSArray *itemArray;
@end

@implementation ItemTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.orderNumber;
    [self callHttpForItemData];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        [self callHttpForItemData];
        [self.tableView.mj_header endRefreshing];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - http
- (void)callHttpForItemData{
    __weak ItemTableViewController *weakSelf = self;
    NSString *url = [NSString stringWithFormat:@"%@transportId=%d",[URLList getAndSendItem_url],self.transportId];
    [CallHttpManager getWithUrlString:url
                              success:^(id data) {
                                  if (data) {
                                      weakSelf.itemArray =  [[BoxItemTableModel alloc] getDataWithObject:data];
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
    return [self.itemArray count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ItemTableViewCell class])];
    BoxItemTableModel *item = (BoxItemTableModel *)self.itemArray[indexPath.row];
    if (cell == nil) {
        cell = [[ItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([ItemTableViewCell class])];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    [cell setCellDataWith:item.partNr
                 orderStr:item.orderno
                palletStr:[NSString stringWithFormat:@"%u/%u",item.singlePackageCount,item.trayCount]
                   boxStr:[NSString stringWithFormat:@"%u/%u",item.checkedTrayCount,item.checkedPackageCount]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BoxItemTableModel *item = (BoxItemTableModel *)self.itemArray[indexPath.row];
    ItemDetailTableViewController *itemVC = [[ItemDetailTableViewController alloc] init];
    itemVC.positionId = item.ID;
    itemVC.carID = self.carID;
    itemVC.deliveryNodeId = self.deliveryNodeId;
    itemVC.transportId = self.transportId;
    itemVC.orderNumber = item.partNr;
    [self.navigationController pushViewController:itemVC animated:YES];
}


@end
