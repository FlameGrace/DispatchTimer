//
//  DispatchTimer.m
//  leapmotor
//
//  Created by Flame Grace on 2017/7/31.
//  Copyright © 2017年 Flame Grace. All rights reserved.
//

#import "DispatchTimer.h"

@interface DispatchTimer()

@property (strong, nonatomic) dispatch_source_t timer;
@property (copy, nonatomic) DispatchTimerHandle handle;
@property (readwrite,assign, nonatomic) NSTimeInterval duration;
@property (readwrite,assign, nonatomic) BOOL isValid;
@property (strong, nonatomic) dispatch_queue_t timerQueue;
@property (assign, nonatomic) BOOL hadExecuteOneTime;

@end

@implementation DispatchTimer

- (instancetype)initWithDuration:(NSTimeInterval)duration handleBlock:(DispatchTimerHandle)handleBlock
{
    
    if(self = [super init])
    {
        self.executeWhenStartTimer = YES;
        self.duration = duration;
        self.handle = handleBlock;
    }
    return self;
}


- (NSTimeInterval)duration
{
    NSTimeInterval duration = _duration;
    if(duration<=0)
    {
        duration = 1;
    }
    return duration;
}

- (void)startTimer
{
    if(self.timer && self.isValid){
        return;
    }
    [self endTimer];
    self.hadExecuteOneTime = NO;
    self.isValid = YES;
    DispatchTimerHandle handle = self.handle;
    NSTimeInterval period = self.duration; //设置时间间隔
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, self.timerQueue);
    dispatch_source_set_timer(self.timer, dispatch_walltime(NULL, 0), period * NSEC_PER_SEC, 0); //每秒执行
    __weak typeof(self) weakSelf = self;
    dispatch_source_set_event_handler(self.timer, ^{ //在这里执行事件
        if(!weakSelf.executeWhenStartTimer && !weakSelf.hadExecuteOneTime){
            weakSelf.hadExecuteOneTime = YES;
            return ;
        }
        if(handle){
            handle();
        }
    });
    dispatch_resume(self.timer);
}

- (void)endTimer
{
    if(self.timer)
    {
        dispatch_source_cancel(self.timer);
        self.timer = nil;
    }
    self.isValid = NO;
}

- (dispatch_queue_t)timerQueue
{
    if(!_timerQueue)
    {
        NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
        NSString *identifier = [NSString stringWithFormat:@"DispatchTimer_%f",now];
        _timerQueue = dispatch_queue_create([identifier UTF8String], DISPATCH_QUEUE_SERIAL);
    }
    return _timerQueue;
}

@end
