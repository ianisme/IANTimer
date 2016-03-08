//
//  IANTimer.h
//  ian
//
//  Created by ian on 15/11/19.
//  Copyright © 2015年 www.ianisme.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IANTimer : NSObject

@property (nonatomic, strong) NSMutableArray *actions;
@property (nonatomic, assign,getter=isWorking) BOOL working;
+ (instancetype)sharedInstance;
- (void)stopTimer;
- (void)startTimer:(CGFloat)seconds;
- (void)addAction:(NSString *)selector target:(id)target seconds:(CGFloat)seconds;
- (void)removeAction:(NSString *)selector target:(id)target;
- (void)removeActionAtIndex:(NSInteger)index;

// 保存目前展开的站点
@property (nonatomic, assign) NSInteger expendUpRequestIndex;
@property (nonatomic, assign) NSInteger expendDownRequestIndex;

@end
