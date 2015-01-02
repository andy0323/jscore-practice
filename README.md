# JavascriptCore-practice

JavascriptCore是一个JS与OC的一个桥梁、通过它可以相互调用、取长补短、更好的进行iOS开发

## JSCoreManager
简单的封装了一个类、来完成这个框架的基础功能。

### API

**重置上下文**  
`+ (void)resetContext;`

**运行JS脚本、获取运行结果**
`+ (JSValue *)runScript:(NSString *)script;`

**获取JS变量**
`+ (JSValue *)getVariable:(NSString *)variable;`

**创建一个函数、**
`+ (void)createFunction:(NSString *)funcationName runBlock:(void(^)(NSArray *args))runBlock;`

**运行一个函数**
`+ (JSValue *)runFunction:(NSString *)function args:(NSArray *)args;`

**异常捕获**
`+ (void)exceptionHandler:(void(^)(JSContext *con, JSValue *exception))exceptionHandler;`