//
//  BaseViewController.m
//  JHBLayoutableButton
//
//  Created by pantosoft on 2018/3/26.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "BaseViewController.h"
@interface BaseViewController ()
@end

@implementation BaseViewController
- (UIButton *)buttonWithStyle:(JHBLayoutableButtonStyle)style
                        space:(CGFloat)space
             normalStateTitle:(NSString *)normalStateTitle
        highlightedStateTitle:(NSString *)hightlightedStateTitle {
    return [self buttonWithStyle:style space:space normalStateTitle:normalStateTitle highlightedStateTitle:hightlightedStateTitle normalStateImage:nil hightlightedStateImage:nil];
}

- (UIButton *)buttonWithStyle:(JHBLayoutableButtonStyle)style
                        space:(CGFloat)space
             normalStateImage:(UIImage *)normalStateImage
       hightlightedStateImage:(UIImage *)highlightedImage {
        return [self buttonWithStyle:style space:space normalStateTitle:nil highlightedStateTitle:nil normalStateImage:normalStateImage hightlightedStateImage:highlightedImage];
}

- (UIButton *)buttonWithStyle:(JHBLayoutableButtonStyle)style
                        space:(CGFloat)space
             normalStateTitle:(NSString *)normalStateTitle
        highlightedStateTitle:(NSString *)hightlightedStateTitle
             normalStateImage:(UIImage *)normalStateImage
       hightlightedStateImage:(UIImage *)highlightedImage {
    return [self buttonWithStyle:style
                           space:space
                normalStateTitle:normalStateTitle
           highlightedStateTitle:hightlightedStateTitle
                normalStateImage:normalStateImage
          hightlightedStateImage:highlightedImage
               contentEdgeInsets:UIEdgeInsetsZero
                 imageEdgeInsets:UIEdgeInsetsZero
                 titleEdgeInsets:UIEdgeInsetsZero];
}

- (UIButton *)buttonWithStyle:(JHBLayoutableButtonStyle)style
                        space:(CGFloat)space
             normalStateTitle:(NSString *)normalStateTitle
        highlightedStateTitle:(NSString *)hightlightedStateTitle
             normalStateImage:(UIImage *)normalStateImage
       hightlightedStateImage:(UIImage *)hightlightedStateImage
            contentEdgeInsets:(UIEdgeInsets)contentEdgeInsets
              imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets
              titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets {
    UIButton *button = [UIButton buttonWithLayoutStyle:style spaceBetweenImageAndTitle:space];
    [button setTitle:normalStateTitle forState:UIControlStateNormal];
    [button setTitle:hightlightedStateTitle forState:UIControlStateHighlighted];
    [button setImage:normalStateImage forState:UIControlStateNormal];
    [button setImage:hightlightedStateImage forState:UIControlStateHighlighted];
    button.contentEdgeInsets = contentEdgeInsets;
    button.titleEdgeInsets = titleEdgeInsets;
    button.imageEdgeInsets = imageEdgeInsets;
    button.backgroundColor = [UIColor blackColor];
    button.titleLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    return button;
}

- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (size.width == 0 || size.height == 0) return nil;
    UIGraphicsBeginImageContextWithOptions(size, YES, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [color setFill];
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)normalStateSmallImage {
    return [self imageWithColor:[UIColor orangeColor] size:CGSizeMake(30, 30)];
}
- (UIImage *)normalStateLargeImage {
    return [self imageWithColor:[UIColor orangeColor] size:CGSizeMake(100, 100)];
}
- (UIImage *)highlightedStateSmallImage {
    return [self imageWithColor:[UIColor blueColor] size:CGSizeMake(30, 50)];
}
- (UIImage *)highlightedStateLargeImage {
    return [self imageWithColor:[UIColor blueColor] size:CGSizeMake(90, 70)];
}
- (NSString *)normalStateShortTitle {
    return @"测试测试";
}
- (NSString *)normalStateLongTitle {
    return @"测试测试button5656";
}
- (NSString *)highlightedStateShortTitle {
    return @"TEST";
}
- (NSString *)highlightedStateLongTitle {
    return @"JHBLAYOUTABLEBUTTON";
}
@end
