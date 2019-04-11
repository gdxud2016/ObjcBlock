//
//  UIButton+SettingBlock.m
//  JeeAnExpert
//
//  Created by apple on 2018/11/5.
//  Copyright © 2018 ming zhang. All rights reserved.
//

#import "UIButton+SettingBlock.h"
#import <objc/runtime.h>

typedef void(^TouchEventCallBackBlock)(UIView * touchView);

@interface UIButton ()

@property(nonatomic,copy)TouchEventCallBackBlock eventBlock;

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
    NSAssert(nil, @"UIButton此方法不可用");
    return nil;
}

-(void)gd_addObserverWithEventCallBackBlock:(TouchEventCallBackBlock)callBackBlock{
    if (callBackBlock) {
        self.eventBlock = callBackBlock;
    }
    [self addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)buttonDidClick:(UIButton *)sender
{
    if (self.eventBlock) {
        self.eventBlock(self);
    }
}

-(void)setEventBlock:(TouchEventCallBackBlock)eventBlock
{
    objc_setAssociatedObject(self, "buttenEventBlock", eventBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(TouchEventCallBackBlock)eventBlock
{
    return objc_getAssociatedObject(self, "buttenEventBlock");
}

@end
