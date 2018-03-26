//
//  TitleOnlyStyleViewController.m
//  JHBLayoutableButton
//
//  Created by pantosoft on 2018/3/26.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "TitleOnlyStyleViewController.h"

@interface TitleOnlyStyleViewController ()

@end

@implementation TitleOnlyStyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *normalStateShortString = @"Tt测试10";
    NSString *normalStateLongStringlongString = @"test测试0123456789";
    NSString *highlightedStateShortString = @"HL测试";
    NSString *hightlightedStateLongString = @"测试12345566645345abcdefg";
    
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:normalStateShortString attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:20]}];
    
    [mutableAttributedString addAttribute:NSUnderlineStyleAttributeName
                                    value:@(NSUnderlineStyleDouble) range:NSMakeRange(1, 3)];
    [mutableAttributedString addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(0, 2)];
    
    
    NSAttributedString *shortAttributeString = mutableAttributedString.copy;
    
    mutableAttributedString =  [[NSMutableAttributedString alloc] initWithString:normalStateLongStringlongString attributes:nil];
    
    [mutableAttributedString addAttribute:NSUnderlineStyleAttributeName
                                    value:@(NSUnderlinePatternDash) range:NSMakeRange(3, 5)];
    [mutableAttributedString addAttribute:NSStrokeColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 6)];
    NSAttributedString *longAttributeString = mutableAttributedString.copy;
    
    
    
    UIButton *buttonOne = [self buttonWithStyle:JHBLayoutableButtonStyleILTR space:10.0 normalStateTitle:normalStateShortString highlightedStateTitle:highlightedStateShortString];
    buttonOne.frame = CGRectMake(10, 80, 100, 40);
    
    UIButton *buttonTwo = [self buttonWithStyle:JHBLayoutableButtonStyleILTR space:10.0 normalStateTitle:normalStateShortString highlightedStateTitle:hightlightedStateLongString];
    buttonTwo.frame = CGRectMake(120, 80, 100, 40);
    
    UIButton *buttonThree = [self buttonWithStyle:JHBLayoutableButtonStyleILTR space:10.0 normalStateTitle:normalStateLongStringlongString highlightedStateTitle:hightlightedStateLongString];
    buttonThree.frame = CGRectMake(230, 80, 100, 40);
    
    UIButton *buttonFour = [self buttonWithStyle:JHBLayoutableButtonStyleILTR space:10.0 normalStateTitle:normalStateShortString highlightedStateTitle:hightlightedStateLongString];
    buttonFour.frame = CGRectMake(10, 130, 100, 40);
    
    UIButton *buttonFive = [self buttonWithStyle:JHBLayoutableButtonStyleILTR space:10.0 normalStateTitle:normalStateShortString highlightedStateTitle:hightlightedStateLongString];
    buttonFive.frame = CGRectMake(120, 130, 100, 40);
    buttonFive.contentEdgeInsets = UIEdgeInsetsMake(10, 20, 10, 10);
    
    UIButton *buttonSix = [self buttonWithStyle:JHBLayoutableButtonStyleILTR space:10.0 normalStateTitle:normalStateShortString highlightedStateTitle:highlightedStateShortString];
    buttonSix.frame = CGRectMake(230, 130, 130, 40);
    buttonSix.titleEdgeInsets = UIEdgeInsetsMake(10, 20, 10, 10);
    
    
    UIButton *buttonSeven = [self buttonWithStyle:JHBLayoutableButtonStyleILTR space:10.0 normalStateTitle:normalStateShortString highlightedStateTitle:highlightedStateShortString];
    [buttonSeven setAttributedTitle:shortAttributeString forState:UIControlStateNormal];
    [buttonSeven setAttributedTitle:longAttributeString forState:UIControlStateHighlighted];
    buttonSeven.frame = CGRectMake(10, 180, 100, 40);
    buttonSeven.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 20);
    
    UIButton *buttonEight = [self buttonWithStyle:JHBLayoutableButtonStyleITTB space:10.0 normalStateTitle:normalStateShortString highlightedStateTitle:highlightedStateShortString];
    buttonEight.frame = CGRectMake(120, 180, 130, 40);
    buttonEight.titleEdgeInsets = UIEdgeInsetsMake(10, 20, 5, 0);
    buttonEight.contentEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 40);
    
    UIButton *buttonNine = [self buttonWithStyle:JHBLayoutableButtonStyleIBTT space:10.0 normalStateTitle:normalStateShortString highlightedStateTitle:hightlightedStateLongString];
    buttonNine.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[[NSLayoutConstraint constraintWithItem:buttonNine attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0], [NSLayoutConstraint constraintWithItem:buttonNine attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:100]]];
    
    UIButton *buttonTen = [self buttonWithStyle:JHBLayoutableButtonStyleITTB space:10.0 normalStateTitle:normalStateLongStringlongString highlightedStateTitle:hightlightedStateLongString];
    buttonTen.titleLabel.numberOfLines = 0;
    buttonTen.frame = CGRectMake(10, 230, 60, 150);
//    buttonTen.titleEdgeInsets = UIEdgeInsetsMake(10, 20, 5, 0);
//    buttonTen.contentEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 40);
    
}
@end
