//
//  TABaseViewController.m
//  Test0331
//
//  Created by 西安旺豆电子 on 2018/4/2.
//  Copyright © 2018年 TQ. All rights reserved.
//

#import "TABaseViewController.h"
#import "TAKit.h"

@interface TABaseViewController ()

@end

@implementation TABaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

-(UILabel *)mainTitleLabel {
    if (_mainTitleLabel == nil) {
        _mainTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,  TA_SCREEN_WIDTH * 0.4, 30)];
        _mainTitleLabel.textAlignment =NSTextAlignmentCenter;
        [_mainTitleLabel setText:@""];
        _mainTitleLabel.textColor = [UIColor blackColor];
        _mainTitleLabel.font = TA_FONT(21);
        self.navigationItem.titleView = _mainTitleLabel;
    }
    return _mainTitleLabel;
}

@end
