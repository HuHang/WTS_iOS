//
//  TransferGetInTableViewController.m
//  WTSProject
//
//  Created by Charlot on 2017/4/7.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import "TransferGetInTableViewController.h"
#import "TransferGetInViewController.h"

@interface TransferGetInTableViewController ()

@end

@implementation TransferGetInTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"中转入仓";
    [self createNavigationView];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createNavigationView{
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"添加" style:(UIBarButtonItemStylePlain) target:self action:@selector(addForReceive)];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}


#pragma mark - action
- (void)addForReceive{
    TransferGetInViewController *createView = [[TransferGetInViewController alloc] init];
    [self.navigationController pushViewController:createView animated:YES];
    
}
@end
