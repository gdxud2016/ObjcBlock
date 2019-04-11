//
//  UIImageView+SettingBlock.h
//  JeeAnExpert
//
//  Created by apple on 2018/11/5.
//  Copyright © 2018 ming zhang. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIImageView (SettingBlock)

+(instancetype)gd_imageView:(void(^)(UIImageView * imageView))block;

-(UIImageView *(^)(UIImage * image))gd_image;

-(UIImageView *(^)(BOOL userInteractionEnabled))gd_userInteractionEnabled;

#pragma --mark ================================父类重命名方法===============================

-(UIImageView *(^)(CGRect frame))gd_frame;

-(UIImageView *(^)(UIColor * color))gd_backgroundColor;

-(UIImageView *(^)(UIColor * borderColor))gd_borderColor;

-(UIImageView *(^)(NSInteger borderWidth))gd_borderWidth;

-(UIImageView *(^)(NSInteger cornerRadius))gd_cornerRadius;

-(UIImageView *(^)(BOOL hidden))gd_hidden;

-(UIImageView *(^)(UIView * superView))gd_addToSuperView;
/**
 设置label 点击事件
 target:label的事件监听者
 selecter:点击方法
 */
-(UIImageView *(^)(id target,SEL selecter))gd_addTapgesture;
@end


