//
//  MainListViewController.m
//  WTSProject
//
//  Created by Charlot on 2017/3/27.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import "MainListViewController.h"


#import "SegmentCustomStyleManager.h"
#import "MainListTableViewCell.h"
#import "FrkSTLivelyButton.h"
#import "OrderIfonListViewController.h"
#import "BoxTableViewController.h"
#import "BoxChangeTableViewController.h"
#import "MainListModel.h"
#import "AddressInfoModel.h"
#import "UserInfoView.h"
#import "PopoverView.h"

#import "TransferGetInViewController.h"
#import "ScanForReceiveBoxViewController.h"
#import "TransferSendViewController.h"
static NSInteger segmentViewHeight = 40;



@interface MainListViewController ()<SegmentCustomViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) SegmentCustomStyleManager *segmentView;
@property (nonatomic,strong) FrkSTLivelyButton *listButton;
@property (nonatomic,strong) NSArray *taskArray;
@property NSInteger segmentViewSelectedIndex;
@end

@implementation MainListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"任务列表" style:(UIBarButtonItemStylePlain) target:nil action:nil];
    self.segmentViewSelectedIndex = 0;
    [self createSegmentView];
    [self createTableView];
    [self createNavigationView];
    [self setMJRefreshHeader];
    [self.tableView.mj_header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





#pragma mark - view
- (void)createSegmentView{
    NSArray *arrar = [NSArray arrayWithObjects:@"待运",@"在途",@"已送达",@"全部", nil];
    self.segmentView = [[SegmentCustomStyleManager alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, segmentViewHeight)];
    self.segmentView.backgroundColor = UIColorFromHEX(0xD9D9D9,1.0);
    self.segmentView.type = PiecewiseInterfaceTypeMobileLin;
    self.segmentView.delegate = self;
    self.segmentView.textFont = [UIFont systemFontOfSize:14.f];
    self.segmentView.textNormalColor = [UIColor grayColor];
    self.segmentView.textSeletedColor = WTSBlueColor;
    self.segmentView.linColor = WTSBlueColor;
    [self.segmentView loadTitleArray:arrar];
    [self.view addSubview:self.segmentView];
}
- (void)createTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, segmentViewHeight, SCREEN_WIDTH, SCREEN_HEIGHT_WithNavAndTabBar-segmentViewHeight) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[MainListTableViewCell class] forCellReuseIdentifier:NSStringFromClass([MainListTableViewCell class])];
}
- (void)createNavigationView{
    self.navigationItem.title = @"任务列表";
    
//    self.listButton = [[FrkSTLivelyButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
//    [self.listButton setStyle:kFrkSTLivelyButtonStyleHamburger animated:NO];
//    [self.listButton addTarget:self action:@selector(listButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:self.listButton];
//    self.navigationItem.rightBarButtonItem = rightItem;
    
}
- (void)setMJRefreshHeader{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        switch (self.segmentViewSelectedIndex) {
            case 0:
            {
                [self callHttpForLoginWithType:@"100"];
            }
                break;
            case 1:
            {
                [self callHttpForLoginWithType:@"200"];
            }
                break;
            case 2:
            {
                [self callHttpForLoginWithType:@"300"];
            }
                break;
            case 3:
            {
                [self callHttpForLoginWithType:@""];
            }
                break;
                
            default:
            {
                [self callHttpForLoginWithType:@""];
            }
                break;
        }
        [self.tableView.mj_header endRefreshing];
    }];
}


#pragma mark - segment delegate
- (void)segmentCustomView:(SegmentCustomStyleManager *)segmentCustomView index:(NSInteger)index{
    self.segmentViewSelectedIndex = index;
    [self.tableView.mj_header beginRefreshing];
}


