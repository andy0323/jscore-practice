//
//  JSCoreManager+ClassMethod.h
//  JSCoreDemo
//
//  Created by andy on 1/15/15.
//  Copyright (c) 2015 andy. All rights reserved.
//

#import "JSCoreManager.h"

@interface JSCoreManager (ClassMethod)
/**
 *  在指定的上下文中运行JS代码
 *
 *  @param script  JS代码
 *
 *  @return JSValue 运行结果值
 */
+ (JSValue *)runScript:(NSString *)script;

/**
 *  在指定的上下文获取变量
 *
 *  @param variable 变量名
 *
 *  @return 获取变量值
 */
+ (JSValue *)getVariable:(NSString *)variable;

/**
 *  在指定的上下文自定义函数
 *
 *  @param funcationName 函数名
 *  @param runBlock      函数实现
 */
+ (void)createFunction:(NSString *)funcationName
              runBlock:(void(^)(NSArray *args))runBlock;

/**
 *  在指定的上下文运行函数
 *
 *  @param function 函数对象
 *  @param args     函数执行参数
 *
 *  @return 执行结果
 */
+ (JSValue *)runFunction:(NSString *)function
                    args:(NSArray *)args;

/**
 *  JS运行中的异常捕获
 *
 *  @param exceptionHandler 异常捕获成功、回调
 */
+ (void)exceptionHandler:(void(^)(JSContext *con, JSValue *exception))exceptionHandler;

@end
