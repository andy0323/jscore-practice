//
//  JSCoreManager.m
//  JSCoreDemo
//
//  Created by andy on 1/15/15.
//  Copyright (c) 2015 andy. All rights reserved.
//

#import "JSCoreManager.h"

@interface JSCoreManager ()
@property (nonatomic, strong) JSContext *context;
@end

@implementation JSCoreManager

/// 单例模式
+ (instancetype)shareManager
{
    static JSCoreManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

/// 获取私有的上下文
+ (JSContext *)privateContext
{
    return [[JSCoreManager shareManager] privateContext];
}

/// 重置上下文
+ (void)resetContext
{
    [[JSCoreManager shareManager] resetContext];
}

#pragma mark -
#pragma mark Help Method

- (JSContext *)privateContext
{
    if (!_context) {
        _context = [JSContext new];
    }
    
    return _context;
}

- (void)resetContext
{
    _context = nil;
    _context = [JSContext new];
}

@end
