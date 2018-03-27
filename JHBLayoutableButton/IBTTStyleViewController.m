//
//  IBTTStyleViewController.m
//  JHBLayoutableButton
//
//  Created by pantosoft on 2018/3/27.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "IBTTStyleViewController.h"

@interface IBTTStyleViewController ()

@end

@implementation IBTTStyleViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *normalStateShortTitle = [self normalStateShortTitle];
    NSString *normalStateLongTitle = [self normalStateLongTitle];
    NSString *highlightedStateShortTitle = [self highlightedStateShortTitle];
    NSString *highlightedStateLongTitle = [self highlightedStateLongTitle];
    UIImage *normalStateSmallImage = [self normalStateSmallImage];
    UIImage *normalStateLargeImage = [self normalStateLargeImage];
    UIImage *highlightedStateSmallImage = [self highlightedStateSmallImage];
    UIImage *highlightedStateLargeImage = [self highlightedStateLargeImage];
    UIButton *buttonOne = [self buttonWithStyle:JHBLayoutableButtonStyleIBTT space:0 normalStateTitle:normalStateShortTitle highlightedStateTitle:highlightedStateShortTitle normalStateImage:normalStateSmallImage hightlightedStateImage:highlightedStateSmallImage];
    buttonOne.frame = CGRectMake(10, 80, 80, 100);
    
    UIButton *buttonTwo = [self buttonWithStyle:JHBLayoutableButtonStyleIBTT space:10 normalStateTitle:normalStateShortTitle highlightedStateTitle:highlightedStateShortTitle normalStateImage:normalStateSmallImage hightlightedStateImage:highlightedStateSmallImage];
    buttonTwo.frame = CGRectMake(100, 80, 80, 100);
    
    UIButton *buttonThree = [self buttonWithStyle:JHBLayoutableButtonStyleIBTT space:10 normalStateTitle:normalStateShortTitle highlightedStateTitle:highlightedStateLongTitle normalStateImage:normalStateSmallImage hightlightedStateImage:highlightedStateSmallImage];
    buttonThree.frame = CGRectMake(200, 80, 80, 100);
    
    UIButton *buttonFour = [self buttonWithStyle:JHBLayoutableButtonStyleIBTT space:10 normalStateTitle:normalStateShortTitle highlightedStateTitle:highlightedStateLongTitle normalStateImage:normalStateLargeImage hightlightedStateImage:highlightedStateSmallImage];
    buttonFour.frame = CGRectMake(10, 200, 80, 100);
    
    UIButton *buttonFive = [self buttonWithStyle:JHBLayoutableButtonStyleIBTT space:0 normalStateTitle:normalStateLongTitle highlightedStateTitle:highlightedStateLongTitle normalStateImage:normalStateSmallImage hightlightedStateImage:highlightedStateLargeImage];
    buttonFive.frame = CGRectMake(100, 200, 80, 100);
    
    UIButton *buttonSix = [self buttonWithStyle:JHBLayoutableButtonStyleIBTT space:10 normalStateTitle:normalStateShortTitle highlightedStateTitle:highlightedStateShortTitle normalStateImage:normalStateSmallImage hightlightedStateImage:highlightedStateSmallImage];
    buttonSix.titleEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    buttonSix.frame = CGRectMake(200, 200, 60, 100);
    buttonSix.titleLabel.numberOfLines = 0;
    buttonSix.titleLabel.font = [UIFont systemFontOfSize:15];
    //    //
    UIButton *buttonSeven = [self buttonWithStyle:JHBLayoutableButtonStyleIBTT space:10 normalStateTitle:normalStateLongTitle highlightedStateTitle:highlightedStateLongTitle normalStateImage:normalStateLargeImage hightlightedStateImage:highlightedStateSmallImage];
    buttonSeven.tag = 7;
    //    buttonSeven.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    buttonSeven.frame = CGRectMake(10, 320, 60, 100);
    //    //
    UIButton *buttonEight = [self buttonWithStyle:JHBLayoutableButtonStyleIBTT space:10 normalStateTitle:normalStateLongTitle highlightedStateTitle:highlightedStateLongTitle normalStateImage:normalStateLargeImage hightlightedStateImage:highlightedStateSmallImage];
    buttonEight.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    buttonEight.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    buttonEight.titleEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    buttonEight.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[[NSLayoutConstraint constraintWithItem:buttonEight attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0], [NSLayoutConstraint constraintWithItem:buttonEight attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-20]]];
    [buttonEight addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClick:(UIButton *)button {
    UIButton *tagButton = [self.view viewWithTag:7];
    if (UIEdgeInsetsEqualToEdgeInsets(tagButton.contentEdgeInsets, UIEdgeInsetsZero)) {
        tagButton.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    }else {
        tagButton.contentEdgeInsets = UIEdgeInsetsZero;
    }
}
@end
