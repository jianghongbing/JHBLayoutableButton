//
//  UIButton+JHBLayoutableButton.h
//  JHBLayoutableButton
//
//  Created by pantosoft on 2018/3/22.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, JHBLayoutableButtonStyle) {
    JHBLayoutableButtonStyleILTR,//image left text right
    JHBLayoutableButtonStyleIRTL, //image right text left
    JHBLayoutableButtonStyleITTB, //image top text bottom
    JHBLayoutableButtonStyleIBTT //image bottom text top
};
@interface UIButton (JHBLayoutableButton)

/**
 UIButton instance convenience construction

 @param layoutStyle button layout sytle
 @param space space between image and title, if only image or title, will be ignored
 @return UIButton instance
 */
+ (UIButton *)buttonWithLayoutStyle:(JHBLayoutableButtonStyle)layoutStyle
          spaceBetweenImageAndTitle:(CGFloat)space;


/**
 UIButton instance convenience construction
 
 @param layoutStyle button layout sytle
 @param space space between image and title, if only image or title, will be ignored
 @param ignoreImageAndTitleEdgeInsets ignore image and title edge insets, edge insets make  layoutcomplicated, suggest use space to layout and ignore all edge insets
 @return UIButton instance
 */
+ (UIButton *)buttonWithLayoutStyle:(JHBLayoutableButtonStyle)layoutStyle
          spaceBetweenImageAndTitle:(CGFloat)space
      ignoreImageAndTitleEdgeInsets: (BOOL)ignoreImageAndTitleEdgeInsets;

/**
 UIButton instance convenience construction
 
 @param layoutStyle button layout sytle
 @param space space between image and title, if only image or title, will be ignored
 @param ignoreAllEdgeInsets ignore button content, image and title edge insets, edge insets make  layout complicated,suggest use space to layout and ignore all edge insets
 @return UIButton instance
 */
+ (UIButton *)buttonWithLayoutStyle:(JHBLayoutableButtonStyle)layoutStyle
          spaceBetweenImageAndTitle:(CGFloat)space
                ignoreAllEdgeInsets:(BOOL)ignoreAllEdgeInsets;
@end
