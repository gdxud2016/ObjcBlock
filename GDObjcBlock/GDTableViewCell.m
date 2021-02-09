//
//  GDTableViewCell.m
//  GDObjcBlock
//
//  Created by apple on 2019/7/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import "GDTableViewCell.h"


#define KW  [UIScreen mainScreen].bounds.size.width

@implementation GDTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _imageO = [[GDExpandImageView alloc] initWithCornerRadius:15 rectCornerType:UIRectCornerTopLeft | UIRectCornerTopRight];
        _imageO.frame = CGRectMake(16, 10, 50, 50 );
        [_imageO setBoardColor:[UIColor redColor] boardWidth:5];
        [self.contentView addSubview:_imageO];
        
        _imageT = [[GDExpandImageView alloc] initWithCornerRadius:25 rectCornerType:UIRectCornerBottomLeft | UIRectCornerBottomRight];
        _imageT.frame = CGRectMake(KW - 50 - 16, 10, 50, 50);
        [_imageT setBoardColor:[UIColor redColor] boardWidth:5];
        [self.contentView addSubview:_imageT];
    }
    return self;
}

-(void)setImage:(UIImage *)imageO content:(NSString *)content imageT:(UIImage *)imageT
{
    _imageO.image = imageO;
    _imageT.image = imageT;
}

-(void)uploadImageView{
    CGFloat w = self.imageO.frame.size.width * 1.2;
    CGFloat h = self.imageO.frame.size.height * 1.2;
    self.imageO.frame = CGRectMake(16, 10, w, h);
}
@end
