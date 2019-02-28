//
//  UITextField+SettingBlock.m
//  JeeAnExpert
//
//  Created by apple on 2018/11/5.
//  Copyright © 2018 ming zhang. All rights reserved.
//

#import "UITextField+SettingBlock.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wincomplete-implementation"

@implementation UITextField (SettingBlock)

+(instancetype)gd_textField:(void(^)(UITextField * textfield))block
{
    UITextField * tf = [[[self class] alloc] init];
    if (block) {
        block(tf);
    }
    return tf;
}

-(UITextField *(^)(NSString * text))gd_text
{
    return ^(NSString * text){
        self.text = text;
        return self;
    };
}

-(UITextField *(^)(NSAttributedString * attributedText))gd_attributedText
{
    return ^(NSAttributedString * attributedText){
        self.attributedText = attributedText;
        return self;
    };
}

-(UITextField *(^)(UIColor * color))gd_textColor
{
    return ^(UIColor * color){
        self.textColor = color;
        return self;
    };
}

-(UITextField *(^)(UIFont * font))gd_font
{
    return ^(UIFont * font){
        self.font = font;
        return self;
    };
}

-(UITextField *(^)(NSTextAlignment textAlignment))gd_textAlignment
{
    return ^(NSTextAlignment textAlignment){
        self.textAlignment = textAlignment;
        return self;
    };
}

-(UITextField *(^)(UITextBorderStyle style))gd_borderStyle
{
    return ^(UITextBorderStyle style){
        self.borderStyle = style;
        return self;
    };
}


-(UITextField *(^)(NSString * text))gd_placeholder
{
    return ^(NSString * text){
        self.placeholder = text;
        return self;
    };
}

-(UITextField *(^)(NSAttributedString * attributedText))gd_attributedPlaceholder
{
    return ^(NSAttributedString * attributedText){
        self.attributedText = attributedText;
        return self;
    };
}

-(UITextField *(^)(id<UITextFieldDelegate> delegete))gd_delegate
{
    return ^(id<UITextFieldDelegate> delegete){
        self.delegate = delegete;
        return self;
    };
}
@end
