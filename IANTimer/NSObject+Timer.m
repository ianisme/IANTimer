//
//  NSObject+Timer.m
//  ian
//
//  Created by ian on 15/11/19.
//  Copyright © 2015年 www.ianisme.com. All rights reserved.
//

#import "NSObject+Timer.h"
#import "XYTimer.h"

@implementation NSObject (Timer)
- (void)addTimerAction:(SEL)action forTarget:(id)target seconds:(CGFloat)seconds
{
    XYTimer *timer = [XYTimer sharedInstance];
    [timer addAction:NSStringFromSelector(action) target:target seconds:seconds];
}

- (void)removeTimerAction:(SEL)action forTarget:(id)target
{
    XYTimer *timer = [XYTimer sharedInstance];
    [timer removeAction:NSStringFromSelector(action) target:target];
}

- (void)removeAtIndex:(NSNumber *)index
{
    XYTimer *timer = [XYTimer sharedInstance];
    [timer removeActionAtIndex:[index integerValue]];
}
@end
