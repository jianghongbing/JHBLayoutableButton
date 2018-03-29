//
//  ImageOnlyStyleViewController.m
//  JHBLayoutableButton
//
//  Created by pantosoft on 2018/3/26.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ImageOnlyStyleViewController.h"
#import "UIButton+JHBLayoutableButton.h"
@interface ImageOnlyStyleViewController ()

@end

@implementation ImageOnlyStyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *normalStateSmallImage = [self imageWithColor:[UIColor orangeColor] size:CGSizeMake(40, 40)];
    UIImage *normalStateLargeImage = [self imageWithColor:[UIColor orangeColor] size:CGSizeMake(100, 100)];
    UIImage *highlightedStateSmallImage = [self imageWithColor:[UIColor redColor] size:CGSizeMake(30, 50)];
    UIImage *highlightedStateLargeImage = [self imageWithColor:[UIColor redColor] size:CGSizeMake(60, 90)];
    
    UIButton *buttonOne = [self buttonWithStyle:JHBLayoutableButtonStyleILTR space:10 normalStateImage:normalStateSmallImage hightlightedStateImage:highlightedStateSmallImage];
    buttonOne.frame = CGRectMake(20, 80, 100, 60);
    
    UIButton *buttonTwo = [self buttonWithStyle:JHBLayoutableButtonStyleIBTT space:100 normalStateImage:normalStateLargeImage hightlightedStateImage:highlightedStateSmallImage];
    buttonTwo.frame = CGRectMake(150, 80, 60, 60);
    
    UIButton *buttonThree =  [self buttonWithStyle:JHBLayoutableButtonStyleILTR space:10 normalStateImage:normalStateLargeImage hightlightedStateImage:highlightedStateLargeImage];
    buttonThree.frame = CGRectMake(220, 80, 80, 60);
    
    
    UIButton *buttonFour = [self buttonWithStyle:JHBLayoutableButtonStyleILTR space:10 normalStateImage:normalStateSmallImage hightlightedStateImage:highlightedStateSmallImage];
    buttonFour.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 0, 0);
    buttonFour.frame = CGRectMake(20, 200, 100, 60);
    
    UIButton *buttonFive = [self buttonWithStyle:JHBLayoutableButtonStyleIBTT space:100 normalStateImage:normalStateSmallImage hightlightedStateImage:highlightedStateSmallImage];
    buttonFive.imageEdgeInsets = UIEdgeInsetsMake(10, 20, 30, 30);
    buttonFive.frame = CGRectMake(150, 200, 100, 100);

    UIButton *buttonSix =  [self buttonWithStyle:JHBLayoutableButtonStyleILTR space:10 normalStateImage:normalStateLargeImage hightlightedStateImage:highlightedStateLargeImage];
    buttonSix.translatesAutoresizingMaskIntoConstraints = false;
    [NSLayoutConstraint activateConstraints:@[[NSLayoutConstraint constraintWithItem:buttonSix attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:100], [NSLayoutConstraint constraintWithItem:buttonSix attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]]];

}

@end
