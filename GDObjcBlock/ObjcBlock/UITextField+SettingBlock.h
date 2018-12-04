//
//  UITextField+SettingBlock.h
//  JeeAnExpert
//
//  Created by apple on 2018/11/5.
//  Copyright © 2018 ming zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (SettingBlock)

+(instancetype)gd_textField:(void(^)(UITextField * textfield))block;

-(UITextField *(^)(NSString * text))gd_text;

-(UITextField *(^)(NSAttributedString * attributedText))gd_attributedText;

-(UITextField *(^)(UIColor * color))gd_textColor;

-(UITextField *(^)(UIFont * font))gd_font;

-(UITextField *(^)(NSTextAlignment textAlignment))gd_textAlignment;

-(UITextField *(^)(UITextBorderStyle style))gd_borderStyle;

-(UITextField *(^)(NSString * text))gd_placeholder;

-(UITextField *(^)(NSAttributedString * attributedText))gd_attributedPlaceholder;

-(UITextField *(^)(id<UITextFieldDelegate> delegete))gd_delegate;

#pragma --mark ================================父类重命名方法===============================
-(UITextField *(^)(CGRect frame))gd_frame;

-(UITextField *(^)(UIColor * color))gd_backgroundColor;

-(UITextField *(^)(UIColor * borderColor))gd_borderColor;

-(UITextField *(^)(NSInteger borderWidth))gd_borderWidth;

-(UITextField *(^)(NSInteger cornerRadius))gd_cornerRadius;

-(UITextField *(^)(BOOL hidden))gd_hidden;

-(UITextField *(^)(UIView * superView))gd_addToSuperView;


@end

NS_ASSUME_NONNULL_END
