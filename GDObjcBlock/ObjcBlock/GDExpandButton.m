//
//  GDExpandButton.m
//  JeeAnExpert
//
//  Created by apple on 2020/8/11.
//  Copyright © 2020 ming zhang. All rights reserved.
//

#import "GDExpandButton.h"
#define BUTTON_DEFAULT_RESPONSE_SIZE 44

@implementation GDExpandButton{
    BOOL _isDefaultAreaSize;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    if (CGRectEqualToRect(self.gd_titleRect, CGRectZero)) {
        return [super titleRectForContentRect:contentRect];
    } else {
        CGFloat x = contentRect.origin.x + self.gd_titleRect.origin.x;
        CGFloat y = contentRect.origin.y + self.gd_titleRect.origin.y;
        return CGRectMake(x, y, self.gd_titleRect.size.width, self.gd_titleRect.size.height);
    }
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    if (CGRectEqualToRect(self.gd_imageRect, CGRectZero)) {
        return [super imageRectForContentRect:contentRect];
    } else {
        CGFloat x = contentRect.origin.x + self.gd_imageRect.origin.x;
        CGFloat y = contentRect.origin.y + self.gd_imageRect.origin.y;
        return CGRectMake(x, y, self.gd_imageRect.size.width, self.gd_imageRect.size.height);
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if (UIEdgeInsetsEqualToEdgeInsets(self.responseAreaOutset, UIEdgeInsetsZero)) {
        return [super pointInside:point withEvent:event];
    } else {
        CGFloat x = CGRectGetMinX(self.frame) - self.responseAreaOutset.left;
        CGFloat y = CGRectGetMinY(self.frame) - self.responseAreaOutset.top;
        CGFloat width = CGRectGetWidth(self.frame) + self.responseAreaOutset.left + self.responseAreaOutset.right;
        CGFloat height = CGRectGetHeight(self.frame) + self.responseAreaOutset.top + self.responseAreaOutset.bottom;
        CGRect rect = CGRectMake(x, y, width, height);
        return CGRectContainsPoint(rect, point);
    }
}

-(void)expandResponseAreaToDefaultSize{
    _isDefaultAreaSize = YES;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    if (_isDefaultAreaSize) {
        CGFloat W = CGRectGetWidth(self.frame);
        CGFloat H = CGRectGetHeight(self.frame);
        CGFloat expandW = W < BUTTON_DEFAULT_RESPONSE_SIZE ? (BUTTON_DEFAULT_RESPONSE_SIZE - W )/2 : 0;
        CGFloat expandH = H < BUTTON_DEFAULT_RESPONSE_SIZE ? (BUTTON_DEFAULT_RESPONSE_SIZE - H )/2 : 0;
        self.responseAreaOutset = UIEdgeInsetsMake(expandH , expandW, expandH, expandW);
    }
}
@end
