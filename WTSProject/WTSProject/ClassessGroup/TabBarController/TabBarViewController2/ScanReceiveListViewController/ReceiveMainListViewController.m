//
//  ReceiveMainListViewController.m
//  WTSProject
//
//  Created by Charlot on 2017/4/6.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import "ReceiveMainListViewController.h"
#import "FrkSTLivelyButton.h"
#import "PopoverView.h"
#import "ScanForReceiveBoxViewController.h"
#import "ReceiveMainListModel.h"
#import "ReceiveMainTableViewCell.h"
#import "ScanForReceiveViewController.h"

@interface ReceiveMainListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) FrkSTLivelyButton *listButton;
@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation ReceiveMainListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"接收列表" style:(UIBarButtonItemStylePlain) target:nil action:nil];
    self.dataArray = [NSArray new];
    [self createTableView];
    [self createNavigationView];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self callHttpForListData];
        [self.tableView.mj_header endRefreshing];
    }];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView.mj_header beginRefreshing];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - view
- (void)createTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT_WithNavigationBar) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.tableView registerClass:[ReceiveMainTableViewCell class] forCellReuseIdentifier:NSStringFromClass([ReceiveMainTableViewCell class])];
}
- (void)createNavigationView{
    self.navigationItem.title = @"接收列表";
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"扫描接收" style:(UIBarButtonItemStylePlain) target:self action:@selector(scanForReceive)];

}
#pragma mark - http
- (void)callHttpForListData{
    __weak ReceiveMainListViewController *weakSelf = self;
    [CallHttpManager getWithUrlString:[URLList getAllReceiveOrder_url]
                              success:^(id data) {
                                  weakSelf.dataArray = [[ReceiveMainListModel alloc] getDataWithObject:data];
                                  [weakSelf.tableView reloadData];
                              }
                              failure:^(NSError *error) {
                                  
                              }];
}

#pragma mark - table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ReceiveMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ReceiveMainTableViewCell class])];
    ReceiveMainListModel *item = (ReceiveMainListModel *)self.dataArray[indexPath.row];
    if (cell == nil) {
        cell = [[ReceiveMainTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([ReceiveMainTableViewCell class])];
    }
    [cell setCellDataWithOrder:item.nr orderType:item.statusStr toWhereHouse:item.toWhouseName driver:item.driverName carNr:item.carNr createTimeType:[NSString formatDateTimeForCN:item.receivedAt]];

    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ScanForReceiveViewController *scanData = [[ScanForReceiveViewController alloc] init];
    [self.navigationController pushViewController:scanData animated:YES];
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}



#pragma mark - action


- (void)scanForReceive{
    ScanForReceiveBoxViewController *nextView = [[ScanForReceiveBoxViewController alloc] init];
    [self.navigationController pushViewController:nextView animated:YES];
    
}
@end
