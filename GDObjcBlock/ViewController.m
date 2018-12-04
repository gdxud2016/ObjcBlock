//
//  ViewController.m
//  GDObjcBlock
//
//  Created by apple on 2018/11/10.
//  Copyright © 2018 apple. All rights reserved.
//

#import "ViewController.h"
#import "GDBlockHeader.h"

@interface ViewController ()
@property(nonatomic,strong)UIView * myView;
@property(nonatomic,strong)UIButton * btn;
@property(nonatomic,strong)UILabel * label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.label =  [UILabel gd_label:^(UILabel * _Nonnull label) {
        label.gd_frame(CGRectMake(0, 100, 200,40 )).gd_backgroundColor([UIColor redColor]).gd_font([UIFont systemFontOfSize:14]);
        label.gd_textColor([UIColor blackColor]).gd_text(@"中文还可以吗").gd_borderWidth(2).gd_borderColor([UIColor greenColor]);
        label.gd_addTapgesture(self,@selector(printfLogTwo:)).gd_addToSuperView(self.view);
    }];
    
    
    self.btn = [UIButton gd_button:^(UIButton * _Nonnull button) {
        button.gd_frame(CGRectMake(0, 150, 200,40 )).gd_backgroundColor([UIColor blueColor]).gd_font([UIFont systemFontOfSize:14]);
        button.gd_borderWidth(2).gd_borderColor([UIColor greenColor]).gd_title(@"btn",UIControlStateNormal).gd_addToSuperView(self.view);
        button.gd_addTapgesture(self,@selector(printfLog:)).gd_addToSuperView(self.view);
    }];
    
    self.myView =[UIView gd_view:^(UIView *view) {
        view.gd_frame(CGRectMake(0, 200, 200,40 )).gd_backgroundColor([UIColor orangeColor]);
        view.gd_borderWidth(2).gd_borderColor([UIColor greenColor]);
        view.gd_addTapgesture(self,@selector(printfLogTwo:)).gd_addToSuperView(self.view);
    }];
}

-(void)printfLog:(UIButton *)sender
{
    NSLog(@"%@",[sender class]);
}

-(void)printfLogTwo:(UITapGestureRecognizer *)sender
{
    NSLog(@"%@",[sender.view class]);
}

@end
