//
//  TAHttpService.h
//  Test0331
//
//  Created by 西安旺豆电子 on 2017/4/6.
//  Copyright © 2017年 TQ. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^TAHTTPRequestSuccessHandler)(id jsonObj);
typedef void (^TAHTTPRequestFailHandler)(NSError *error);
typedef void (^TAHTTPRequestProgressHandler)(float progress);

typedef  enum {
    TAHTTPRequestMethodGET = 0,
    TAHTTPRequestMethodPOST,
    TAHTTPRequestMethodPUT,
    TAHTTPRequestMethodDELETE,
    TAHTTPRequestMethodHEAD
}TAHttpRequestMethod;


@interface TAHttpService : NSObject


+ (void)requestWithUrl:(NSString *)url
               params:(NSDictionary *)params
               method:(TAHttpRequestMethod )method
            onSuccess:(TAHTTPRequestSuccessHandler )onSuccess
               onFail:(TAHTTPRequestFailHandler )onFali;
@end
