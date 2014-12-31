//
//  JXViewController.m
//  JSCoreDemo
//
//  Created by andy on 1/15/15.
//  Copyright (c) 2015 andy. All rights reserved.
//

#import "JXViewController.h"
#import "JSCoreManager.h"

@interface JXViewController ()

@end

@implementation JXViewController

#pragma mark -
#pragma mark 生命周期函数

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self demoFour_new];
}

#pragma mark -
#pragma mark Simple Demo

- (void)demoOne
{
    // 创建上下文
    JSContext *context = [[JSContext alloc] init];
    
    // 上下文执行程序、获取值
    JSValue *jsVal = [context evaluateScript:@"21+7"];
    
    // 转换值
    int iVal = [jsVal toInt32];
    
    // 打印
    NSLog(@"JSValue: %@, int: %d", jsVal, iVal);
}
- (void)demoOne_new
{
    int value = [JSCoreManager runScript:@"21+7"].toInt32;
    NSLog(@"%d", value);
}


- (void)demoTwo
{
    // 创建上下文
    JSContext *context = [[JSContext alloc] init];
    
    // 上下文执行程序
    [context evaluateScript:@"var arr = [21, 7 , 'iderzheng.com'];"];
    
    // 从上下文中、获取变量
    JSValue *jsArr = context[@"arr"]; // Get array from JSContext
    
    // 打印变量、变量长度
    NSLog(@"JS Array: %@; Length: %@", jsArr, jsArr[@"length"]);
    
    // 修正数组内容
    jsArr[1] = @"blog"; // Use JSValue as array
    jsArr[7] = @7;
    
    // 打印结果
    NSLog(@"JS Array: %@; Length: %d", jsArr, [jsArr[@"length"] toInt32]);
    
    // 类型转换
    NSArray *nsArr = [jsArr toArray];
    
    // 打印结果
    NSLog(@"NSArray: %@", nsArr);
}
- (void)demoTwo_new
{
    [JSCoreManager runScript:@"var _arr = [1, 2, 3];"];
    
    JSValue *arrValue = [JSCoreManager getVariable:@"_arr"];
    
    NSArray *arr = arrValue.toArray;
    
    NSLog(@"%@", arr);
}


- (void)demoThree
{
    // 创建一个上下文
    JSContext *context = [[JSContext alloc] init];
    
    // 设置一个函数
    context[@"log"] = ^() {
        
        // 获取所有参数
        NSArray *args = [JSContext currentArguments];
       
        // 遍历参数、打印
        for (JSValue *jsVal in args) {
            NSLog(@"%@", jsVal);
        }
        
        // 获取会话自身
        JSValue *this = [JSContext currentThis];
        NSLog(@"%@", this);
    };
    
    // 测试打印函数
    [context evaluateScript:@"log('ider', [7, 21], { hello:'world', js:100 });"];
}
- (void)demoThree_new
{
    [JSCoreManager createFunction:@"log" runBlock:^(NSArray *args) {
        for (JSValue *jsVal in args) {
            NSLog(@"%@", jsVal);
        }
    }];
    
    [JSCoreManager runScript:@"log('andy', [1, 1], { name:'andy', age:25 });"];
}


- (void)demoFour
{
    // 创建上下文
    JSContext *context = [[JSContext alloc] init];
    
    // 生成函数
    [context evaluateScript:@"function add(a, b) { return a + b; }"];
    
    // 获取函数
    JSValue *add = context[@"add"];
    NSLog(@"Func: %@", add);
    
    // 函数调用
    JSValue *sum = [add callWithArguments:@[@(7), @(21)]];
    NSLog(@"Sum: %d",[sum toInt32]);
}
- (void)demoFour_new
{
    [JSCoreManager runScript:@"function add(a, b) { return a + b; }"];
    
    JSValue *v = [JSCoreManager runFunction:@"add" args:@[@(1), @(2)]];
    NSLog(@"%d", v.toInt32);
}


- (void)demoFive
{
    // 创建上下文
    JSContext *context = [[JSContext alloc] init];
    
    // JS异常处理
    context.exceptionHandler = ^(JSContext *con, JSValue *exception) {
        NSLog(@"%@", exception);
        con.exception = exception;
    };
    
    // 函数调用
    [context evaluateScript:@"ider.zheng = 21"];
}
- (void)demoFive_new
{
    [JSCoreManager exceptionHandler:^(JSContext *con, JSValue *exception) {
        NSLog(@"异常出错");
    }];
}

@end
