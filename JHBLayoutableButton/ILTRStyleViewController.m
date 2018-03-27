//
//  ILTRStyleViewController.m
//  JHBLayoutableButton
//
//  Created by pantosoft on 2018/3/26.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ILTRStyleViewController.h"

@interface ILTRStyleViewController ()

@end

@implementation ILTRStyleViewController

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
    UIButton *buttonOne = [self buttonWithStyle:JHBLayoutableButtonStyleILTR space:0 normalStateTitle:normalStateShortTitle highlightedStateTitle:highlightedStateShortTitle normalStateImage:normalStateSmallImage hightlightedStateImage:highlightedStateSmallImage];
    buttonOne.frame = CGRectMake(10, 80, 120, 60);
    
    UIButton *buttonTwo = [self buttonWithStyle:JHBLayoutableButtonStyleILTR space:10 normalStateTitle:normalStateShortTitle highlightedStateTitle:highlightedStateShortTitle normalStateImage:normalStateSmallImage hightlightedStateImage:highlightedStateSmallImage];
    buttonTwo.frame = CGRectMake(150, 80, 120, 60);
    
    UIButton *buttonThree = [self buttonWithStyle:JHBLayoutableButtonStyleILTR space:10 normalStateTitle:normalStateShortTitle highlightedStateTitle:highlightedStateLongTitle normalStateImage:normalStateSmallImage hightlightedStateImage:highlightedStateSmallImage];
    buttonThree.frame = CGRectMake(10, 150, 120, 60);
    
    UIButton *buttonFour = [self buttonWithStyle:JHBLayoutableButtonStyleILTR space:10 normalStateTitle:normalStateShortTitle highlightedStateTitle:highlightedStateLongTitle normalStateImage:normalStateLargeImage hightlightedStateImage:highlightedStateSmallImage];
    buttonFour.frame = CGRectMake(150, 150, 100, 60);
    
    UIButton *buttonFive = [self buttonWithStyle:JHBLayoutableButtonStyleILTR space:0 normalStateTitle:normalStateLongTitle highlightedStateTitle:highlightedStateLongTitle normalStateImage:normalStateSmallImage hightlightedStateImage:highlightedStateLargeImage];
    buttonFive.frame = CGRectMake(10, 220, 100, 60);
    
    UIButton *buttonSix = [self buttonWithStyle:JHBLayoutableButtonStyleILTR space:10 normalStateTitle:normalStateShortTitle highlightedStateTitle:highlightedStateLongTitle normalStateImage:normalStateSmallImage hightlightedStateImage:highlightedStateSmallImage];
//    buttonSix.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 0);
//    buttonSix.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    buttonSix.titleEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    buttonSix.frame = CGRectMake(150, 220, 120, 60);
    buttonSix.titleLabel.numberOfLines = 0;
    buttonSix.titleLabel.font = [UIFont systemFontOfSize:15];
    
    UIButton *buttonSeven = [self buttonWithStyle:JHBLayoutableButtonStyleILTR space:10 normalStateTitle:normalStateLongTitle highlightedStateTitle:highlightedStateLongTitle normalStateImage:normalStateLargeImage hightlightedStateImage:highlightedStateSmallImage];
    buttonSeven.tag = 7;
//    buttonSeven.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    buttonSeven.frame = CGRectMake(10, 290, 120, 60);
    
    UIButton *buttonEight = [self buttonWithStyle:JHBLayoutableButtonStyleILTR space:10 normalStateTitle:normalStateLongTitle highlightedStateTitle:highlightedStateLongTitle normalStateImage:normalStateLargeImage hightlightedStateImage:highlightedStateSmallImage];
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
