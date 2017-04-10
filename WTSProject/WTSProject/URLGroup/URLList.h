//
//  URLList.h
//  WTSProject
//
//  Created by Charlot on 2017/3/29.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URLList : NSObject
/*--------------------------------------baseURL------------------------------------*/
+ (NSString *) baseURLStr;
+ (NSString *) basePort;

/*--------------------------------------login------------------------------------*/
+ (NSString *) login_url;


/*--------------------------------------首页任务列表------------------------------------*/
+ (NSString *) task_url;
/*--------------------------------------提 运 操作------------------------------------*/
+ (NSString *) getAndSend_url;
+ (NSString *) getAndSendItem_url;
+ (NSString *) getAndSendItemDetail_url;
+ (NSString *) getAndSend_add_url;
+ (NSString *) getAndSend_delete_url;

/*--------------------------------------运单操作------------------------------------*/
+ (NSString *) delivery_pickOver_url;
+ (NSString *) delivery_sendArrival_url;
+ (NSString *) delivery_scanReceive_url;
+ (NSString *) delivery_inStock_url;

/*--------------------------------------转 操作------------------------------------*/
+ (NSString *) changeItem_get_url;
+ (NSString *) changeItem_add_url;
+ (NSString *) changeItem_delete_url;
+ (NSString *) change_delete_url;

/*--------------------------------------车辆管理------------------------------------*/
+ (NSString *) carTeamManage_add_url;
+ (NSString *) carTeamManage_delete_url;
+ (NSString *) carTeamManage_get_url;

/*--------------------------------------other------------------------------------*/
+ (NSString *) userInfo_url;
+ (NSString *) getAllWhouse_url;

/*--------------------------------------接收列表------------------------------------*/
+ (NSString *) getAllReceiveOrder_url;



@end
