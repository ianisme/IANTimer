//
//  IANTimer.m
//  ian
//
//  Created by ian on 15/11/19.
//  Copyright © 2015年 www.ianisme.com. All rights reserved.
//

#import "IANTimer.h"

@interface IANTimer()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation IANTimer

+ (instancetype)sharedInstance
{
    static IANTimer *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
        _instance.actions = [[NSMutableArray alloc] init];
        
    });
    return _instance;
}

- (void)addAction:(NSString *)selector target:(id)target seconds:(CGFloat)seconds
{
    @synchronized(self) {
        [self startTimer:seconds];
        
        for (NSDictionary *dic in _actions) {
            if ([dic[@"selector"] isEqualToString:selector] && [target isEqual:dic[@"target"]]) {
                return;
            }
        }
        [_actions addObject:@{@"selector": selector, @"target": target}];
    }
}

- (void)removeAction:(NSString *)selector target:(id)target
{
    @synchronized(self) {
        for (NSDictionary *dic in _actions) {
            if ([dic[@"selector"] isEqualToString:selector] && [target isEqual:dic[@"target"]]) {
                [_actions removeObject:dic];
                break;
            }
        }
        if (_actions.count == 0) {
            [self stopTimer];
        }
    }
}

- (void)removeActionAtIndex:(NSInteger)index
{
    @synchronized(self) {
        if (index >= 0 && index < _actions.count) {
            [_actions removeObjectAtIndex:index];
            
            if (_actions.count == 0) {
                [self stopTimer];
            }
        }
    }
}

- (void)timeActions
{
    [_actions enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSDictionary *dict = (NSDictionary *)obj;
        if (dict[@"selector"] && dict[@"target"]) {
            SEL selector = NSSelectorFromString(dict[@"selector"]);
            IMP imp = [dict[@"target"] methodForSelector:selector];
            void (*func)(id,SEL) = (void *)imp;
            func(dict[@"target"],selector);
        }
    }];
    
}

- (void)stopTimer
{
    if (!_working) {
        return;
    }
    
    [self.timer setFireDate:[NSDate distantFuture]];
    self.working = NO;
}

- (void)startTimer:(CGFloat)seconds
{
    if (_working) {
        return;
    }
    
    if (self.timer) {
        [self.timer setFireDate:[NSDate date]];
    }else{
        self.timer = [NSTimer scheduledTimerWithTimeInterval:seconds target:self selector:@selector(timeActions) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
    self.working = YES;
}

@end
