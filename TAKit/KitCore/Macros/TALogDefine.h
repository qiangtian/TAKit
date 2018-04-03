//
//  TALogDefine.h
//  TAKit
//
//  Created by 西安旺豆电子 on 2017/3/27.
//  Copyright © 2017年 TQ. All rights reserved.
//

#ifndef TALogDefine_h
#define TALogDefine_h


/**
 *  Log Print
 */
#ifdef DEBUG
#define TALog( s, ... ) NSLog( @"<%p %@:(%d)> %@", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
//#define TXLog( s, ... ) NSLog( @"<%p %@ %@:(%d)> %@", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __FUNCTION__, __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define TALog( s, ... )
#endif


#endif /* TALogDefine_h */
