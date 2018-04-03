//
//  TATelService.m
//  TAKitTest
//
//  Created by 西安旺豆电子 on 2017/3/27.
//  Copyright © 2017年 TQ. All rights reserved.
//

#import "TATelService.h"

@implementation TATelService


+ (BOOL)checkTel:(NSString *)str
{
    if ([str length] == 0) {
        return NO;
    }
    
    //1[0-9]{10}
    
    //^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$
    
    //    NSString *regex = @"[0-9]{11}";
    
    //    NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(170)|(177)|(18[0-9]))\\d{8}$";
    
    NSString *regex = @"^(1[1-9])\\d{9}$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    BOOL isMatch = [pred evaluateWithObject:str];
    
    if (!isMatch) {
        return NO;
    }
    
    return YES;
}

+ (NSString *)middleHiddenTel:(NSString *)str
{
    NSMutableString *retStr = [[NSMutableString alloc] initWithCapacity:0];
    
    if (str.length >=7) {
        for (int i = 0; i < str.length; ++i) {
            NSString *charStr = [str substringWithRange:NSMakeRange(i,1)];
            if (i >= 3 && i <= 6 ) {
                charStr = @"*";
            }
            
            [retStr appendString:charStr];
        }
    } else {
        [retStr appendString:str];
    }
    
    return retStr;
}

@end
