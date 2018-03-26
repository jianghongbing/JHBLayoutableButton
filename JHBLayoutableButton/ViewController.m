//
//  ViewController.m
//  JHBLayoutableButton
//
//  Created by pantosoft on 2018/3/22.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ViewController.h"
#import "TestButton.h"
#import "UIButton+JHBLayoutableButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *testButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 600, 100, 40)];
    testButton.backgroundColor = [UIColor orangeColor];
    [testButton setTitle:@"test" forState:UIControlStateNormal];
    [testButton addTarget:self action:@selector(changeText:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testButton];
    
    UIButton *navigationItemButton = [UIButton buttonWithLayoutStyle:JHBLayoutableButtonStyleIRTL spaceBetweenImageAndTitle:5.0];
    navigationItemButton.tag = 100;
    navigationItemButton.frame = CGRectMake(0, 0, 200, 40);
    navigationItemButton.backgroundColor = [UIColor blackColor];
    [navigationItemButton setTitle:@"测试" forState:UIControlStateNormal];
    [navigationItemButton setImage:[self createImageWithColor:[UIColor blueColor] size:CGSizeMake(40, 40)] forState:UIControlStateNormal];
    self.navigationItem.titleView = navigationItemButton;
    
    
//    UIButton *buttonOne = [UIButton buttonWithLayoutStyle:JHBLayoutableButtonStyleIRTL spaceBetweenImageAndTitle:10];
//    buttonOne.frame = CGRectMake(100, 70, 200, 100);
//    buttonOne.tag = 1;
//    buttonOne.backgroundColor = [UIColor blackColor];
//    [buttonOne setTitle:@"abcddefefeafdafsddafd" forState:UIControlStateNormal];
//    [buttonOne setTitle:@"123" forState:UIControlStateHighlighted];
//    [buttonOne setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    buttonOne.titleLabel.font = [UIFont systemFontOfSize:30];
//    [self.view addSubview:buttonOne];
//
//
//    UIButton *buttonTwo = [UIButton buttonWithLayoutStyle:JHBLayoutableButtonStyleIRTL spaceBetweenImageAndTitle:10];
//    buttonTwo.backgroundColor = [UIColor blackColor];
//    buttonTwo.frame = CGRectMake(100, 180, 200, 100);
//    [buttonTwo setImage:[self createImageWithColor:[UIColor orangeColor] size:CGSizeMake(50, 80)] forState:UIControlStateNormal];
//    [buttonTwo setImage:[self createImageWithColor:[UIColor redColor] size:CGSizeMake(40, 40)] forState:UIControlStateHighlighted];
//    [self.view addSubview:buttonTwo];
//
//    UIButton *buttonThree = [UIButton buttonWithLayoutStyle:JHBLayoutableButtonStyleILTR spaceBetweenImageAndTitle:5.0];
//    buttonThree.backgroundColor = [UIColor blackColor];
//    [buttonThree setImage:[self createImageWithColor:[UIColor orangeColor] size:CGSizeMake(50, 80)] forState:UIControlStateNormal];
//    [buttonThree setImage:[self createImageWithColor:[UIColor redColor] size:CGSizeMake(40, 40)] forState:UIControlStateHighlighted];
//    [buttonThree setTitle:@"12345" forState:UIControlStateNormal];
//    [buttonThree setTitle:@"rgfdfgsdfgasdfasdfzdfgdfafads" forState:UIControlStateHighlighted];
//    buttonThree.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.view addSubview:buttonThree];
//
//    [NSLayoutConstraint activateConstraints:@[[NSLayoutConstraint constraintWithItem:buttonThree attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-200], [NSLayoutConstraint constraintWithItem:buttonThree attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]]];
//
//    UIButton *buttonFour = [UIButton buttonWithLayoutStyle:JHBLayoutableButtonStyleITTB spaceBetweenImageAndTitle:5.0];
//    buttonFour.backgroundColor = [UIColor blackColor];
//    [buttonFour setImage:[self createImageWithColor:[UIColor orangeColor] size:CGSizeMake(50, 80)] forState:UIControlStateNormal];
//    [buttonFour setImage:[self createImageWithColor:[UIColor redColor] size:CGSizeMake(40, 40)] forState:UIControlStateHighlighted];
//    [buttonFour setTitle:@"12345" forState:UIControlStateNormal];
//    [buttonFour setTitle:@"rgfdfgsdfgasdfasdfzdfgdfafads" forState:UIControlStateHighlighted];
//    buttonFour.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.view addSubview:buttonFour];
//
//    [NSLayoutConstraint activateConstraints:@[[NSLayoutConstraint constraintWithItem:buttonFour attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-60], [NSLayoutConstraint constraintWithItem:buttonFour attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]]];
    
//    UIButton *buttonTwo = [[TestButton alloc] initWithFrame:CGRectMake(50, 260, 200, 100)];
//    buttonTwo.backgroundColor = [UIColor blackColor];
//    buttonTwo.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10);
//    buttonTwo.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);
//    buttonTwo.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);
//    [buttonTwo setTitle:@"abcddefefeafdafsddafd" forState:UIControlStateNormal];
//    [buttonTwo setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [buttonTwo setImage:[self createImageWithColor:[UIColor orangeColor] size:CGSizeMake(100, 40)] forState:UIControlStateNormal];
//    buttonTwo.titleLabel.backgroundColor = [UIColor blueColor];
//    buttonTwo.adjustsImageWhenHighlighted = NO;
//    [self.view addSubview:buttonTwo];
//
//    UIButton *buttonThree = [[TestButton alloc] initWithFrame:CGRectMake(50, 370, 300, 100)];
//    buttonThree.backgroundColor = [UIColor blackColor];
//
//
//    [buttonThree setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [buttonThree setImage:[self createImageWithColor:[UIColor orangeColor] size:CGSizeMake(40, 40)] forState:UIControlStateNormal];
//    buttonThree.titleLabel.numberOfLines = 0;
//    buttonThree.contentEdgeInsets = UIEdgeInsetsMake(10, 20, 30, 40);
//    buttonThree.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 20, 10);
////    buttonThree.titleEdgeInsets = UIEdgeInsetsMake(-10, -10, 10, 10);
//    [self.view addSubview:buttonThree];
//
//
//    UIButton *buttonFour = [UIButton buttonWithLayoutStyle:JHBLayoutableButtonStyleILTR spaceBetweenImageAndTitle:5.0];
//    buttonFour.tag = 4;
//    buttonFour.frame = CGRectMake(50, 480, 200, 100);
//    buttonFour.backgroundColor = [UIColor blackColor];
//    buttonFour.titleLabel.backgroundColor = [UIColor blueColor];
//    [buttonFour setTitle:@"abcddefefeafdafsddafd" forState:UIControlStateNormal];
//    [buttonFour setTitle:@"123" forState:UIControlStateHighlighted];
//    [buttonFour setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [buttonFour setImage:[self createImageWithColor:[UIColor orangeColor] size:CGSizeMake(40, 40)] forState:UIControlStateNormal];
//    [self.view addSubview:buttonFour];
}

