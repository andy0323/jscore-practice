//
//  JSCoreManager+InstanceMethod.m
//  JSCoreDemo
//
//  Created by andy on 1/15/15.
//  Copyright (c) 2015 andy. All rights reserved.
//

#import "JSCoreManager+InstanceMethod.h"

@implementation JSCoreManager (InstanceMethod)

#pragma mark -
#pragma mark 共有函数

/**
 *  在指定的上下文中运行JS代码
 *
 *  @param script  JS代码
 *  @param context JS上下文
 *
 *  @return JSValue 运行结果值
 */
- (JSValue *)runScript:(NSString *)script
           onJSContext:(JSContext *)context
{
    return [context evaluateScript:script];
}

/**
 *  在指定的上下文获取变量
 *
 *  @param variable 变量名
 *  @param context  JS上下文
 *
 *  @return 获取变量值
 */
- (JSValue *)getVariable:(NSString *)variable
             onJSContext:(JSContext *)context
{
    return context[variable];
}

/**
 *  在指定的上下文自定义函数
 *
 *  @param funcationName 函数名
 *  @param runBlock      函数实现
 *  @param context       JS上下文
 */
- (void)createFunction:(NSString *)funcationName
              runBlock:(void(^)(NSArray *args))runBlock
           onJSContext:(JSContext *)context
{
    context[funcationName] = ^(){
        
        if (runBlock) {
            runBlock([JSContext currentArguments]);
        }
    };
}

/**
 *  在指定的上下文运行函数
 *
 *  @param function 函数对象
 *  @param args     函数执行参数
 *  @param context  JS上下文
 *
 *  @return 执行结果
 */
- (JSValue *)runFunction:(NSString *)function
                    args:(NSArray *)args
             onJSContext:(JSContext *)context
{
    return [context[function] callWithArguments:args];
}

/**
 *  JS运行中的异常捕获
 *
 *  @param exceptionHandler 异常捕获成功、回调
 *  @param context          JS上下文
 */
- (void)exceptionHandler:(void(^)(JSContext *con, JSValue *exception))exceptionHandler
             onJSContext:(JSContext *)context
{
    context.exceptionHandler = ^(JSContext *con, JSValue *exception) {
        if (exceptionHandler) {
            exceptionHandler(con, exception);
        }
    };
}
@end
