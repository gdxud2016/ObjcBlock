//
//  UIView+SettingBlock.h
//  JeeAnExpert
//
//  Created by apple on 2018/11/5.
//  Copyright © 2018 ming zhang. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (SettingBlock)

+(instancetype)gd_view:(void(^)(UIView * view))block;

-(UIView *(^)(CGRect frame))gd_frame;

-(UIView *(^)(UIColor * color))gd_backgroundColor;

-(UIView *(^)(UIColor * borderColor))gd_borderColor;

-(UIView *(^)(NSInteger borderWidth))gd_borderWidth;

-(UIView *(^)(NSInteger cornerRadius))gd_cornerRadius;

-(UIView *(^)(BOOL hidden))gd_hidden;

-(UIView *(^)(UIView * superView))gd_addToSuperView;

-(UIView *(^)(id target,SEL selecter))gd_addTapgesture;

@end


