//
//  RoundImageView.m
//  GDObjcBlock
//
//  Created by apple on 2019/7/16.
//  Copyright © 2019 apple. All rights reserved.
//

#import "GDExpandImageView.h"

@interface GDExpandImageView ()
#pragma --mark rounding
//
@property(nonatomic,assign)BOOL  isRounding;
//
@property(nonatomic,assign)CGRect lastFrame;
//
@property(nonatomic,assign)CGFloat radius;
@property(nonatomic,assign)UIRectCorner rectCornerType;
//
@property(nonatomic,assign)CGFloat boardWidth;
@property(nonatomic,strong)UIColor * boardColor;
@property(nonatomic,strong)UIImage * originImage;


@end

@implementation GDExpandImageView

#pragma --mark >>> life cycle <<<
-(instancetype)init{
    return self;
//    return [self initWithCornerRadius:0 rectCornerType:UIRectCornerAllCorners];
}

-(instancetype)initWithRoundingRectImageView
{
    return [self initWithCornerRadius:0 rectCornerType:UIRectCornerAllCorners isRounding:YES];;
}

- (instancetype)initWithCornerRadius:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType {
    return [self initWithCornerRadius:cornerRadius rectCornerType:rectCornerType isRounding:NO];
}

- (instancetype)initWithCornerRadius:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType isRounding:(BOOL)rounding{
    if (self = [super init]) {
        self.isRounding = rounding;
        self.radius = cornerRadius;
        self.rectCornerType = rectCornerType;
    }
    return self;
}

#pragma --mark >>> public method <<<
-(void)setBoardColor:(UIColor *)boardColor boardWidth:(CGFloat)boardWidth
{
    self.boardColor = boardColor;
    self.boardWidth = boardWidth;
}

- (void)showRoundingImageView{
    self.isRounding = YES;
    self.rectCornerType = UIRectCornerAllCorners;
}

-(void)showSmoothImageViewWithRadius:(CGFloat)radius{
    [self showSmoothImageViewWithRadius:radius rectCornerType:UIRectCornerAllCorners];
}

-(void)showSmoothImageViewWithRadius:(CGFloat)radius rectCornerType:(UIRectCorner)rectCornerType{
    self.radius = radius;
    self.rectCornerType = rectCornerType;
}



#pragma --mark >>> private method <<<
- (void)gd_cornerRadiusWithImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType
{
    if (CGSizeEqualToSize(self.lastFrame.size, CGSizeZero) || !image) return;
    CGFloat scale = [UIScreen mainScreen].scale;
    CGSize size = self.bounds.size;
    UIGraphicsBeginImageContextWithOptions(size,NO, scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (!context) return;
    
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:self.rectCornerType
                                                      cornerRadii:CGSizeMake(self.radius,self.radius)];
    [path addClip];
    [image drawInRect:self.bounds];
    [self drawBorder:path];
    [super setImage:UIGraphicsGetImageFromCurrentImageContext()];
    UIGraphicsEndImageContext();
    self.originImage = nil;
}

-(void)drawBorder:(UIBezierPath *)path
{
    if (self.boardWidth > 0 && self.boardColor) {
        [path setLineWidth:self.boardWidth];
        [self.boardColor setStroke];
        [path stroke];
    }
}

-(void)setImage:(UIImage *)image
{
    self.originImage = image;
    [self gd_cornerRadiusWithImage:self.originImage cornerRadius:self.radius rectCornerType:self.rectCornerType];
}

#pragma --mark over System Method
-(void)layoutSubviews
{
    [super layoutSubviews];
    if (CGSizeEqualToSize(self.bounds.size, self.lastFrame.size)) return;
    self.lastFrame = self.frame;
    self.radius = self.isRounding ? self.frame.size.width / 2 : self.radius;
    [self gd_cornerRadiusWithImage:self.originImage cornerRadius:self.radius rectCornerType:self.rectCornerType];
}

-(void)dealloc{
    self.originImage = nil;
}

@end
