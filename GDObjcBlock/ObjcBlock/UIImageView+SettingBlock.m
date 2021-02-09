//
//  UIImageView+SettingBlock.m
//  JeeAnExpert
//
//  Created by apple on 2018/11/5.
//  Copyright © 2018 ming zhang. All rights reserved.
//

#import "UIImageView+SettingBlock.h"
#import "NSObject+Support.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wincomplete-implementation"

@implementation UIImageView (SettingBlock)

+(instancetype)gd_imageView:(void(^)(UIImageView * imageView))block
{
    UIImageView * imageview = [[[self class] alloc] init];
    if (block) {
        block(imageview);
    }
    return imageview;
}

-(UIImageView *(^)(UIImage * image))gd_image
{
    return ^(UIImage * image){
        self.image = image;
        return self;
    };
}

-(UIImageView *(^)(BOOL userInteractionEnabled))gd_userInteractionEnabled
{
    return ^(BOOL userInteractionEnabled){
        self.userInteractionEnabled = userInteractionEnabled;
        return self;
    };
}

@end

