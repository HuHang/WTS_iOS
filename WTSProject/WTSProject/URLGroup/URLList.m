//
//  URLList.m
//  WTSProject
//
//  Created by Charlot on 2017/3/29.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import "URLList.h"

@implementation URLList



/**
 接口

 @return URL
 */
+ (NSString *) baseURLStr{
    NSString *baseUrl;
    if ([[NSUserDefaults standardUserDefaults]valueForKey:BaseURL]) {
        baseUrl = [[NSUserDefaults standardUserDefaults]valueForKey:BaseURL];
    }else{
        baseUrl = @"42.121.111.38";
    }
    return baseUrl;
}

/**
 端口

 @return port
 */
+ (NSString *) basePort{
    NSString *port;
    if ([[NSUserDefaults standardUserDefaults] valueForKey:BasePORT]) {
        port = [[NSUserDefaults standardUserDefaults] valueForKey:BasePORT];
    }else{
        port = @"9001";
    }
    return port;
}

/**
 完整URL

 @return baseUrlWithPort
 */
+ (NSString *) baseUrlWithPort{
    return [NSString stringWithFormat:@"http://%@:%@",[self baseURLStr],[self basePort]];
}



/**
 登录

 @return 登录URL
 */
+ (NSString *) login_url{
    NSString *loginUrl = @"/api/users/Login?";
    return  [NSString stringWithFormat:@"%@%@",[self baseUrlWithPort],loginUrl];
}

/**
 首页任务列表

 @return 任务列表URL
 */
+ (NSString *) task_url{
    NSString *taskUrl = @"/api/deliverynode/ListByCarDriver?";
    return  [NSString stringWithFormat:@"%@%@",[self baseUrlWithPort],taskUrl];
}

/**
 用户信息 get

 @return url
 */
+ (NSString *) userInfo_url{
    NSString *userInfoUrl = @"/api/Users/UserInfo";
    return  [NSString stringWithFormat:@"%@%@",[self baseUrlWithPort],userInfoUrl];
}

/**
 车辆管理-添加 post
 参数:carId=1&userId=1&deliveryNodeId=24&carTrailerId=*
 @return url
 */
+ (NSString *) carTeamManage_add_url{
    NSString *carTeamManageUrl = @"/api/DeliveryNodeCars/AddCars?";
    return  [NSString stringWithFormat:@"%@%@",[self baseUrlWithPort],carTeamManageUrl];
}

/**
 车辆管理-删除 post
 参数:id=*
 @return url
 */
+ (NSString *) carTeamManage_delete_url{
    NSString *carTeamManageUrl = @"/api/DeliveryNodeCars/DeleteCars?";
    return  [NSString stringWithFormat:@"%@%@",[self baseUrlWithPort],carTeamManageUrl];
}

/**
 获取运单车辆 get
 参数:carTroopId=***
 @return url
 */
+ (NSString *) carTeamManage_get_url{
    NSString *carTeamManageUrl = @"/api/cars/GetCarNr?";
    return  [NSString stringWithFormat:@"%@%@",[self baseUrlWithPort],carTeamManageUrl];
}

/**
 提 运 订单列表
 deliveryNodeId=*
 @return url
 */
+ (NSString *) getAndSend_url{
    NSString *getAndSendUrl = @"/api/DeliveryNode/ListTransportByDelivery?";
    return  [NSString stringWithFormat:@"%@%@",[self baseUrlWithPort],getAndSendUrl];
}
/**
 提 运 零件列表
 transportId=
 @return url
 */
+ (NSString *) getAndSendItem_url{
    NSString *getAndSendItemUrl = @"/api/EdiAsnTransport/ListPositions?";
    return  [NSString stringWithFormat:@"%@%@",[self baseUrlWithPort],getAndSendItemUrl];
}
/**
 提 运 小包装列表
 positionId=*
 @return url
 */
+ (NSString *) getAndSendItemDetail_url{
    NSString *getAndSendItemDetailUrl = @"/api/EdiAsnPackage/ListByPosition?";
    return  [NSString stringWithFormat:@"%@%@",[self baseUrlWithPort],getAndSendItemDetailUrl];
}
/**
 提 运 添加 post
 packageNr=M124&deliveryNodeId=11&transportId=1&positionId=12&carId=12
 @return url
 */
