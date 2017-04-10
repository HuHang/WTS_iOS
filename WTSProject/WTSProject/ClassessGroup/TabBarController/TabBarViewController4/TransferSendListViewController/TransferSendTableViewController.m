//
//  TransferSendTableViewController.m
//  WTSProject
//
//  Created by Charlot on 2017/4/7.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import "TransferSendTableViewController.h"
#import "TransferSendViewController.h"

@interface TransferSendTableViewController ()

@end

@implementation TransferSendTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"中转发运";
    [self createNavigationView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createNavigationView{
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"添加" style:(UIBarButtonItemStylePlain) target:self action:@selector(addForSend)];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}


#pragma mark - action
- (void)addForSend{
    TransferSendViewController *createView = [[TransferSendViewController alloc] init];
    [self.navigationController pushViewController:createView animated:YES];
    
}
@end
