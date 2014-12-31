//
//  JSCoreManager.h
//  JSCoreDemo
//
//  Created by andy on 1/15/15.
//  Copyright (c) 2015 andy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

/// JSCore封装单例
@interface JSCoreManager : NSObject
/// 单例模式
+ (instancetype)shareManager;

/**
 *  获取私有上下文
 *
 *  @return 私有上下文
 */
+ (JSContext *)privateContext;

/**
 *  重置上下文
 */
+ (void)resetContext;

@end

#import "JSCoreManager+InstanceMethod.h"
#import "JSCoreManager+ClassMethod.h"
