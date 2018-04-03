//
//  AppDelegate+AppService.h
//  Test0331
//
//  Created by 西安旺豆电子 on 2018/4/2.
//  Copyright © 2018年 TQ. All rights reserved.
//

#import "AppDelegate.h"


/**
 包含第三方 和 应用内业务的实现，减轻入口代码压力
 */
@interface AppDelegate (AppService)



//初始化 window
-(void)initWindow;






//单例
+ (AppDelegate *)shareAppDelegate;

/**
 当前顶层控制器
 */
-(UIViewController*) getCurrentVC;

-(UIViewController*) getCurrentUIVC;

@end
