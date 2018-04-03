//
//  NSDate+TADate.h
//  Test0331
//
//  Created by 西安旺豆电子 on 2018/4/2.
//  Copyright © 2018年 TQ. All rights reserved.
//

#import <Foundation/Foundation.h>

//时间格式宏定义
#define TA_DATE_FORMATE1 @"yyyy-MM-dd HH:mm:ss SSS"
#define TA_DATE_FORMATE2 @"yyyyMMddHHmmssSSS"
#define TA_DATE_FORMATE3 @"yyyy-MM-dd HH:mm:ss"
#define TA_DATE_FORMATE4 @"yyyy-MM-dd"
#define TA_DATE_FORMATE5 @"yyyy年MM月dd日"
#define TA_DATE_FORMATE6 @"yyyy-MM-dd HH:mm"

typedef enum _DATE_DISTANCE_TYPE {
    DATE_DIST_AGO,
    DATE_DIST_TODAY,
    DATE_DIST_TOMORROW,
    DATE_DIST_AFTER_TOMORROW,
    DATE_DIST_FUTURE
}DATE_DISTANCE_TYPE;



@interface NSDate (TADate)

/**
 * 时间转换(NSDate->NSString)
 *
 * @param format  时间格式，比如 TX_DATE_FORMATE1
 * @return         字符串时间
 */
- (NSString *)stringWithFormat:(NSString *)format;

/**
 * 时间转换(NSString->NSDate)
 *
 * @param strDate 字符串时间，比如 "1992-05-21 13:08:08"
 * @param format  时间格式，比如 TX_DATE_FORMATE1
 * @return         NSDate时间
 */
+ (NSDate *)dateFromString:(NSString *)strDate format:(NSString *)format;

/**
 * 获取当前时间
 *
 * @param format  时间格式，比如 TX_DATE_FORMATE1
 * @return         字符串时间
 */
+ (NSString *)stringForCurrentTime:(NSString *)format;

/**
 * 获取时间间隔
 *
 * @param timeInterval  时间间隔
 * @param format        时间格式，比如 TX_DATE_FORMATE1
 * @return               字符串时间
 */
+ (NSString*)stringByTimeInterval:(NSString *)timeInterval format:(NSString *)format;

+ (NSString *)formatNumber:(NSInteger)num;

/**
 * 转换成本地时间
 *
 * @return       本地时间
 */
- (NSDate *)localDate;

/**
 * 获取月份天数
 *
 * @param month  月份
 * @return        天数
 */
+ (int)daysForMonth:(int)month;


/**
 * 一个日期和当前日期比较(默认会比较到秒)
 *
 * @return       1-之后的时间; 0-和当前时间相等; -1-之后的时间
 */
- (int)compareNow;

/**
 * 获取指定时间与当前时间的时间差()
 *
 * @param timeInterval  待比较的时间
 * @return       时间差（秒）
 */
+ (long long )remainSecondsForTime:(NSString *)timeInterval;

/**
 * 获取显示的剩余时间
 *
 * @param time  剩余的秒数
 * @return       显示的时间
 */
+ (NSString *)showTimeForRemainSeconds:(NSInteger)time;

/**
 * 获取strTime时间之前minusDays天的时间
 *
 * @param strTime    时间
 * @param minusDays  天数
 * @return            时间
 */
- (NSString *)minusTimeForTime:(NSString *)strTime minusDays:(int)minusDays;

/**
 * 获取时间差类型
 *
 * @param strTime    时间
 * @return            时间
 */
//- (DATE_DISTANCE_TYPE)timeDistanceTypeForTime:(NSString *)strTime;

/**
 * 计算指定时间与当前的时间差
 *
 * @return               多少(秒or分or天or月or年)+前 (比如，3天前、10分钟前)
 */
- (NSString *)compareTimeInterval;

/**
 * 计算指定时间与当前的时间差
 *
 * @param compareTime   某一指定时间
 * @return               指定显示格式的时间
 */
- (NSString *)timeIntervalByTime:(NSString *)compareTime;

/**
 * 计算指定时间与当前的时间差
 *
 * @param compareTime   某一指定时间
 * @return               指定显示格式的时间
 */
- (NSString *)timeIntervalByTimeH:(NSString *)compareTime;

/**
 获取星期 返回数字NSUInteger
 
 @return 返回数字
 */
- (NSUInteger)weekDay;

/**
 获取星期 返回字符串
 
 @return 返回字符
 */
- (NSString *)weekDayString;

@end
