//
//  UIButton+SettingBlock.h
//  JeeAnExpert
//
//  Created by apple on 2018/11/5.
//  Copyright © 2018 ming zhang. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIButton (SettingBlock)

+(instancetype)gd_button:(void(^)(UIButton * button))block;


/**
 设置button 标题
 title:button的标题
 state:button状态
 */
-(UIButton *(^)(NSString * title,UIControlState state))gd_title;

/**
 设置button 标题颜色
 color:button的标题颜色
 state:button状态
 */
-(UIButton *(^)(UIColor * color,UIControlState state))gd_titleColor;
/**
 设置button 图片
 color:button的图片
 state:button状态
 */

-(UIButton *(^)(UIImage * image,UIControlState state))gd_image;


/**
 设置button 背景图片
 color:button的背景图片
 state:button状态
 */
-(UIButton *(^)(UIImage * image,UIControlState state))gd_backgroundImage;

/**
 设置button 超文本标题
 attributedTitle:button的超文本标题
 state:button状态
 */
-(UIButton *(^)(NSAttributedString * attributedTitle,UIControlState state))gd_attributedTitle;

/**
 设置button 点击事件
 target:button的事件监听者
 state:点击方法
 */
-(UIButton *(^)(id target,SEL selecter))gd_addTarget;

-(UIButton *(^)(UIFont * font))gd_font;
#pragma --mark ================================父类重命名方法===============================

-(UIButton *(^)(CGRect frame))gd_frame;

-(UIButton *(^)(UIColor * color))gd_backgroundColor;

-(UIButton *(^)(UIColor * borderColor))gd_borderColor;

-(UIButton *(^)(NSInteger borderWidth))gd_borderWidth;

-(UIButton *(^)(NSInteger cornerRadius))gd_cornerRadius;

-(UIButton *(^)(BOOL hidden))gd_hidden;

-(UIButton *(^)(UIView * superView))gd_addToSuperView;

/**
 UIButton这个方法不可用
 */
-(UIButton *(^)(id target,SEL selecter))gd_addTapgesture NS_UNAVAILABLE;



@end


