//
//  TADeviceDefine.h
//  TAKit
//
//  Created by 西安旺豆电子 on 2017/3/27.
//  Copyright © 2017年 TQ. All rights reserved.
//

#ifndef TADeviceDefine_h
#define TADeviceDefine_h


/**
 *  System info
 */
#define TA_SYS_VERSION ([UIDevice currentDevice].systemVersion)
#define TA_SYS_FLOAT_VERSION ([[[UIDevice currentDevice] systemVersion] floatValue])

#define TA_IS_IOS_V(i) ([[[UIDevice currentDevice] systemVersion] floatValue] >= i)
#define TA_IS_IOS501 (TARGET_OS_IPHONE && __IPHONE_OS_VERSION_MAX_ALLOWED >= 50100)
#define TA_IS_IOS51 (TARGET_OS_IPHONE && __IPHONE_OS_VERSION_MAX_ALLOWED >= 51000)
#define TA_IS_IOS6 ([[UIDevice currentDevice].systemVersion floatValue] >= 6.0)
#define TA_IS_IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define TA_IS_IOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define TA_IS_IOS10 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)


/**
 *  Get Screen info
 */
#define TA_SCREEN_BOUNDS [[UIScreen mainScreen] bounds]
#define TA_SCREEN_WIDTH  [[UIScreen mainScreen] bounds].size.width
#define TA_SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height


/**
 *  Get Frame
 */
#define TA_GETX(v)            (v).frame.origin.x
#define TA_GETY(v)            (v).frame.origin.y
#define TA_GETW(v)            (v).frame.size.width
#define TA_GETH(v)            (v).frame.size.height

#define TA_GETMINX(v)            CGRectGetMinX((v).frame) // 获得控件屏幕的x坐标
#define TA_GRTMINY(v)            CGRectGetMinY((v).frame) // 获得控件屏幕的Y坐标

#define TA_GETMIDX(v)            CGRectGetMidX((v).frame) //横坐标加上到控件中点坐标
#define TA_GETMIDY(v)            CGRectGetMidY((v).frame) //纵坐标加上到控件中点坐标

#define TA_GETMAXX(v)            CGRectGetMaxX((v).frame) //横坐标加上控件的宽度
#define TA_GETMAXY(v)            CGRectGetMaxY((v).frame) //纵坐标加上控件的高度


/**
 *  Get Status Bar height
 */
#define TA_IS_DEVICE_X         (([[UIApplication sharedApplication] statusBarFrame].size.height == 44 )? (YES):(NO))
// Status Bar height
#define TA_STATUS_HEIGHT      [[UIApplication sharedApplication] statusBarFrame].size.height  //64   x== 88
// Nav height
#define TA_NAV_HEIGHT         (TA_STATUS_HEIGHT + 44)
// Tabbar Height
#define TA_TABBAR_HEIGHT      ((TA_IS_DEVICE_X) ? (34 + 49):(49)) // x== 83
// Safe Bottom Height
#define TA_BOTTOM_HEIGHT      ((TA_IS_DEVICE_X) ? 34:0)

/**
 *  Safe Screen Height
 */
//屏幕高度（安全区域）(从顶部 0 开始)
#define SAFE_FROMTOP_SCREEN_HEIGHT     ((TA_IS_DEVICE_X == YES) ? (TA_SCREEN_HEIGHT - 34):(TA_SCREEN_HEIGHT))
//除去导航栏 中间安全区域高度
#define SAFE_SCREEN_HEIGHT      ((TA_IS_DEVICE_X == YES) ? (TA_SCREEN_HEIGHT - 34 - 88):(TA_SCREEN_HEIGHT - 64))



/**
 *  Get Keyboard height
 */
#define TA_KEYBOAED_HEIGHT 252.0f
#define TA_KEYBOAED_HEIGHT_MIN 216.0f







/**
 *  App info
 */
#define TA_APP_NAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define TA_APP_BUILD [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define TA_APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define TA_CUR_LANGUAGE ([[NSLocale preferredLanguages] objectAtIndex:0])


#endif /* TADeviceDefine_h */
