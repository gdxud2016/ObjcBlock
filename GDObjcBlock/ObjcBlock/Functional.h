//
//  Functional.h
//  JeeAnExpert
//
//  Created by apple on 2020/8/26.
//  Copyright © 2020 ming zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Functional)

-(instancetype)removeSuffixString:(NSString *)suffixStr;

@end

@interface NSArray (Functional)

/// 遍历数组
/// @param block 便利操作block
- (void)traversal:(void (^)(NSInteger idx, id objc))block;


/// 替换数组元素
/// @param block element就是遍历的数组元素，返回值为替换的新元素
- (instancetype)map:(id (^)(NSInteger idx, id objc))block;

/// 过滤数组元素
/// @param block element就是遍历的数组元素，返回值为NO时，元素会被过滤掉
- (instancetype)filter:(BOOL (^)(NSInteger idx, id objc))block;


///对象result 和 数组每个元素都执行一次block操作
/// @param result 待操作对象
/// @param block result 和数组每个元素执行block操作，返回值就是result 和objc交互后的结果，下一次循环result字段重新传入
- (id)reduce:(id)result operate:(id (^)(id result,NSInteger idx, id objc))block;

@end

@interface NSDictionary (Functional)

/// 遍历字典
/// @param block 便利操作block
- (void)traversal:(void (^)(id key, id objc))block;

/// 替换字典元素
/// @param block element就是遍历的字典元素，返回值为替换的新元素
- (instancetype)map:(id (^)(id key, id objc))block;

/// 过滤字典元素
/// @param block element就是遍历的字典元素，返回值为NO，元素会过滤掉
- (instancetype)filter:(BOOL (^)(id key, id objc))block;

///对象result 和 字典每个元素都执行一次block操作
/// @param result 待操作对象
/// @param block result 和字典每个元素执行block操作
- (id)reduce:(id)result operate:(id (^)(id result,id key,id objc))block;

@end

@interface NSMutableDictionary (Functional)

/// 字典连续赋值
@property (nonatomic,copy,readonly)NSMutableDictionary *(^chainSet)(id key,id objc);

@end