//http://42.121.111.38:9001/api/EdiAsnPackage/CreateAndCheckByNr?packageNr=ertyhgfe4&deliveryNodeId=21&transportId=8&positionId=43&carId=0
+ (NSString *) getAndSend_add_url{
    NSString *getAndSendAdd = @"/api/EdiAsnPackage/CreateAndCheckByNr?";
    return  [NSString stringWithFormat:@"%@%@",[self baseUrlWithPort],getAndSendAdd];
}
/**
 提 运 删除 post
 packageNr=M124&deliveryNodeId=11&transportId=1&positionId=12&carId=12
 @return url
 */
+ (NSString *) getAndSend_delete_url{
    NSString *getAndSendDelete = @"/api/EdiAsnPackage/DeleteAndUncheckByNr?";
    return  [NSString stringWithFormat:@"%@%@",[self baseUrlWithPort],getAndSendDelete];
}

/**
 运单操作 取货完成 post
 deliveryNodeId=*
 @return url
 */
+ (NSString *) delivery_pickOver_url{
    NSString *deliveryPickOver = @"/api/DeliveryNode/PickOver?";
    return  [NSString stringWithFormat:@"%@%@",[self baseUrlWithPort],deliveryPickOver];
}
/**
 运单操作 运单送达 post
 deliveryNodeId=*
 @return url
 */
+ (NSString *) delivery_sendArrival_url{
    NSString *deliverySendArrival = @"/api/DeliveryNode/SendArrival?";
    return  [NSString stringWithFormat:@"%@%@",[self baseUrlWithPort],deliverySendArrival];
}
/**
 运单操作 扫描收货 post
 packageNr=*&whouseId=*
 @return url
 */
+ (NSString *) delivery_scanReceive_url{
    NSString *deliveryScanReceive = @"/api/EdiAsnPackage/Receive?";
    return  [NSString stringWithFormat:@"%@%@",[self baseUrlWithPort],deliveryScanReceive];
}
/**
 运单操作 中转入库 post
 packageNr=*&whouseId=*
 @return url
 */
+ (NSString *) delivery_inStock_url{
    NSString *deliveryInStock = @"/api/EdiAsnPackage/InStock?";
    return  [NSString stringWithFormat:@"%@%@",[self baseUrlWithPort],deliveryInStock];
}

/**
 转 包装列表获取 get
 deliveryNodeId=*
 @return url
 */
+ (NSString *) changeItem_get_url{
    NSString *changeGet = @"/api/EdiAsnPackage/ListByDeliveryNode?";
    return  [NSString stringWithFormat:@"%@%@",[self baseUrlWithPort],changeGet];
}
/**
 转 包装添加 post
 packageNr=*&deliveryNodeId=*
 @return url
 */
+ (NSString *) changeItem_add_url{
    NSString *changeAdd = @"/api/EdiAsnPackage/AddToDeliveryNode?";
    return  [NSString stringWithFormat:@"%@%@",[self baseUrlWithPort],changeAdd];
}
/**
 转 包装删除 post
 packageNr=*&deliveryNodeId=*
 @return url
 */
+ (NSString *) changeItem_delete_url{
    NSString *changeItemDelete = @"/api/EdiAsnPackage/RemoveFromDeliveryNode?";
    return  [NSString stringWithFormat:@"%@%@",[self baseUrlWithPort],changeItemDelete];
}

/**
 转 删除(只有canBeDeleted为true时可以删除) post
 deliveryNodeId=*
 @return url
 */
+ (NSString *) change_delete_url{
    NSString *changeDelete = @"/api/DeliveryNode/Delete?";
    return  [NSString stringWithFormat:@"%@%@",[self baseUrlWithPort],changeDelete];
}

/**
 获取仓库 get

 @return url
 */
+ (NSString *) getAllWhouse_url{
    NSString *getAllWhouse = @"/api/Whouse/GetAll";
    return  [NSString stringWithFormat:@"%@%@",[self baseUrlWithPort],getAllWhouse];
}




/**
 接收列表 get
 
 @return url
 */
+ (NSString *) getAllReceiveOrder_url{
    NSString *getAllWhouse = @"/api/DeliveryReceivedRecord/GetAll";
    return  [NSString stringWithFormat:@"%@%@",[self baseUrlWithPort],getAllWhouse];
}


@end
