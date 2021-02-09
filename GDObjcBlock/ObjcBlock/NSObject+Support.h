//
//  NSObject+Support.h
//  GDObjcBlock
//
//  Created by apple on 2019/7/16.
//  Copyright © 2019 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT  void gd_exchangeIMPFromOldSelector(Class cls,SEL oldSEL,SEL newSEL);

@interface NSObject (Support)

#pragma --mark 安全方法调用
-(id)safetyPerformSelector:(SEL)selector;

-(id)safetyPerformSelector:(SEL)selector withObject:(NSObject *)objc;

-(id)safetyPerformSelector:(SEL)selector withObject:(NSObject *)objc withObject:objc2;

-(id)safetyPerformSelector:(SEL)selector
                  parameters:(nullable NSObject *)parameter, ... NS_REQUIRES_NIL_TERMINATION;

-(id)safetyPerformSelector:(SEL)selector
            parameterArray:(nullable NSArray<NSObject *> *)parameterArr;


#pragma --mark 对象转json

-(NSString *)jsonString:(NSError *__autoreleasing  _Nullable *)error;
@end

NS_ASSUME_NONNULL_END
