//
//  NSObject+Support.m
//  GDObjcBlock
//
//  Created by apple on 2019/7/16.
//  Copyright © 2019 apple. All rights reserved.
//

#import "NSObject+Support.h"
#import <objc/message.h>
#import "XDInvocation.h"

void gd_exchangeIMPFromOldSelector(Class cls, SEL oldSEL, SEL newSEL)
{
    Method oldMethod = class_getInstanceMethod(cls, oldSEL);
    Method newMethod = class_getInstanceMethod(cls, newSEL);
    if (class_addMethod(cls, oldSEL, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))) {
        class_replaceMethod(cls, newSEL, method_getImplementation(oldMethod), method_getTypeEncoding(oldMethod));
    } else {
        method_exchangeImplementations(oldMethod, newMethod);
    }
}

void gd_exchangeClassIMPFromOldSelector(Class cls, SEL oldSEL, SEL newSEL)
{
    Method oldMethod = class_getClassMethod(cls, oldSEL);
    Method newMethod = class_getClassMethod(cls, newSEL);
    Class meteClass = objc_getMetaClass(NSStringFromClass([cls class]).UTF8String);
    if (class_addMethod(meteClass, oldSEL, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))) {
        class_replaceMethod(meteClass, newSEL, method_getImplementation(oldMethod), method_getTypeEncoding(oldMethod));
    } else {
        method_exchangeImplementations(oldMethod, newMethod);
    }
}

@implementation NSObject (Support)

- (id)safetyPerformSelector:(SEL)selector
                 parameters:(nullable NSObject *)parameter, ...
{
    if (![self respondsToSelector:selector]) return nil;

    va_list args;
    va_start(args, parameter);

    NSUInteger count = 0;
    for (id currentObject = parameter; currentObject != nil; currentObject = va_arg(args, id)) {
        ++count;
    }
    va_end(args);

    NSMutableArray *objects = [[NSMutableArray alloc] initWithCapacity:count];

    va_start(args, parameter);
    for (id currentObject = parameter; currentObject != nil; currentObject = va_arg(args, id)) {
        [objects addObject:currentObject];
    }
    va_end(args);
    return [self safetyPerformSelector:selector parameterArray:objects];
}

- (id)safetyPerformSelector:(SEL)selector
             parameterArray:(nullable NSArray<NSObject *> *)parameterArr
{
    XDInvocation *invocation = [[XDInvocation alloc] initWithSelector:selector parameterArray:parameterArr];
    [invocation invokeWithTarget:self];
    return invocation.returnValue;
}

- (id)safetyPerformSelector:(SEL)selector {
    return [self safetyPerformSelector:selector parameterArray:nil];
}

- (id)safetyPerformSelector:(SEL)selector withObject:(NSObject *)objc {
    return [self safetyPerformSelector:selector parameterArray:@[objc]];
}

- (id)safetyPerformSelector:(SEL)selector withObject:(NSObject *)objc withObject:objc2
{
    return [self safetyPerformSelector:selector parameterArray:@[objc, objc2]];
}

- (NSString *)jsonString:(NSError *__autoreleasing _Nullable *)error {
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    jsonString = [jsonString stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@" \n"]];
    return jsonString ? : @"";
}

@end
