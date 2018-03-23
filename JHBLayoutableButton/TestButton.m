//
//  TestButton.m
//  JHBButton
//
//  Created by jianghongbing on 2017/11/20.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "TestButton.h"

@implementation TestButton
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    UIImage *image = [self imageForState:self.state];
    NSString *title = [self titleForState:self.state];
    NSLog(@"image size:%@, title:%@", NSStringFromCGSize(image.size), title);
    CGRect imageRect = [self imageRectForContentRect:contentRect];
    CGRect titleRect = [super titleRectForContentRect: contentRect];
    NSLog(@"imageRect:%@,titleRect:%@,contentRect:%@",NSStringFromCGRect(imageRect),NSStringFromCGRect(titleRect), NSStringFromCGRect(contentRect));
    return titleRect;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
//    NSInteger titleLableNumberOfLines = self.titleLabel.numberOfLines;
//    NSLog(@"numberOfLines:%ld", titleLableNumberOfLines);
    CGRect imageRect = [super imageRectForContentRect:contentRect];
    NSLog(@"imageRect:%@,contentRect:%@", NSStringFromCGRect(imageRect), NSStringFromCGRect(contentRect));
    return imageRect;
}

@end
