//
//  BaseViewController.h
//  JHBLayoutableButton
//
//  Created by pantosoft on 2018/3/26.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+JHBLayoutableButton.h"
@interface BaseViewController : UIViewController
- (UIButton *)buttonWithStyle:(JHBLayoutableButtonStyle)style
                        space:(CGFloat)space
             normalStateTitle:(NSString *)normalStateTitle
        highlightedStateTitle:(NSString *)hightlightedStateTitle;

- (UIButton *)buttonWithStyle:(JHBLayoutableButtonStyle)style
                        space:(CGFloat)space
             normalStateImage:(UIImage *)normalStateImage
       hightlightedStateImage:(UIImage *)hightlightedStateImage;

- (UIButton *)buttonWithStyle:(JHBLayoutableButtonStyle)style
                        space:(CGFloat)space
             normalStateTitle:(NSString *)normalStateTitle
        highlightedStateTitle:(NSString *)hightlightedStateTitle
             normalStateImage:(UIImage *)normalStateImage
       hightlightedStateImage:(UIImage *)hightlightedStateImage;

- (UIButton *)buttonWithStyle:(JHBLayoutableButtonStyle)style
                        space:(CGFloat)space
             normalStateTitle:(NSString *)normalStateTitle
        highlightedStateTitle:(NSString *)hightlightedStateTitle
             normalStateImage:(UIImage *)normalStateImage
       hightlightedStateImage:(UIImage *)hightlightedStateImage
            contentEdgeInsets:(UIEdgeInsets)contentEdgeInsets
              imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets
              titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets;

- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
- (UIImage *)normalStateSmallImage;
- (UIImage *)normalStateLargeImage;
- (UIImage *)highlightedStateSmallImage;
- (UIImage *)highlightedStateLargeImage;
- (NSString *)normalStateShortTitle;
- (NSString *)normalStateLongTitle;
- (NSString *)highlightedStateShortTitle;
- (NSString *)highlightedStateLongTitle;
@end
