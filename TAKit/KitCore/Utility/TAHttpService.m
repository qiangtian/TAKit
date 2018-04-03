//
//  TAHttpService.m
//  Test0331
//
//  Created by 西安旺豆电子 on 2017/4/6.
//  Copyright © 2017年 TQ. All rights reserved.
//

#import "TAHttpService.h"
#import "AFNetworking.h"


@implementation TAHttpService



+ (void)requestWithUrl:(NSString *)url
               params:(NSDictionary *)params
               method:(TAHttpRequestMethod )method
            onSuccess:(TAHTTPRequestSuccessHandler )onSuccess
               onFail:(TAHTTPRequestFailHandler )onFali {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    if (method == TAHTTPRequestMethodGET) {
        [manager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSError *error;
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
             if (onSuccess) {
                onSuccess(dict);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (onFali) {
                onFali(error);
            }
        }];
    } else if (method == TAHTTPRequestMethodPOST) {
        [manager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            if (onSuccess) {
                onSuccess(dict);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (onFali) {
                onFali(error);
            }
        }];
    }
}



@end
