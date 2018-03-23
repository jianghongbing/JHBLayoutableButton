//
//  ButtonTestViewController.m
//  JHBLayoutableButton
//
//  Created by pantosoft on 2018/3/23.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ButtonTestViewController.h"
#import "UIButton+JHBLayoutableButton.h"
@interface ButtonTestViewController ()

@end

@implementation ButtonTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *buttonOne = [UIButton buttonWithLayoutStyle:JHBLayoutableButtonStyleIRTL spaceBetweenImageAndTitle:0];
    [buttonOne setTitle:@"1234" forState:UIControlStateNormal];
    [buttonOne setTitle:@"abaddfasdfsafafsdafasfdsa" forState:UIControlStateHighlighted];
    [self.view addSubview:buttonOne];
}
@end
