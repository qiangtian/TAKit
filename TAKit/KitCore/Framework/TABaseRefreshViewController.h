//
//  TABaseRefreshViewController.h
//  Test0331
//
//  Created by 西安旺豆电子 on 2017/4/6.
//  Copyright © 2017年 TQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TABaseViewController.h"

@interface TABaseRefreshViewController : TABaseViewController


@property (nonatomic, strong) UITableView *tableView;

@property(nonatomic,assign)BOOL needRefreshHeaderView;
@property(nonatomic,assign)BOOL needRefreshFooterView;

- (id)init;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;

- (id)initWithCoder:(NSCoder *)aDecoder;


- (id)initWithNeedRefreshHeaderView:(BOOL)needRefreshHeaderView
             needRefreshFooterView:(BOOL)needRefreshFooterView;

//子类重写刷新方法
- (void)headerRereshing;
- (void)footerRereshing;


///**
// *  显示没有数据页面
// */
//-(void)showNoDataImage;
//
///**
// *  移除无数据页面
// */
//-(void)removeNoDataImage;


@end
