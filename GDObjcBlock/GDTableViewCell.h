//
//  GDTableViewCell.h
//  GDObjcBlock
//
//  Created by apple on 2019/7/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDExpandImageView.h"

NS_ASSUME_NONNULL_BEGIN

@interface GDTableViewCell : UITableViewCell

@property(nonatomic,strong)GDExpandImageView * imageO;
@property(nonatomic,strong)GDExpandImageView * imageT;

-(void)setImage:(UIImage *)imageO content:(NSString *)content imageT:(UIImage *)imageT;

-(void)uploadImageView;
@end

NS_ASSUME_NONNULL_END
