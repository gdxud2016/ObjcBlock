//
//  RoundImageView.h
//  GDObjcBlock
//
//  Created by apple on 2019/7/16.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GDExpandImageView : UIImageView

#pragma --mark RoundingImage
//初始化一个圆形图片
-(instancetype)initWithRoundingRectImageView;
//初始化一个rectCornerType类型的圆角图片
- (instancetype)initWithCornerRadius:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType;
//设置边框宽度和颜色
-(void)setBoardColor:(UIColor *)boardColor boardWidth:(CGFloat)boardWidth;
//设置显示为圆形图片
- (void)showRoundingImageView;
//设置显示为圆角图片
-(void)showSmoothImageViewWithRadius:(CGFloat)radius;
//设置显示为圆角图片并且圆角切割方式
-(void)showSmoothImageViewWithRadius:(CGFloat)radius rectCornerType:(UIRectCorner)rectCornerType;

@end

NS_ASSUME_NONNULL_END
