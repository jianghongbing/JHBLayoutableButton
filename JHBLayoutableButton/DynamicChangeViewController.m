//
//  DynamicChangeViewController.m
//  JHBLayoutableButton
//
//  Created by jianghongbing on 2018/8/4.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "DynamicChangeViewController.h"
#import "UIButton+JHBLayoutableButton.h"
#import "UIImage+Color.h"
@interface DynamicChangeViewController ()

@end

@implementation DynamicChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customNavigationItemTitleView];
    [self configButton1];
    [self configButton2];
    [self configButton3];
    [self configButton4];
    [self configButton5];
    [self configButton6];
}

- (void)customNavigationItemTitleView {
    UIButton *titleButton = [self buttonWithStyle:JHBLayoutableButtonStyleIRTL title:@"PressMe" titleColor:[UIColor whiteColor] backgroundColor:self.view.tintColor imageColor:[UIColor orangeColor] spece:3.0 sel:@selector(titleButtonClicked:)];
    titleButton.adjustsImageWhenHighlighted = NO;
    self.navigationItem.titleView = titleButton;
}

- (void)configButton1 {
    UIButton *button1 = [self buttonWithStyle:JHBLayoutableButtonStyleIRTL title:@"Button1" titleColor:[UIColor whiteColor] backgroundColor:self.view.tintColor imageColor:[UIColor orangeColor] spece:3.0 sel:@selector(button1Clicked:)];
//    button1.frame = CGRectMake(20, 80, 100, 50);
    button1.translatesAutoresizingMaskIntoConstraints = NO;

    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:button1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:100];

    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:button1 attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeadingMargin multiplier:1.0 constant:10];

    [NSLayoutConstraint activateConstraints:@[top, leading]];

}

- (void)configButton2 {
    UIButton *button2 = [self buttonWithStyle:JHBLayoutableButtonStyleIRTL title:@"Button2" titleColor:[UIColor whiteColor] backgroundColor:self.view.tintColor imageColor:[UIColor orangeColor] spece:3.0 sel:@selector(button2Clicked:)];
    button2.translatesAutoresizingMaskIntoConstraints = NO;

    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:button2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:100];

    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:button2 attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeadingMargin multiplier:1.0 constant:200];

    [NSLayoutConstraint activateConstraints:@[top, leading]];
}

- (void)configButton3 {
    UIButton *button3 = [self buttonWithStyle:JHBLayoutableButtonStyleIRTL title:@"Button3" titleColor:[UIColor whiteColor] backgroundColor:self.view.tintColor imageColor:[UIColor orangeColor] spece:3.0 sel:@selector(button3Clicked:)];
    button3.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:button3 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:150];
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:button3 attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeadingMargin multiplier:1.0 constant:10];

    [NSLayoutConstraint activateConstraints:@[top, leading]];
}

- (void)configButton4 {
    UIButton *button4 = [self buttonWithStyle:JHBLayoutableButtonStyleIRTL title:@"Button4" titleColor:[UIColor whiteColor] backgroundColor:self.view.tintColor imageColor:[UIColor orangeColor] spece:3.0 sel:@selector(button4Clicked:)];
    button4.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:button4 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:150];
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:button4 attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeadingMargin multiplier:1.0 constant:200];
    [NSLayoutConstraint activateConstraints:@[top, leading]];
}


- (void)configButton5 {
    UIButton *button5 = [self buttonWithStyle:JHBLayoutableButtonStyleIRTL title:@"Button5" titleColor:[UIColor whiteColor] backgroundColor:self.view.tintColor imageColor:[UIColor orangeColor] spece:3.0 sel:@selector(button4Clicked:)];
    button5.translatesAutoresizingMaskIntoConstraints = NO;
    button5.titleLabel.numberOfLines = 0;
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:button5 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:200];
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:button5 attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeadingMargin multiplier:1.0 constant:10];
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:button5 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:100];
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:button5 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:80];
    [NSLayoutConstraint activateConstraints:@[top, leading, width, height]];
}

