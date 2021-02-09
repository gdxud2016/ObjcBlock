//
//  XDInvocation.m
//  JeeAnExpert
//
//  Created by apple on 2020/7/8.
//  Copyright © 2020 ming zhang. All rights reserved.
//

#import "XDInvocation.h"

@implementation XDInvocation

+ (instancetype)invocationWithSelector:(SEL)selector
{
    return [[self alloc] initWithSelector:selector parameterArray:nil];
}

+ (instancetype)invocationWithSelector:(SEL)selector parameters:(nullable NSObject *)parameter, ...
{
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
    return [[self alloc] initWithSelector:selector parameterArray:objects];
}

- (instancetype)initWithSelector:(SEL)selector {
    return [self initWithSelector:selector parameterArray:nil];
}

- (instancetype)initWithSelector:(SEL)selector
                      parameters:(NSObject *)parameter, ...
{
    if (self = [super init]) {
        _selector = selector;

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
        _parameters = [objects copy];
        va_end(args);
    }
    return self;
}

- (instancetype)initWithSelector:(SEL)selector
                  parameterArray:(NSArray<NSObject *> *)parameterArr
{
    if (self = [super init]) {
        _selector = selector;
        _parameters = parameterArr ? [parameterArr copy] : @[];
    }
    return self;
}

- (void)invoke {
    [self invokeWithTarget:self.target];
}

- (void)invokeWithTarget:(NSObject *)target {
    if (!target || !self.selector) return;
    if (![target respondsToSelector:self.selector]) {
        NSString *error = [NSString stringWithFormat:@"%@ can't response SEL:%@", [target class], NSStringFromSelector(self.selector)];
        NSAssert(NO, error);
        return;
    }
    _returnValue = nil;

    NSMethodSignature *signature = [target methodSignatureForSelector:self.selector];
    if (!signature) return;
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.selector = self.selector;
    NSInteger num = signature.numberOfArguments;
    for (NSInteger i = 2; i < num; i++) {
        NSObject *ob = i < self.parameters.count + 2 ? self.parameters[i - 2] : nil;
        [invocation setArgument:&ob atIndex:i];
    }
    @try {
        [invocation invokeWithTarget:target];
        NSString *retureType = [NSString stringWithUTF8String:[invocation.methodSignature methodReturnType]];
        if ([retureType isEqualToString:@"@"]) {
            __autoreleasing id objc = nil;
            [invocation getReturnValue:&objc];
            if (![objc isKindOfClass:[NSNull class]]) {
                _returnValue = [objc respondsToSelector:@selector(copy)] ? [objc copy] : objc;
            }
            _returnValue = ![objc isKindOfClass:[NSNull class]] ? objc : nil;
        }
    } @catch (NSException *exception) {
        _returnValue = nil;
        NSAssert(NO, exception.description);
        NSLog(@"%@", exception.description);
    } @finally {
    }
}

- (void)setParameters:(nullable NSArray<NSObject *> *)parameters {
    _parameters = nil;
    _parameters = [parameters copy];
}

@end