#pragma mark - http
//userId": 1, "type": type 可以为空，获取全部。100代表待运，200代表在途等
- (void)callHttpForLoginWithType:(NSString *)type{
    __weak MainListViewController *weakSelf = self;
    NSString *url = [NSString stringWithFormat:@"%@searchStateType=%@",[URLList task_url],type];
    [CallHttpManager getWithUrlString:url
                               success:^(id data) {
                                   if (data) {
                                       NSArray *resultAry =  data;
                                       weakSelf.taskArray = [[MainListModel alloc] getDataWithObject:resultAry];
                                       [weakSelf.tableView reloadData];
                                   }
                               }
                               failure:^(NSError *error) {
                                   NSLog(@"2");
                               }];
}


#pragma mark - table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.taskArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MainListTableViewCell class])];
    MainListModel *item = (MainListModel *)self.taskArray[indexPath.row];
    if (cell == nil) {
        cell = [[MainListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([MainListTableViewCell class])];
    }
    [cell setCellData:item.deliveryNodeNr
              getTime:[NSString cutDateTimeForDate:item.deliveryNodeGoToPickDateTime]
             sendTime:[NSString cutDateTimeForDate:item.deliveryNodeShouldSentArrivalDateTime]
            orderType:item.deliveryNodeDeliveryMode];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MainListModel *item = (MainListModel *)self.taskArray[indexPath.row];
    if (item.deliveryNodeDeliveryMode == 300) {
        BoxChangeTableViewController *boxChangeVC = [[BoxChangeTableViewController alloc] init];
        boxChangeVC.deliveryNodeId = item.ID;
        boxChangeVC.isSent = item.isSent;
        boxChangeVC.isPickOver = item.isPickOver;
        [self.navigationController pushViewController:boxChangeVC animated:YES];
    }else{
        BoxTableViewController *boxVC = [[BoxTableViewController alloc] init];
        boxVC.deliveryNodeId = item.ID;
        boxVC.carID = item.carId;
        boxVC.orderNumber = item.deliveryNodeNr;
        [self.navigationController pushViewController:boxVC animated:YES];
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
//侧滑按钮
-(NSArray*)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *rowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"        " handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"删除 %@",indexPath);
    }];
    
    UITableViewRowAction *rowActionSec = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"         " handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        MainListModel *item = (MainListModel *)self.taskArray[indexPath.row];
        OrderIfonListViewController *detail = [[OrderIfonListViewController alloc]init];
        detail.sourceWhouse = [[AddressInfoModel alloc] getAddressInfo:item.deliveryNodeSourceWhouse];
        detail.destinationWhouse = [[AddressInfoModel alloc] getAddressInfo:item.deliveryNodeDestinationWhouse];
        [self.navigationController pushViewController:detail animated:YES];
    }];
    
    rowActionSec.backgroundColor = [UIColor greenColor];
    NSArray *arr = @[rowAction,rowActionSec];
    return arr;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
}

#pragma mark - data format
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    self.hidesBottomBarWhenPushed = YES;
}

#pragma mark - action

- (void)listButtonClick:(FrkSTLivelyButton *)sender{
    [sender setStyle:kFrkSTLivelyButtonStyleCaretDown animated:YES];
    
    
    
    
    [UIAlertViewManager actionSheettWithTitle:@"选择中转操作" message:nil withCancelButton:(YES) actionTitles:@[@"扫描收货",@"中转入仓",@"中转发运"] actionHandler:^(UIAlertAction *action, NSUInteger index) {
        [sender setStyle:kFrkSTLivelyButtonStyleHamburger animated:YES];
        switch (index) {
            case 0:
            {
                ScanForReceiveBoxViewController *nextView = [[ScanForReceiveBoxViewController alloc] init];
                [self.navigationController pushViewController:nextView animated:YES];
            }
                break;
            case 1:
            {
                TransferGetInViewController *nextView = [[TransferGetInViewController alloc] init];
                [self.navigationController pushViewController:nextView animated:YES];
            }
                break;
            case 2:
            {
                TransferSendViewController *nextView = [[TransferSendViewController alloc] init];
                [self.navigationController pushViewController:nextView animated:YES];
            }
                break;
                
            default:
                break;
        }
    }];
}


@end
