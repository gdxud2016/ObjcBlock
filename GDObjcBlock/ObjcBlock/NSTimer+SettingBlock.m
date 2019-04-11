//
//  NSTimer+SettingBlock.m
//  GDObjcBlock
//
//  Created by apple on 2019/4/10.
//  Copyright © 2019 apple. All rights reserved.
//

#import "NSTimer+SettingBlock.h"
#import <objc/runtime.h>

@implementation NSTimer (SettingBlock)

+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti repeats:(BOOL)yesOrNo eventCallBackBlock:(NSTimerEventCallBackBlock)callBackBlock
{
    NSTimer * timer = [NSTimer timerWithTimeInterval:ti target:self selector:@selector(timeRuning:) userInfo:[callBackBlock copy]  repeats:yesOrNo];
    return timer;
}

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti repeats:(BOOL)yesOrNo eventCallBackBlock:(NSTimerEventCallBackBlock)callBackBlock
{
    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:ti target:self selector:@selector(timeRuning:) userInfo:[callBackBlock copy] repeats:yesOrNo];
    return timer;
}

+(void)timeRuning:(NSTimer *)time{
    NSTimerEventCallBackBlock block = time.userInfo;
    if (block) {
        block(time);
    }
}

@end
