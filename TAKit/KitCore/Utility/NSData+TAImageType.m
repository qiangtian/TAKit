//
//  NSData+TAImageType.m
//  TAKitTest
//
//  Created by 西安旺豆电子 on 2017/3/28.
//  Copyright © 2017年 TQ. All rights reserved.
//

#import "NSData+TAImageType.h"

@implementation NSData (TAImageType)

- (BOOL)isJPG {
    if (self.length > 4) {
        unsigned char buffer[4];
        [self getBytes:&buffer length:4];
        
        return buffer[0]==0xff &&
        buffer[1]==0xd8 &&
        buffer[2]==0xff &&
        buffer[3]==0xe0;
    }
    
    return NO;
}

- (BOOL)isPNG {
    if (self.length > 4) {
        unsigned char buffer[4];
        [self getBytes:&buffer length:4];
        
        return buffer[0]==0x89 &&
        buffer[1]==0x50 &&
        buffer[2]==0x4e &&
        buffer[3]==0x47;
    }
    
    return NO;
}

- (BOOL)isGIF {
    if(self.length >3) {
        unsigned char buffer[4];
        [self getBytes:&buffer length:4];
        
        return buffer[0]==0x47 &&
        buffer[1]==0x49 &&
        buffer[2]==0x46; //Signature ASCII 'G','I','F'
    }
    return  NO;
}

- (NSString *)getImageType {
    NSString *ret;
    if([self isJPG]) {
        ret=@"jpg";
    }
    else if([self isGIF]) {
        ret=@"gif";
    }
    else if([self isPNG]) {
        ret=@"png";
    }
    else {
        ret=nil;
    }
    return ret;
}

@end
