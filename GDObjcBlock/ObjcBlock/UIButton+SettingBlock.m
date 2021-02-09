//
//  UIButton+SettingBlock.m
//  JeeAnExpert
//
//  Created by apple on 2018/11/5.
//  Copyright © 2018 ming zhang. All rights reserved.
//

#import "UIButton+SettingBlock.h"
#import "NSObject+Support.h"
#import <objc/runtime.h>


@interface UIView ()

@property (nonatomic, copy) void (^ ButtonTouchEventCallbackBlock)(UIButton *btn);

@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wincomplete-implementation"

@implementation UIButton (SettingBlock)

+(instancetype)gd_button:(void(^)(UIButton * button))block
{
    UIButton * button = [[[self class] alloc] init];
    if (block) {
        block(button);
    }
    return button;
}

-(UIButton *(^)(NSString * title,UIControlState state))gd_title
{
    return ^(NSString * title,UIControlState state){
        [self setTitle:title forState:state];
        return self;
    };
}

-(UIButton *(^)(UIColor * color,UIControlState state))gd_titleColor
{
    return ^(UIColor * color,UIControlState state){
        [self setTitleColor:color forState:state];
        return self;
    };
}


-(UIButton *(^)(UIImage * image,UIControlState state))gd_image
{
    return ^(UIImage * image,UIControlState state){
        [self setImage:image forState:state];
        return self;
    };
}


-(UIButton *(^)(UIImage * image,UIControlState state))gd_backgroundImage
{
    return ^(UIImage * image,UIControlState state){
        [self setBackgroundImage:image forState:state];
        return self;
    };
}


-(UIButton *(^)(NSAttributedString * attributedTitle,UIControlState state))gd_attributedTitle
{
    return ^(NSAttributedString * attributedTitle,UIControlState state){
        [self setAttributedTitle:attributedTitle forState:state];
        return self;
    };
}

-(UIButton *(^)(id target,SEL selecter))gd_addTarget
{
    return ^(id target,SEL selecter){
        self.userInteractionEnabled = YES;
        if ([target isKindOfClass:[NSObject class]] && [(NSObject *)target respondsToSelector:selecter]) {
            [self addTarget:target action:selecter forControlEvents:UIControlEventTouchUpInside];
        }else{
            NSAssert(NO, @"添加点击事件没有响应的方法");
        }
        [self addTarget:target action:selecter forControlEvents:UIControlEventTouchUpInside];
        return self;
    };
}

-(UIButton *(^)(UIFont * font))gd_font
{
    return ^(UIFont * font){
        self.titleLabel.font = font;
        return self;
    };
}

-(UIButton * (^)(id target, SEL selecter))gd_addTapgesture{
    __weak typeof (self)weakSelf = self;
    return ^(id target,SEL selecter){
        return weakSelf.gd_addTarget(target,selecter);
    };
}

-(void)gd_addTouchEventAndCallbackWithBlock:(void (^)(UIButton *btn))callbackBlock{
    self.ButtonTouchEventCallbackBlock = callbackBlock;
    [self addTarget:self action:@selector(touchViewAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)touchViewAction:(UIButton *)sender {
    if (self.ButtonTouchEventCallbackBlock) {
        self.ButtonTouchEventCallbackBlock(sender);
    }
}

- (void)setButtonTouchEventCallbackBlock:(void (^)(UIButton *))ButtonTouchEventCallbackBlock{
    objc_setAssociatedObject(self, @selector(ButtonTouchEventCallbackBlock), ButtonTouchEventCallbackBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(void (^)(UIButton *))ButtonTouchEventCallbackBlock{
    return objc_getAssociatedObject(self, @selector(ButtonTouchEventCallbackBlock));
}

@end

