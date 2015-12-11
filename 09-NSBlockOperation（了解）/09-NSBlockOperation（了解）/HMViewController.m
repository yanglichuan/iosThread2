//
//  HMViewController.m
//  09-NSBlockOperation（了解）
//
//  Created by apple on 14-9-16.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMViewController.h"

@interface HMViewController ()

@end

@implementation HMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSBlockOperation *operation1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"---下载图片----11---%@", [NSThread currentThread]);
    }];
    
    [operation1 addExecutionBlock:^{
        NSLog(@"---下载图片----12---%@", [NSThread currentThread]);
    }];
    
    NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"---下载图片----2---%@", [NSThread currentThread]);
    }];
    
    NSBlockOperation *operation3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"---下载图片----3---%@", [NSThread currentThread]);
    }];
    
    NSBlockOperation *operation4 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"---下载图片----4---%@", [NSThread currentThread]);
    }];
    
    // 1.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    // 主队列
//    NSOperationQueue *queue = [NSOperationQueue mainQueue];
    
    // 2.添加操作到队列中（自动异步执行）
    [queue addOperation:operation1];
    [queue addOperation:operation2];
    [queue addOperation:operation3];
    [queue addOperation:operation4];
}

- (void)test
{
    //    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
    //        NSLog(@"---下载图片----1---%@", [NSThread currentThread]);
    //    }];
    
    NSBlockOperation *operation = [[NSBlockOperation alloc] init];
    
    [operation addExecutionBlock:^{
        NSLog(@"---下载图片----1---%@", [NSThread currentThread]);
    }];
    
    [operation addExecutionBlock:^{
        NSLog(@"---下载图片----2---%@", [NSThread currentThread]);
    }];
    
    [operation addExecutionBlock:^{
        NSLog(@"---下载图片----3---%@", [NSThread currentThread]);
    }];
    
    [operation start];
    
    // 任务数量 > 1，才会开始异步执行
}

@end
