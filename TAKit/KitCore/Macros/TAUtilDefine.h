//
//  TAUtilDefine.h
//  TAKit
//
//  Created by 西安旺豆电子 on 2017/3/27.
//  Copyright © 2017年 TQ. All rights reserved.
//

#ifndef TAUtilDefine_h
#define TAUtilDefine_h

/**
 *  AppDelegate instance
 */
#define TA_APP_DELEGATE ((AppDelegate*)[[UIApplication sharedApplication] delegate])

/**
 *  App is first launch
 */
#define TA_APP_IS_FIRST_LAUNCH      [[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"]

/**
 *  Secure String
 */
#define TA_STRING(object)  (object == nil ? @"":[NSString stringWithFormat:@"%@", object])
#define TA_ARRAY(object)  ( ((object == nil) || ([object isEqual:[NSNull null]])) ? @[] : object )
#define TA_DICTIONARY(object)  ( ((object == nil) || ([object isEqual:[NSNull null]])) ? @{} : object )
#define TA_DIC_VALUE(dic, key) ( (!dic || ![dic isKindOfClass:[NSDictionary class]] || [dic valueForKey:key] == nil || [dic valueForKey:key] == [NSNull null]) ? @"" : [dic valueForKey:key] )

/**
 *  Directory
 */
#define TA_DOCUMENT_PATH(path)    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] \
stringByAppendingPathComponent:path]
#define TA_CACHE_PATH    [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0] \
stringByAppendingPathComponent:path]

/**
 *  UserDefaults
 */
#define TA_USER_DEFAULTS    [NSUserDefaults standardUserDefaults]
//
#define TA_SAVEOBJECT_TO_USERDEFAULTS(key, value)    \
[[NSUserDefaults standardUserDefaults] setObject:value forKey:key];    \
[[NSUserDefaults standardUserDefaults] synchronize];
//
#define TA_GETOBJECT_FROM_USERDEFAULTS(key)    \
[[NSUserDefaults standardUserDefaults] objectForKey:key]

/**
 *  Read bundle file
 */
#define TA_READ_BUNDLE(fn) [NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:fn withExtension:@"bundle"]]

/**
 *  Thread
 */
#define TA_THREAD_BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define TA_THREAD_MAIN(block) dispatch_async(dispatch_get_main_queue(),block)
#define TA_THREAD_AFTER(time, block) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), block)


/**
 *  Text Size
 */

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
#define TA_TEXTSIZE(text, font) [text length] > 0 ? [text sizeWithAttributes:@{NSFontAttributeName:font}] : CGSizeZero;
#else
#define TA_TEXTSIZE(text, font) [text length] > 0 ? [text sizeWithFont:font] : CGSizeZero;
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
#define TA_MULTILINE_TEXTSIZE(text, font, maxSize, mode) [text length] > 0 ? [text \
boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) \
attributes:@{NSFontAttributeName:font} context:nil].size : CGSizeZero;
#else
#define TA_MULTILINE_TEXTSIZE(text, font, maxSize, mode) [text length] > 0 ? [text \
sizeWithFont:font constrainedToSize:maxSize lineBreakMode:mode] : CGSizeZero;
#endif


/**
 *  Alert controller
 */
#define TA_ALERT(fmt)   UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:fmt preferredStyle:UIAlertControllerStyleAlert];[alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];[self presentViewController:alert animated:YES completion:nil];


#endif /* TAUtilDefine_h */
