//
//  UILabel+SettingBlock.h
//  JeeAnExpert
//
//  Created by apple on 2018/11/5.
//  Copyright © 2018 ming zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (SettingBlock)


+(instancetype)gd_label:(void(^)(UILabel * label))block;

-(UILabel *(^)(NSString * text))gd_text;

-(UILabel *(^)(UIFont * font))gd_font;

-(UILabel *(^)(UIColor * textColor))gd_textColor;

-(UILabel *(^)(NSTextAlignment textAlignment))gd_textAlignment;

-(UILabel *(^)(NSAttributedString * attributedText))gd_attributedText;

-(UILabel *(^)(BOOL userInteractionEnabled))gd_userInteractionEnabled;

-(UILabel *(^)(NSInteger numberOfLines))gd_numberOfLines;

#pragma --mark ================================父类重命名方法===============================
-(UILabel *(^)(CGRect frame))gd_frame;

-(UILabel *(^)(UIColor * color))gd_backgroundColor;

-(UILabel *(^)(UIColor * borderColor))gd_borderColor;

-(UILabel *(^)(NSInteger borderWidth))gd_borderWidth;

-(UILabel *(^)(NSInteger cornerRadius))gd_cornerRadius;

-(UILabel *(^)(BOOL hidden))gd_hidden;

-(UILabel *(^)(UIView * superView))gd_addToSuperView;
/**
 设置label 点击事件
 target:label的事件监听者
 selecter:点击方法
 */
-(UILabel *(^)(id target,SEL selecter))gd_addTapgesture;

@end