- (UIImage *)createImageWithColor:(UIColor *)color size:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [color setFill];
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)changeText:(UIButton *)button {
//    UIButton *buttonOne = [self.view viewWithTag:1];
//    buttonOne.titleLabel.font = [UIFont systemFontOfSize:15];
    
    UIButton *navigationItemButton = (UIButton *)self.navigationItem.titleView;
    NSString *title = [navigationItemButton titleForState:UIControlStateNormal];
    if ([title isEqualToString:@"测试"]) {
        [navigationItemButton setTitle:@"测试测试测试测试测试测试测试测试" forState:UIControlStateNormal];
    }else {
        [navigationItemButton setTitle:@"测试" forState:UIControlStateNormal];

    }
    
//    UIButton *buttonFour = [self.view viewWithTag:4];
//    if ([[buttonOne titleForState:UIControlStateNormal] isEqualToString:@"1234"]) {
//        [buttonOne setTitle:@"abcddefefeafdafsddafd" forState:UIControlStateNormal];
//        [buttonFour setTitle:@"abcddefefeafdafsddafd" forState:UIControlStateNormal];
//    }else {
//        [buttonOne setTitle:@"1234" forState:UIControlStateNormal];
//        [buttonFour setTitle:@"1234" forState:UIControlStateNormal];
//    }
}

@end
