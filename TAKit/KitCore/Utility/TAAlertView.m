//
//  TAAlertView.m
//  TAKit
//
//  Created by 西安旺豆电子 on 2017/3/27.
//  Copyright © 2017年 TQ. All rights reserved.
//

#import "TAAlertView.h"

@implementation TAAlertView



+ (void)showEnsureAlertWithDesc:(NSString *)desc
                   onController:(__weak UIViewController *)viewController {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:desc preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [viewController presentViewController:alert animated:YES completion:nil];
}


+ (void)showAlertWithTitle:(NSString *)title
                   content:(NSString *)content
                    onSure:(void (^)())onSureBlock
              onController:(__weak UIViewController *)viewController {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title message:content preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (onSureBlock) {
            onSureBlock();
        }
    }];
    
    [controller addAction:action];
    
    [viewController presentViewController:controller animated:YES completion:nil];
}


+ (void)showAlertWithTitle:(NSString *)title
                   content:(NSString *)content
                    onSure:(void(^)())onSureBlock
                  onCancel:(void(^)())onCancelBlock
               enSureTitle:(NSString *)sureTitle
               cancelTitle:(NSString *)cancelTitle
              onController:(__weak UIViewController *)viewController {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title message:content preferredStyle:UIAlertControllerStyleAlert];
    sureTitle = sureTitle.length ? sureTitle : @"确定";
    cancelTitle = cancelTitle.length ? cancelTitle : @"取消";
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:sureTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        if (onSureBlock) {
            onSureBlock();
        }
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (onCancelBlock) {
            onCancelBlock();
        }
    }];
    
    [controller addAction:sureAction];
    [controller addAction:cancelAction];
    
    [viewController presentViewController:controller animated:YES completion:nil];
}
@end
