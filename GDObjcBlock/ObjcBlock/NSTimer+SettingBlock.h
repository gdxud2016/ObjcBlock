//
//  NSTimer+SettingBlock.h
//  GDObjcBlock
//
//  Created by apple on 2019/4/10.
//  Copyright © 2019 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^NSTimerEventCallBackBlock)(NSTimer * timer);


@interface NSTimer (SettingBlock)

+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti repeats:(BOOL)yesOrNo eventCallBackBlock:(NSTimerEventCallBackBlock)callBackBlock;

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti repeats:(BOOL)yesOrNo eventCallBackBlock:(NSTimerEventCallBackBlock)callBackBlock;

@end

