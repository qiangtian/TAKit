//
//  NSString+TAMD5.m
//  TAKitTest
//
//  Created by 西安旺豆电子 on 2017/3/28.
//  Copyright © 2017年 TQ. All rights reserved.
//

#import "NSString+TAMD5.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (TAMD5)

- (id)TXMD5String
{
    const char *cStr = [self UTF8String];
    unsigned char digest[16];
    CC_MD5( cStr, (int)strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
    {
        //        [output appendFormat:@"%02x", digest[i]];
        [output appendFormat:@"%x",(digest[i]&0xf0)>>4];
        [output appendFormat:@"%x",digest[i]&0x0f];
    }
    
    return  output;
}


@end
