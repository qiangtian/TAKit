//
//  UIImage+SetImage.h
//  Test0331
//
//  Created by 西安旺豆电子 on 2018/4/2.
//  Copyright © 2018年 TQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SetImage)


/*
 * 缩放图片
 * image 图片对象
 * toWidth 宽
 * toHeight 高
 * return 返回图片对象
 */
- (UIImage *)scaleImage:(UIImage *)image toWidth:(int)toWidth toHeight:(int)toHeight;


/** 获得某个颜色的图片 */
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
