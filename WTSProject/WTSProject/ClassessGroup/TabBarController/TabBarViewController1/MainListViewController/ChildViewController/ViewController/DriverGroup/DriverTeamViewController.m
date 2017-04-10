//
//  DriverTeamViewController.m
//  WTSProject
//
//  Created by Charlot on 2017/4/7.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import "DriverTeamViewController.h"

@interface DriverTeamViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UILabel *teamCodeLabel;
@property (nonatomic,strong)UILabel *areaCodeLabel;

@property (nonatomic,strong)UILabel *leaderLabel;
@property (nonatomic,strong)UILabel *phoneLabel;
@property (nonatomic,strong)UILabel *subTitleLabel;

@property (nonatomic,strong)UILabel *countLabel;

@property (nonatomic,strong)UITableView *tableView;


@end

@implementation DriverTeamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createNavigationView{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"添加车辆" style:(UIBarButtonItemStylePlain) target:self action:@selector(addCarAction)];
}

- (void)viewLayout{
    UILabel *imageLabel = [UILabel labelWithString:FontAweStr(FAIconThList) withTextAlignment:(NSTextAlignmentCenter) withTextColor:WTSBlueColor withBackgroundColor:[UIColor whiteColor] withFont:FontAweStrFont(20.f)];
    self.nameLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft) withTextColor:[UIColor blackColor] withFont:SystemFont(14.f)];
    self.teamCodeLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft) withTextColor:[UIColor blackColor] withFont:SystemFont(12.f)];
    self.areaCodeLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft) withTextColor:[UIColor blackColor] withFont:SystemFont(12.f)];
    self.leaderLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft) withTextColor:[UIColor blackColor] withFont:SystemFont(12.f)];
    self.phoneLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft) withTextColor:[UIColor blackColor] withFont:SystemFont(12.f)];
    self.subTitleLabel = [UILabel labelWithTextAlignment:(NSTextAlignmentLeft) withTextColor:[UIColor blackColor] withFont:SystemFont(12.f)];
    UIView *lineView = [self viewWithColor:UIColorFromHEX(0xD9D9D9,1.0)];
    
    [self.view addSubview:imageLabel];
    [self.view addSubview:self.nameLabel];
    [self.view addSubview:self.teamCodeLabel];
    [self.view addSubview:self.areaCodeLabel];
    [self.view addSubview:lineView];
    [self.view addSubview:self.leaderLabel];
    [self.view addSubview:self.phoneLabel];
    [self.view addSubview:self.subTitleLabel];
    
    [imageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(40 , 40));
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.equalTo(imageLabel.mas_right);
        make.right.equalTo(@0);
        make.height.mas_equalTo(20);
    }];
    [self.teamCodeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.height.equalTo(self.nameLabel);
        make.bottom.equalTo(imageLabel);
        make.right.equalTo(self.view.mas_centerX);
    }];
    [self.areaCodeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.height.equalTo(self.teamCodeLabel);
        make.left.equalTo(self.teamCodeLabel.mas_right);
        make.right.equalTo(@0);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(@0);
        make.top.equalTo(imageLabel.mas_bottom).with.mas_offset(6);
        make.height.mas_equalTo(1);
    }];
    
    [self.leaderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageLabel);
        make.top.equalTo(lineView.mas_bottom);
        make.size.equalTo(self.teamCodeLabel);
    }];
    [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.top.equalTo(self.leaderLabel);
        make.left.equalTo(self.leaderLabel.mas_bottom);
    }];
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.height.equalTo(self.leaderLabel);
        make.right.equalTo(@0);
    }];
}

- (void)createTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT_WithNavigationBar-80) style:(UITableViewStylePlain)];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

}


#pragma mark - table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}


#pragma mark 懒加载
- (UIView *)viewWithColor:(UIColor *)viewColor {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = viewColor;
    return view;
}
@end
