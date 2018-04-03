//
//  TAAlertView.h
//  TAKit
//
//  Created by 西安旺豆电子 on 2017/3/27.
//  Copyright © 2017年 TQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TAAlertView : NSObject



/**
 弹出只有确定按钮的对话框

 @param desc 具体显示的信息
 @param viewController 所在的控制器
 */
+ (void)showEnsureAlertWithDesc:(NSString *)desc
                   onController:(__weak UIViewController *)viewController;


/**
 弹出有点击确定按钮之后会触发事件的对话框

 @param title 如果只显示一段信息，不需要title，则该值为nil
 @param content 要显示的信息
 @param onSureBlock 点击确定按钮后的触发事件
 @param viewController 所在的控制器
 */
+ (void)showAlertWithTitle:(NSString *)title
                content:(NSString *)content
                  onSure:(void (^)())onSureBlock
              onController:(__weak UIViewController *)viewController;


/**
 弹出有确定和取消按钮的弹出框/ 有两个按钮的选项

 @param title 提示标题
 @param content 要显示的信息
 @param onSureBlock 确定事件
 @param onCancelBlock 取消事件
 @param sureTitle 确定按钮文字
 @param cancelTitle 取消按钮文字
 @param viewController 控制器
 */
+ (void)showAlertWithTitle:(NSString *)title
                content:(NSString *)content
              onSure:(void(^)())onSureBlock
            onCancel:(void(^)())onCancelBlock
              enSureTitle:(NSString *)sureTitle
            cancelTitle:(NSString *)cancelTitle
              onController:(__weak UIViewController *)viewController;
@end
