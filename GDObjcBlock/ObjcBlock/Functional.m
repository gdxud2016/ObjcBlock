//
//  Functional.m
//  JeeAnExpert
//
//  Created by apple on 2020/8/26.
//  Copyright © 2020 ming zhang. All rights reserved.
//

#import "Functional.h"

@implementation NSString (Functional)

- (instancetype)removeSuffixString:(NSString *)suffixStr {
    if (![self hasSuffix:suffixStr]) return self;
    NSInteger suffixL = suffixStr.length;
    return [self substringToIndex:(self.length - suffixL)];
}

@end

#pragma--mark NSArray
@implementation NSArray (Functional)

/// 遍历数组
- (void)traversal:(void (^)(NSInteger idx, id objc))block {
    NSInteger idx = 0;
    for (id objc in self) {
        block((idx++), objc);
    }
}

/// 替换数组元素
- (instancetype)map:(id (^)(NSInteger idx, id objc))block {
    NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:self.count];
    NSInteger idx = 0;
    for (id objc in self) {
        id result = block((idx++), objc);
        if (result) [arr addObject:result];
    }
    return [self respondsToSelector:@selector(addObject:)] ? arr : [arr copy];
}

/// 过滤数组元素
- (instancetype)filter:(BOOL (^)(NSInteger idx, id objc))block {
    NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:self.count];
    NSInteger idx = 0;
    for (id objc in self) {
        BOOL result = block((idx++), objc);
        if (result) [arr addObject:objc];
    }
    return [self respondsToSelector:@selector(addObject:)] ? arr : [arr copy];
}

///对象result 和 数组每个元素都执行一次block操作
- (id)reduce:(id)result operate:(id (^)(id result, NSInteger idx, id objc))block {
    NSInteger idx = 0;
    id result2 = result;
    for (id objc in self) {
        result2 = block(result2, (idx++), objc);
    }
    return result2;
}

@end

#pragma--mark NSDictionary
@implementation NSDictionary (Functional)

/// 遍历字典
- (void)traversal:(void (^)(id key, id objc))block {
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        block(key, obj);
    }];
}

/// 替换字典元素
- (instancetype)map:(id (^)(id key, id objc))block {
    NSMutableDictionary *dict = [self respondsToSelector:@selector(setObject:forKey:)] ? self : self.mutableCopy;
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        id result = block(key, obj);
        if (result) [dict setObject:result forKey:key];
    }];
    return [self respondsToSelector:@selector(setObject:forKey:)] ? dict : [dict copy];
}

/// 过滤字典元素
- (instancetype)filter:(BOOL (^)(id key, id objc))block {
    NSMutableDictionary *dict = [self respondsToSelector:@selector(setObject:forKey:)] ? self : self.mutableCopy;
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        BOOL result = block(key, obj);
        if (!result) [dict removeObjectForKey:key];
    }];
    return [self respondsToSelector:@selector(setObject:forKey:)] ? dict : [dict copy];
}

///对象result 和 字典每个元素都执行一次block操作
- (id)reduce:(id)result operate:(id (^)(id result, id key, id objc))block {
    __block id result2 = result;
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        result2 = block(result2, key, obj);
    }];
    return result2;
}

@end

@implementation NSMutableDictionary (Functional)

/// 字典连续赋值
-(NSMutableDictionary *(^)(id key,id objc))chainSet{
    return ^(id key,id objc){
        if (objc) [self setObject:objc forKey:key];
        return self;
    };
}

@end

