//
//  NSDate+TADate.m
//  Test0331
//
//  Created by 西安旺豆电子 on 2018/4/2.
//  Copyright © 2018年 TQ. All rights reserved.
//

#import "NSDate+TADate.h"


@implementation NSDate (TADate)

/**
 * 时间转换(NSDate->NSString)
 *
 * @param format  时间格式，比如 TX_DATE_FORMATE1
 * @return         字符串时间
 */
- (NSString *)stringWithFormat:(NSString *)format {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSString *destDateString = [dateFormatter stringFromDate:self];
    return destDateString;
}

/**
 * 时间转换(NSString->NSDate)
 *
 * @param strDate 字符串时间，比如 "1992-05-21 13:08:08"
 * @param format  时间格式，比如 TX_DATE_FORMATE1
 * @return         NSDate时间
 */
+ (NSDate *)dateFromString:(NSString *)strDate format:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: format];
    NSDate *destDate= [dateFormatter dateFromString:strDate];
    return destDate;
}

/**
 * 获取当前时间
 *
 * @param format  时间格式，比如 TX_DATE_FORMATE1
 * @return         字符串时间
 */
+ (NSString *)stringForCurrentTime:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSString *destDateString = [dateFormatter stringFromDate:[NSDate date]];
    return destDateString;
}

/**
 * 获取时间间隔
 *
 * @param timeInterval  时间间隔
 * @param format        时间格式，比如 TX_DATE_FORMATE1
 * @return               字符串时间
 */
+ (NSString*)stringByTimeInterval:(NSString *)timeInterval format:(NSString *)format
{
    NSDate *select = [NSDate dateWithTimeIntervalSince1970:[timeInterval integerValue]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSString *dateAndTime =  [dateFormatter stringFromDate:select];
    return dateAndTime;
}

/**
 * 转换成本地时间
 *
 * @return       本地时间
 */
- (NSDate *)localDate
{
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:self];
    NSDate *localeDate = [self dateByAddingTimeInterval:interval];
    return localeDate;
}

/**
 * 获取月份天数
 *
 * @param month  月份
 * @return        天数
 */
+ (int)daysForMonth:(int)month
{
    if (month == 2) {
        return 28;
    }else if (4 == month || 6 == month || 9 == month || 11 == month){
        return 30;
    }else{
        return 31;
    }
}

/**
 * 格式化时间
 *
 * @param num  时间数字
 * @return     时间
 */
+ (NSString *)formatNumber:(NSInteger)num
{
    NSString *retStr = @"";
    if (num >= 0 && num < 10)
        retStr = [NSString stringWithFormat:@"0%ld",num];
    else
        retStr = [NSString stringWithFormat:@"%ld",num];
    
    return retStr;
}

/**
 * 一个日期和当前日期比较(默认会比较到秒)
 *
 * @return       1-之后的时间; 0-和当前时间相等; -1-之后的时间
 */
- (int)compareNow
{
    NSDate *curDate = [NSDate date];
    
    NSComparisonResult result = [self compare:curDate];
    if (result == NSOrderedDescending) {
        //NSLog(@"date  is in the future");
        return 1;
    } else if (result == NSOrderedAscending){
        //NSLog(@"date is in the past");
        return -1;
    }
    
    //NSLog(@"Both dates are the same");
    return 0;
}


/**
 * 获取指定时间与当前时间的时间差()
 *
 * @param timeInterval  待比较的时间
 * @return       时间差（秒）
 */
+ (long long )remainSecondsForTime:(NSString *)timeInterval
{
    long long theTime = [timeInterval doubleValue];
    long long curTime = [[NSDate date] timeIntervalSince1970];
    
    long long remainTime = theTime-curTime;
    
    return remainTime;
}

/**
 * 获取显示的剩余时间
 *
 * @param time  剩余的秒数
 * @return       显示的时间
 */
+ (NSString *)showTimeForRemainSeconds:(NSInteger)time
{
    NSString *timeStr = @"";
    
    NSInteger day = 0; //天
    NSInteger hour = 0; //时
    NSInteger minute = 0; //分
    NSInteger second = 0; //秒
    if (time <= 0) {
        return @"00:00:00";
    } else if (time < 60) {
        timeStr = [NSString stringWithFormat:@"00:00:%@",[self formatNumber:time]];
    } else {
        minute = time / 60;
        if (minute < 60) {
            second = time % 60;
            
            timeStr = [NSString stringWithFormat:@"00:%@:%@",[self formatNumber:minute],[self formatNumber:second]];
        } else {
            hour = minute / 60;
            if (hour < 24) {
                minute = minute % 60;
                second = time - hour * 3600 - minute * 60;
                
                timeStr = [NSString stringWithFormat:@"%@:%@:%@",[self formatNumber:hour],[self formatNumber:minute],[self formatNumber:second]];
            } else {
                day = hour / 24;
                hour = hour % 24;
                second = time - day * 24 * 60 * 60 - hour * 60 * 60;
                if (second < 60) {
                    minute = 0;
                } else {
                    minute = second / 60;
                    second = second % 60;
                }
                
                timeStr = [NSString stringWithFormat:@"%@天 %@:%@:%@",[self formatNumber:day],[self formatNumber:hour],[self formatNumber:minute],[self formatNumber:second]];
            }
        }
    }
    
    return timeStr;
}