- (void)configButton6 {
    UIButton *button6 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button6 setTitle:@"Button6" forState:UIControlStateNormal];
    button6.backgroundColor = self.view.tintColor;
    button6.tintColor = [UIColor whiteColor];
    [button6 addTarget:self action:@selector(button6Clicked:) forControlEvents:UIControlEventTouchUpInside];
    button6.frame = CGRectMake(200, 250, 0, 0);
    [self.view addSubview:button6];
    [button6 sizeToFit];
}




- (UIButton *)buttonWithStyle:(JHBLayoutableButtonStyle)style title:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor imageColor:(UIColor *)imageColor spece:(CGFloat)space sel:(SEL)sel {
    UIButton *button = [UIButton buttonWithLayoutStyle:style spaceBetweenImageAndTitle:space];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    UIImage *backgroundImage = [UIImage imageFromColor:backgroundColor size:CGSizeMake(1.0, 1.0)];
    [button setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    UIImage *image = [UIImage imageFromColor:imageColor size:CGSizeMake(30, 30)];
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    return button;
}




#pragma mark button target actions
- (void)titleButtonClicked:(UIButton *)button {
//    button.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    if (button.titleLabel.font.pointSize == UIFont.buttonFontSize) {
        button.titleLabel.font = [UIFont boldSystemFontOfSize:30];
    }else {
        button.titleLabel.font = [UIFont systemFontOfSize:UIFont.buttonFontSize];
    }

//    [button setTitle:@"Pressfsefsefes" forState:UIControlStateNormal];
//    [button sizeToFit];
}



- (void)button1Clicked:(UIButton *)button {
    if ([button.currentTitle isEqualToString:@"Button1"]) {
        [button setTitle:@"Button1Button1" forState:UIControlStateNormal];
    }else {
        [button setTitle:@"Button1" forState:UIControlStateNormal];

    }
}


- (void)button2Clicked:(UIButton *)button {

    UIImage *image = button.currentImage;
    if (CGSizeEqualToSize(image.size, CGSizeMake(30, 30))) {
        [button setImage:[UIImage imageFromColor:[UIColor orangeColor] size:CGSizeMake(50, 50)] forState:UIControlStateNormal];
    }else {
        [button setImage:[UIImage imageFromColor:[UIColor orangeColor] size:CGSizeMake(30, 30)] forState:UIControlStateNormal];

    }
}

- (void)button3Clicked:(UIButton *)button {

    UIImage *image = button.currentImage;


    if ([button.currentTitle isEqualToString:@"Button3"]) {
        [button setTitle:@"Button3Button3" forState:UIControlStateNormal];
    }else {
        [button setTitle:@"Button3" forState:UIControlStateNormal];

    }

    if (CGSizeEqualToSize(image.size, CGSizeMake(30, 30))) {
        [button setImage:[UIImage imageFromColor:[UIColor orangeColor] size:CGSizeMake(50, 50)] forState:UIControlStateNormal];
    }else {
        [button setImage:[UIImage imageFromColor:[UIColor orangeColor] size:CGSizeMake(30, 30)] forState:UIControlStateNormal];

    }
}

- (void)button4Clicked:(UIButton *)button {
    if (button.titleLabel.font.pointSize == UIFont.buttonFontSize) {
        button.titleLabel.font = [UIFont boldSystemFontOfSize:30];
    }else {
        button.titleLabel.font = [UIFont systemFontOfSize:UIFont.buttonFontSize];
    }
}

- (void)button6Clicked:(UIButton *)button {
    if (button.titleLabel.font.pointSize == UIFont.buttonFontSize) {
        button.titleLabel.font = [UIFont boldSystemFontOfSize:30];
    }else {
        button.titleLabel.font = [UIFont systemFontOfSize:UIFont.buttonFontSize];
    }

    if ([button.currentTitle isEqualToString:@"Button6"]) {
        [button setTitle:@"Button6Button6" forState:UIControlStateNormal];
    }else {
        [button setTitle:@"Button6" forState:UIControlStateNormal];

    }

}

@end
