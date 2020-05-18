//
//  DispatchTimer.h
//  leapmotor
//
//  Created by Flame Grace on 2017/7/31.
//  Copyright © 2017年 Flame Grace. All rights reserved.
//

typedef void(^DispatchTimerHandle)(void);

#import <Foundation/Foundation.h>

@interface DispatchTimer : NSObject

@property (readonly, assign, nonatomic) NSTimeInterval duration;
@property (readonly, assign, nonatomic) BOOL isValid;
@property (assign, nonatomic) BOOL executeWhenStartTimer; //是否在开启定时器时立即执行一次，默认YES

- (instancetype)initWithDuration:(NSTimeInterval)duration handleBlock:(DispatchTimerHandle)handleBlock;

- (void)startTimer;

- (void)endTimer;

@end
