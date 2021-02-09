//
//  XDInvocation.h
//  JeeAnExpert
//
//  Created by apple on 2020/7/8.
//  Copyright © 2020 ming zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XDInvocation : NSObject

@property(nonatomic,readonly)SEL selector;

@property(nonatomic,strong,readonly)NSArray<NSObject *> *parameters;

@property(nonatomic,strong,readonly)id returnValue;

@property(nonatomic,strong)NSObject * target;

+(instancetype)invocationWithSelector:(SEL)selector;

+(instancetype)invocationWithSelector:(SEL)selector parameters:(nullable NSObject *)parameter, ... NS_REQUIRES_NIL_TERMINATION;

-(instancetype)initWithSelector:(SEL)selector;

-(instancetype)initWithSelector:(SEL)selector parameters:(nullable NSObject *)parameter, ... NS_REQUIRES_NIL_TERMINATION;

-(instancetype)initWithSelector:(SEL)selector parameterArray:(nullable NSArray<NSObject *> *)parameterArr;

-(void)setParameters:(nullable NSArray<NSObject *> *)parameters;

- (void)invoke;

-(void)invokeWithTarget:(NSObject *)target;

@end

NS_ASSUME_NONNULL_END
