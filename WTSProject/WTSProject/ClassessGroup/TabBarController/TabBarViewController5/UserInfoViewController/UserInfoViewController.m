//
//  UserInfoViewController.m
//  WTSProject
//
//  Created by Charlot on 2017/4/6.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import "UserInfoViewController.h"
#import "LoginViewController.h"
#import "AppDelegate.h"

@interface UserInfoViewController ()

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [self createNavigationView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createNavigationView{
    self.navigationItem.title = @"我的";
    
    UIButton *infoButton = [UIButton buttonWithString:FontAweStr(FAIconUser)
                             withBackgroundColor:[UIColor whiteColor]
                               withTextAlignment:(NSTextAlignmentCenter)
                                   withTextColor:WTSBlueColor
                                        withFont:FontAweStrFont(25)];
    
    infoButton.frame = CGRectMake(0, 0, 30, 30);
    infoButton.layer.cornerRadius = 15;
    infoButton.layer.masksToBounds = YES;
    [infoButton addTarget:self action:@selector(infoButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
}


- (void)infoButtonClick:(UIButton *)sender{
        [self reSetRootView];
}

- (void)reSetRootView{
    //清空请求头
    [[NSUserDefaults standardUserDefaults] setValue:nil forKey:Basic_Auth];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    LoginViewController *mainView = [[LoginViewController alloc]init];
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    app.window.rootViewController = mainView;
}
@end
