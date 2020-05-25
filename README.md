# DispatchTimer
GCD Timer for iOS or OSX

## 初衷

Apple系统自带的NSTimer使用虽然方便，但是需要自己维护runloop，比较麻烦，而使用GCD的dispatch_source_t则没有这个问题。



## 代码

```objective-c
typedef void(^DispatchTimerHandle)(void);

#import <Foundation/Foundation.h>

@interface DispatchTimer : NSObject

@property (readonly, assign, nonatomic) NSTimeInterval duration;
@property (readonly, assign, nonatomic) BOOL isValid;
@property (assign, nonatomic) BOOL executeWhenStartTimer; //是否在开启定时器时立即执行一次，默认YES

- (instancetype)initWithDuration:(NSTimeInterval)duration handleBlock:(DispatchTimerHandle)handleBlock;
//开启定时器
- (void)startTimer;
//停止定时器
- (void)endTimer;

@end
```

***

**DispatchTimer**可反复开启和停止定时器，并通过*isValid*来判断当前定时器是否在运行中。

*executeWhenStartTimer*：若为YES,则调用startTimer的同时立即执行一次定时器任务。



## Demo及Pod导入

Demo地址：[https://github.com/FlameGrace/DispatchTimer](https://github.com/FlameGrace/DispatchTimer)

```ruby
pod 'DispatchTimer'
```


## 简书主页

[https://www.jianshu.com/u/9c7775326f88](https://www.jianshu.com/u/9c7775326f88)