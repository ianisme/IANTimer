//
//  RootViewController.m
//  IANTimer_Demo
//
//  Created by ian on 16/3/8.
//  Copyright © 2016年 ian. All rights reserved.
//

#import "RootViewController.h"
#import "NSObject+Timer.h"

@interface RootViewController ()

@end

@implementation RootViewController

#pragma mark - lift style

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(self.view.frame.size.width/2 - 100/2, 100, 100, 50);
    btn1.backgroundColor = [UIColor greenColor];
    [btn1 setTitle:@"启动" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(startClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(self.view.frame.size.width/2 - 100/2, 200, 100, 50);
    btn2.backgroundColor = [UIColor greenColor];
    [btn2 setTitle:@"停止" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(stopClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private method

#pragma mark - action method

- (void)startClick:(UIButton *)btn
{
    [self addTimerAction:@selector(timerAction) forTarget:self seconds:3.0f];
}

- (void)stopClick:(UIButton *)btn
{
    [self removeTimerAction:@selector(timerAction) forTarget:self];
}

- (void)timerAction
{
    NSLog(@"测试");
}

@end
