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

@property(nonatomic,copy)TouchEventCallBackBlock eventBlock;

@end

@implementation UIView (SettingBlock)

+(instancetype)gd_view:(void(^)(UIView * view))block
{
    UIView * view = [[[self class] alloc] init];
    if (block) {
        block(view);
    }
    return view;
}
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wmismatched-return-types"

-(instancetype(^)(CGRect))gd_frame
{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}

-(instancetype(^)(UIColor * color))gd_backgroundColor
{
    return ^(UIColor * color){
        self.backgroundColor = color;
        return self;
    };
}

-(instancetype(^)(UIColor * borderColor))gd_borderColor
{
    return ^(UIColor * borderColor){
        self.layer.borderColor = borderColor.CGColor;
        return self;
    };
}

-(instancetype(^)(NSInteger boardWidth))gd_borderWidth
{
    return ^(NSInteger borderWidth){
        self.layer.borderWidth = borderWidth;
        return self;
    };
}

-(instancetype(^)(NSInteger cornerRadius))gd_cornerRadius
{
    return ^(NSInteger cornerRadius){
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = cornerRadius;
        return self;
    };
}

-(instancetype(^)(BOOL hidden))gd_hidden
{
    return ^(BOOL hidden){
        self.hidden = hidden;
        return self;
    };
}

-(instancetype(^)(id target,SEL selecter))gd_addTapgesture
{
    return ^(id target,SEL selecter){
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer * tapges = [[UITapGestureRecognizer alloc] initWithTarget:target action:selecter];
        [self addGestureRecognizer:tapges];
        return self;
    };
}

-(instancetype(^)(UIView * superView))gd_addToSuperView
{
    return ^(UIView * superView){
        [superView addSubview:self];
        return self;
    };
}

-(void)gd_addObserverWithEventCallBackBlock:(TouchEventCallBackBlock)callBackBlock{
    if (callBackBlock) {
        self.eventBlock = callBackBlock;
    }
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer * gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView:)];
    [self addGestureRecognizer:gesture];
}


-(void)tapView:(UITapGestureRecognizer *)gesture
{
    if (self.eventBlock) {
        self.eventBlock(self);
    }
}


#pragma clang diagnostic pop


#pragma --mark setter and getter
-(void)setEventBlock:(TouchEventCallBackBlock)eventBlock
{
    objc_setAssociatedObject(self, "viewEventBlock", eventBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(TouchEventCallBackBlock)eventBlock
{
    return objc_getAssociatedObject(self, "viewEventBlock");
}

@end
