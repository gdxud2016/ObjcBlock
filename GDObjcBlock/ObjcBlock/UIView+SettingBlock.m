//
//  UIView+SettingBlock.m
//  JeeAnExpert
//
//  Created by apple on 2018/11/5.
//  Copyright © 2018 ming zhang. All rights reserved.
//

#import "UIView+SettingBlock.h"
#import <objc/runtime.h>

@interface UIView ()

@property (nonatomic, copy) void (^ TouchEventCallbackBlock)(UIView *view);

@end

@implementation UIView (SettingBlock)

+ (instancetype)gd_view:(void (^)(UIView *view))block
{
    UIView *view = [[[self class] alloc] init];
    if (block) {
        block(view);
    }
    return view;
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wmismatched-return-types"

- (instancetype (^)(CGRect))gd_frame
{
    return ^(CGRect frame) {
               self.frame = frame;
               return self;
    };
}

- (instancetype (^)(UIColor *color))gd_backgroundColor
{
    return ^(UIColor *color) {
               self.backgroundColor = color;
               return self;
    };
}

- (instancetype (^)(UIColor *borderColor))gd_borderColor
{
    return ^(UIColor *borderColor) {
               self.layer.borderColor = borderColor.CGColor;
               return self;
    };
}

- (instancetype (^)(NSInteger boardWidth))gd_borderWidth
{
    return ^(NSInteger borderWidth) {
               self.layer.borderWidth = borderWidth;
               return self;
    };
}

- (instancetype (^)(NSInteger cornerRadius))gd_cornerRadius
{
    return ^(NSInteger cornerRadius) {
               self.layer.masksToBounds = YES;
               self.layer.cornerRadius = cornerRadius;
               return self;
    };
}

- (instancetype (^)(BOOL hidden))gd_hidden
{
    return ^(BOOL hidden) {
               self.hidden = hidden;
               return self;
    };
}

- (instancetype (^)(id target, SEL selecter))gd_addTapgesture
{
    return ^(id target, SEL selecter) {
               self.userInteractionEnabled = YES;
               if ([target isKindOfClass:[NSObject class]] && [(NSObject *)target respondsToSelector:selecter]) {
                   UITapGestureRecognizer *tapges = [[UITapGestureRecognizer alloc] initWithTarget:target
                                                                                            action:selecter];
                   [self addGestureRecognizer:tapges];
               }else{
                   NSAssert(NO, @"添加的手势没有响应的方法");
               }
               return self;
    };
}

- (instancetype (^)(UIView *superView))gd_addToSuperView
{
//    __weak typeof (self)weakSelf = self;
    return ^(UIView *superView) {
               [superView addSubview:self];
               return self;
    };
}

- (void)gd_addTouchEventAndCallbackWithBlock:(void (^)(UIView *touchView))callbackBlock {
    self.TouchEventCallbackBlock = callbackBlock;
    UITapGestureRecognizer *tapges = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                             action:@selector(touchViewAction:)];
    [self addGestureRecognizer:tapges];
}

- (void)touchViewAction:(UITapGestureRecognizer *)gesture {
    UIView *view = gesture.view;
    if (self.TouchEventCallbackBlock) {
        self.TouchEventCallbackBlock(view);
    }
}

- (void)setTouchEventCallbackBlock:(void (^)(UIView *))TouchEventCallbackBlock {
    objc_setAssociatedObject(self, @selector(TouchEventCallbackBlock), TouchEventCallbackBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UIView *))TouchEventCallbackBlock {
    return objc_getAssociatedObject(self, @selector(TouchEventCallbackBlock));
}

@end

#pragma clang diagnostic pop
