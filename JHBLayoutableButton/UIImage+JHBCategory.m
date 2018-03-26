//
//  UIImage+JHBCategory.m
//  JHBLayoutableButton
//
//  Created by pantosoft on 2018/3/26.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "UIImage+JHBCategory.h"

@implementation UIImage (JHBCategory)
+ (UIImage *)createImageWithColor:(UIColor *)color size:(CGSize)size {
    if (size.width == 0 || size.height == 0) return nil;
    UIGraphicsBeginImageContextWithOptions(size, YES, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [color setFill];
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
