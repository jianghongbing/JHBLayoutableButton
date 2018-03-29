//
//  StoryboardSegue.m
//  JHBLayoutableButton
//
//  Created by pantosoft on 2018/3/28.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "StoryboardSegue.h"

@implementation StoryboardSegue
- (void)perform {
    NSString *keyPath = @"ignoreImageAndTitleEdgeInsets";
    if ([self.identifier isEqualToString:@"SegueOne"]) {
        [self.destinationViewController setValue:@(YES) forKey:keyPath];
    }else if ([self.identifier isEqualToString:@"SegueTwo"]) {
        [self.destinationViewController setValue:@(NO) forKey:keyPath];
    }else if ([self.identifier isEqualToString:@"SegueThree"]) {
        [self.destinationViewController setValue:[self.sourceViewController valueForKey:keyPath] forKey:keyPath];
    }
    [super perform];
}
@end
