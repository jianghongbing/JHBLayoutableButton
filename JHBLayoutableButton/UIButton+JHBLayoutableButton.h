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
+ (UIButton *)buttonWithLayoutStyle:(JHBLayoutableButtonStyle)layoutStyle spaceBetweenImageAndTitle:(CGFloat)space;
@end
