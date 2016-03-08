//
//  NSObject+Timer.m
//  ian
//
//  Created by ian on 15/11/19.
//  Copyright © 2015年 www.ianisme.com. All rights reserved.
//

#import "NSObject+Timer.h"

@implementation NSObject (Timer)

- (void)addTimerAction:(SEL)action forTarget:(id)target seconds:(CGFloat)seconds
{
    IANTimer *timer = [IANTimer sharedInstance];
    [timer addAction:NSStringFromSelector(action) target:target seconds:seconds];
}

- (void)removeTimerAction:(SEL)action forTarget:(id)target
{
    IANTimer *timer = [IANTimer sharedInstance];
    [timer removeAction:NSStringFromSelector(action) target:target];
}

- (void)removeAtIndex:(NSNumber *)index
{
    IANTimer *timer = [IANTimer sharedInstance];
    [timer removeActionAtIndex:[index integerValue]];
}

@end
