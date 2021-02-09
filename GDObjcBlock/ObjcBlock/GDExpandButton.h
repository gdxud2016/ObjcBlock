//
//  GDExpandButton.h
//  JeeAnExpert
//
//  Created by apple on 2020/8/11.
//  Copyright © 2020 ming zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GDExpandButton : UIButton

//图片在button中的frame
@property(nonatomic,assign)CGRect gd_imageRect;

//文字在button中的frame
@property(nonatomic,assign)CGRect gd_titleRect;

#pragma --mark 响应区域
@property(nonatomic,assign)UIEdgeInsets responseAreaOutset;

//default size 44 * 44
-(void)expandResponseAreaToDefaultSize;

@end

NS_ASSUME_NONNULL_END