/**
 * 获取strTime时间之前minusDays天的时间
 *
 * @param strTime    时间
 * @param minusDays  天数
 * @return            时间
 */
- (NSString *)minusTimeForTime:(NSString *)strTime minusDays:(int)minusDays
{
    //DebugLog(@"原始日期:%@, 减去天数: %d",strDate,minusDays);
    
    NSString *strYear = [strTime substringWithRange:NSMakeRange(0, 4)];
    NSString *strMonth = [strTime substringWithRange:NSMakeRange(5, 2)];
    NSString *strDay = [strTime substringWithRange:NSMakeRange(8, 2)];
    
    int nYear = [strYear intValue];
    int nMonth = [strMonth intValue];
    int nDay = [strDay intValue];
    
    nDay = nDay - minusDays;
    
    if (nDay <= 0) {
        nMonth = nMonth - 1;
        
        if (nMonth <= 0) {
            nYear = nYear - 1;
            
            nMonth = 12;
            
            int daysOfMonth = [NSDate daysForMonth:12];
            
            nDay = daysOfMonth + nDay;
        } else {
            int daysOfMonth = [NSDate daysForMonth:nMonth];
            
            nDay = daysOfMonth + nDay;
        }
    }
    
    NSString *retYear = [NSString stringWithFormat:@"%d",nYear];
    NSString *retMonth = nMonth < 10 ? [NSString stringWithFormat:@"0%d",nMonth] : [NSString stringWithFormat:@"%d",nMonth];
    NSString *retDay = nDay < 10 ? [NSString stringWithFormat:@"0%d",nDay] : [NSString stringWithFormat:@"%d",nDay];
    
    NSString *retDate = [NSString stringWithFormat:@"%@-%@-%@",retYear,retMonth,retDay];
    
    //DebugLog(@"减去之后的日期:%@",retDate);
    
    return retDate;
}

/**
 * 获取时间差类型
 *
 * @param strTime    时间
 * @return            时间
 */
//- (DATE_DISTANCE_TYPE)timeDistanceTypeForTime:(NSString *)strTime
//{
//    DATE_DISTANCE_TYPE disType;
//
//    //DebugLog(@"原始Date: %@", strDate);
//    NSString *thisYear = [[[NSDate date] description] substringToIndex:4];
//    NSMutableString *strTempDate = [NSMutableString stringWithString:strTime];
//    [strTempDate replaceCharactersInRange:NSMakeRange(0, 4) withString:thisYear];
//    //DebugLog(@"改变后的Date: %@", strTempDate);
//
//    NSDate* compareDate = [NSDate dateFromString:strTempDate format:TA_DATE_FORMATE4];
//    compareDate = [compareDate localDate];
//
//
//    NSDate *today = [[NSDate alloc] init];
//    today = [today localDate];
//    NSString * todayString = [[today description] substringToIndex:10];
//
//
//    NSTimeInterval secondsPerDay = 24 * 60 * 60;
//
//    NSTimeInterval timeInterval = [compareDate timeIntervalSinceDate:today];
//    if (timeInterval < 0)
//    {
//        timeInterval = -timeInterval;
//
//        NSDate* zPointToday = [NSDate dateFromString:todayString format:TA_DATE_FORMATE4];
//        zPointToday = [zPointToday localDate];
//
//        NSTimeInterval todaySpendTime = [today timeIntervalSinceDate:zPointToday];
//        if (todaySpendTime < 0) {
//            todaySpendTime = -todaySpendTime;
//        }
//
//        if (timeInterval > todaySpendTime) {
//            disType = DATE_DIST_AGO;
//        } else {
//            disType = DATE_DIST_TODAY;
//        }
//    }
//    else if (timeInterval > secondsPerDay*2)
//    {
//        disType = DATE_DIST_FUTURE;
//    }
//    else
//    {
//        NSDate *tomorrow, *yesterday, *afterTomorrow;
//
//        yesterday = [today dateByAddingTimeInterval: -secondsPerDay];
//        tomorrow = [today dateByAddingTimeInterval: secondsPerDay];
//        afterTomorrow = [today dateByAddingTimeInterval: secondsPerDay*2];
//
//        //10 first characters of description is the calendar date:
//        NSString * yesterdayString = [[yesterday description] substringToIndex:10];
//        NSString * tomorrowString = [[tomorrow description] substringToIndex:10];
//        NSString * afterTomorrowString = [[afterTomorrow description] substringToIndex:10];
//
//        NSString * dateString = [[compareDate description] substringToIndex:10];
//
//        if ([dateString isEqualToString:todayString]) {
//            disType = DATE_DIST_TODAY;
//        } else if ([dateString isEqualToString:yesterdayString]) {
//            disType = DATE_DIST_AGO;
//        } else if ([dateString isEqualToString:tomorrowString]) {
//            disType = DATE_DIST_TOMORROW;
//        } else if ([dateString isEqualToString:afterTomorrowString]) {
//            disType = DATE_DIST_AFTER_TOMORROW;
//        } else {
//            disType = DATE_DIST_FUTURE;
//        }
//    }
//
//    return disType;
//}

