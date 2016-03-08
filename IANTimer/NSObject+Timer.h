//
//  NSObject+Timer.h
//  ian
//
//  Created by ian on 15/11/19.
//  Copyright © 2015年 www.ianisme.com. All rights reserved.
//

#import <Foundation/Foundation.h>
@class XYTimer;

@interface NSObject (Timer)

- (void)addTimerAction:(SEL)action forTarget:(id)target seconds:(CGFloat)seconds;
- (void)removeTimerAction:(SEL)action forTarget:(id)target;

@end
