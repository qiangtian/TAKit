//
//  TABaseNavController.m
//  TAKitTest
//
//  Created by 西安旺豆电子 on 2017/3/30.
//  Copyright © 2017年 TQ. All rights reserved.
//

#import "TABaseNavController.h"
#import "TAKit.h"


@interface TABaseNavController ()<UINavigationControllerDelegate>

@property (nonatomic, weak) id popDelegate;

@end

@implementation TABaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.popDelegate = self.interactivePopGestureRecognizer;
    self.delegate = self;
    
    //背景色
    self.navigationBar.barTintColor = TA_COLOR_NAV_BG;
    //按钮颜色
    self.navigationBar.tintColor = TA_COLOR_NAV_TITLE;
    //文字颜色
    self.navigationBar.titleTextAttributes = @{
                                            NSForegroundColorAttributeName:TA_COLOR_NAV_TITLE,
                                            NSFontAttributeName:TA_FONT(17)
                                            };
    //设置背景图
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
    
}

/*
 *  解决返回手势失效问题
 */
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (viewController == self.viewControllers[0]) {
        self.interactivePopGestureRecognizer.delegate = self.popDelegate;
    } else {
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}

/*
 *  设置push的时候隐藏tabbar
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count >0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:YES];
}

/*
 *  设置状态栏颜色
 */
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

/*
 *  设置系统箭头返回按钮
 */
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
        UIBarButtonItem *back = [[UIBarButtonItem alloc] init];
        back.title = @"";
        viewController.navigationItem.backBarButtonItem = back;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
