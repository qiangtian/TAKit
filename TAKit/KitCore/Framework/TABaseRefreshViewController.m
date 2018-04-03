//
//  TABaseRefreshViewController.m
//  Test0331
//
//  Created by 西安旺豆电子 on 2017/4/6.
//  Copyright © 2017年 TQ. All rights reserved.
//

#import "TABaseRefreshViewController.h"
#import "MJRefresh.h"
#import "TAKit.h"

@interface TABaseRefreshViewController ()

@property (nonatomic,strong) UIImageView* noDataView;

@end

@implementation TABaseRefreshViewController

-(id)init
{
    self = [super init];
    if (self) {
        [self refreshViewInternalInit];
    }
    return self;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self refreshViewInternalInit];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self refreshViewInternalInit];
    }
    return self;
}

-(id)initWithNeedRefreshHeaderView:(BOOL)needRefreshHeaderView needRefreshFooterView:(BOOL)needRefreshFooterView
{
    self = [super init];
    if (self) {
        _needRefreshHeaderView = needRefreshHeaderView;
        _needRefreshFooterView = needRefreshFooterView;
    }
    return self;
}

/**
 *  懒加载UITableView
 *
 *  @return UITableView
 */
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, TA_SCREEN_WIDTH, TA_SCREEN_HEIGHT - TA_NAV_HEIGHT -TA_TABBAR_HEIGHT) style:UITableViewStylePlain];
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.scrollsToTop = YES;
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}


#pragma mark - Help Init Method

-(void)refreshViewInternalInit
{
    [self.view addSubview:self.tableView];
    
    _needRefreshFooterView = NO;
    _needRefreshHeaderView = NO;
}

-(void)refreshViewLoadInit
{
    if (_needRefreshHeaderView) {
        [self setupHeaderRefresh];
    }
    
    if (_needRefreshFooterView) {
        [self setupFooterRefresh];
    }
}
#pragma mark - 集成刷新控件

- (void)setupHeaderRefresh
{
    // 集成下拉刷新 （有箭头、圆圈、文字）
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRereshing)];
    // 设置文字
    //[header setTitle:@"Pull down to refresh" forState:MJRefreshStateIdle];

    //自动切换透明度（在导航栏下面自动隐藏）
    header.automaticallyChangeAlpha = YES;
    //隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    self.tableView.mj_header = header;
}

-(void)setupFooterRefresh
{
    // 集成上拉加载更多
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
}

#pragma mark 刷新动作处理

/**
 *下拉刷新
 **/
- (void)headerRereshing
{
    [UIView animateWithDuration:1 animations:^{
        
    } completion:^(BOOL finished) {
        [self.tableView.mj_header endRefreshing];
    }];
}

/**
 *上拉加载更多
 **/
- (void)footerRereshing
{
    [UIView animateWithDuration:1 animations:^{
        
    } completion:^(BOOL finished) {
        [self.tableView.mj_footer endRefreshing];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshViewLoadInit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//-(void)showNoDataImage {
//    _noDataView=[[UIImageView alloc] init];
//    [_noDataView setImage:[UIImage imageNamed:@"generl_nodata"]];
//    [self.view.subviews enumerateObjectsUsingBlock:^(UITableView* obj, NSUInteger idx, BOOL *stop) {
//        if ([obj isKindOfClass:[UITableView class]]) {
//            [_noDataView setFrame:CGRectMake(0, 0,obj.frame.size.width, obj.frame.size.height)];
//            [obj addSubview:_noDataView];
//        }
//    }];
//}
//
//-(void)removeNoDataImage {
//    if (_noDataView) {
//        [_noDataView removeFromSuperview];
//        _noDataView = nil;
//    }
//}



@end
