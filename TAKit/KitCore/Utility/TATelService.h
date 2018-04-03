//
//  TATelService.h
//  TAKitTest
//
//  Created by 西安旺豆电子 on 2017/3/27.
//  Copyright © 2017年 TQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TATelService : NSObject


/**
 * 检查电话号码
 *
 */
+ (BOOL)checkTel:(NSString *)str;

/**
 * 隐藏电话号码中间段
 *
 */
+ (NSString *)middleHiddenTel:(NSString *)str;
@end