/**
 * 计算指定时间与当前的时间差
 *
 * @return               多少(秒or分or天or月or年)+前 (比如，3天前、10分钟前)
 */
- (NSString *)compareTimeInterval
{
    NSTimeInterval  timeInterval = [self timeIntervalSinceNow];
    timeInterval = -timeInterval;
    long temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%ld分前",temp];
    }
    
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%ld小前",temp];
    }
    
    else if((temp = temp/24) <30){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }
    
    else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%ld月前",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    
    return  result;
}

/**
 * 计算指定时间与当前的时间差
 *
 * @param compareTime   某一指定时间
 * @return               指定显示格式的时间
 */
- (NSString *)timeIntervalByTime:(NSString *)compareTime
{
    double timecontent = [compareTime doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timecontent];
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval0 = [zone secondsFromGMTForDate: date];
    NSDate *localeDate0 = [date  dateByAddingTimeInterval:interval0];
    timecontent = [localeDate0 timeIntervalSince1970];
    
    NSDate *date3 = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *destDateString = [dateFormatter stringFromDate:date3];
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
    [dateFormatter2 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    date3 = [dateFormatter2 dateFromString:[NSString stringWithFormat:@"%@ 00:00:00",destDateString]];
    
    NSInteger interval = [zone secondsFromGMTForDate: date3];
    NSDate *localeDate = [date3  dateByAddingTimeInterval:interval];
    double nowDate = [localeDate timeIntervalSince1970];
    double fTemp = nowDate -  timecontent;
    
    if(fTemp > 24 * 60 * 60)
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSString *destDateString = [dateFormatter stringFromDate:date];
        
        return [NSString stringWithFormat:@"%@",destDateString];
    }
    else if(fTemp > 0)
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"HH:mm"];
        NSString *destDateString = [dateFormatter stringFromDate:date];
        
        return [NSString stringWithFormat:@"昨天%@",destDateString];
    }
    else
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"HH:mm"];
        NSString *destDateString = [dateFormatter stringFromDate:date];
        
        return [NSString stringWithFormat:@"今天 %@",destDateString];
    }
}

/**
 * 计算指定时间与当前的时间差
 *
 * @param compareTime   某一指定时间
 * @return               指定显示格式的时间
 */
- (NSString *)timeIntervalByTimeH:(NSString *)compareTime
{
    double timecontent = [compareTime doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timecontent];
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval0 = [zone secondsFromGMTForDate: date];
    NSDate *localeDate0 = [date  dateByAddingTimeInterval:interval0];
    timecontent = [localeDate0 timeIntervalSince1970];
    
    NSDate *date3 = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *destDateString = [dateFormatter stringFromDate:date3];
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
    [dateFormatter2 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    date3 = [dateFormatter2 dateFromString:[NSString stringWithFormat:@"%@ 00:00:00",destDateString]];
    
    NSInteger interval = [zone secondsFromGMTForDate: date3];
    NSDate *localeDate = [date3  dateByAddingTimeInterval:interval];
    double nowDate = [localeDate timeIntervalSince1970];
    double fTemp = nowDate -  timecontent;
    
    //NSLog(@"date = %@ , %f", date, fTemp);
    
    if(fTemp > 24 * 60 * 60)
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yy-MM-dd HH:mm:ss"];
        NSString *destDateString = [dateFormatter stringFromDate:date];
        
        return [NSString stringWithFormat:@"%@",destDateString];
    }
    else if(fTemp > 0)
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"HH:mm"];
        NSString *destDateString = [dateFormatter stringFromDate:date];
        
        return [NSString stringWithFormat:@"昨天%@",destDateString];
    }
    else
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"HH:mm"];
        NSString *destDateString = [dateFormatter stringFromDate:date];
        
        return [NSString stringWithFormat:@"今天 %@",destDateString];
    }
}

- (NSUInteger)weekDay
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setTimeZone:[NSTimeZone systemTimeZone]];
    
    NSDateComponents *weekdayComponents = [calendar components:NSCalendarUnitWeekday fromDate:self];
    //我们的习惯是周一为第一天，那么我们改一下就OK了
    NSUInteger wDay = [weekdayComponents weekday];
    //将第一天设为周日
    if (wDay == 1) {
        wDay = 7;
    }else{
        wDay = wDay - 1;
    }
    return wDay;
}

- (NSString *)weekDayString
{
    NSArray *weekArray =nil;
    NSString *language = [[NSLocale preferredLanguages] firstObject];
    if ([language hasPrefix:@"en"]) {
        weekArray = @[@"Monday",@"Tuesday",@"Wednesday",@"Thursday",@"Friday", @"Saturday", @"Sunday"];
    }else{
        weekArray = @[@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期天"];
    }
    
    return weekArray[[self weekDay] - 1];
}




@end
