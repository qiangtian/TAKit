//
//  NSData+TAImageType.h
//  TAKitTest
//
//  Created by 西安旺豆电子 on 2017/3/28.
//  Copyright © 2017年 TQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (TAImageType)

- (NSString *)getImageType;
- (BOOL)isJPG;
- (BOOL)isPNG;
- (BOOL)isGIF;

@end
