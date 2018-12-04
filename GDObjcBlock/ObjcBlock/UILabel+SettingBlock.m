//
//  UILabel+SettingBlock.m
//  JeeAnExpert
//
//  Created by apple on 2018/11/5.
//  Copyright © 2018 ming zhang. All rights reserved.
//

#import "UILabel+SettingBlock.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wincomplete-implementation"

@implementation UILabel (SettingBlock)


+(instancetype)gd_label:(void(^)(UILabel * label))block
{
    UILabel * label = [[UILabel alloc] init];
    block(label);
    return label;
}

-(UILabel *(^)(NSString * text))gd_text
{
    return ^(NSString * text){
        self.text = text;
        return self;
    };
}

-(UILabel *(^)(UIFont * font))gd_font
{
    return ^(UIFont * font){
        self.font = font;
        return self;
    };
}

-(UILabel *(^)(UIColor * textColor))gd_textColor
{
    return ^(UIColor * textColor){
        self.textColor = textColor;
        return self;
    };
}

-(UILabel *(^)(NSTextAlignment textAlignment))gd_textAlignment
{
    return ^(NSTextAlignment textAlignment){
        self.textAlignment = textAlignment;
        return self;
    };
}

-(UILabel *(^)(NSAttributedString * attributedText))gd_attributedText
{
    return ^(NSAttributedString * attributedText){
        self.attributedText = attributedText;
        return self;
    };
}

-(UILabel *(^)(BOOL userInteractionEnabled))gd_userInteractionEnabled
{
    return ^(BOOL userInteractionEnabled){
        self.userInteractionEnabled = userInteractionEnabled;
        return self;
    };
}

-(UILabel *(^)(NSInteger numberOfLines))gd_numberOfLines
{
    return ^(NSInteger numberOfLines){
        self.numberOfLines = numberOfLines;
        return self;
    };
}



@end
