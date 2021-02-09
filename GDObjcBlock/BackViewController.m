//
//  BackViewController.m
//  GDObjcBlock
//
//  Created by apple on 2019/4/10.
//  Copyright © 2019 apple. All rights reserved.
//

#import "BackViewController.h"
#import "GDBlockHeader.h"

@interface BackViewController ()

@property(nonatomic,weak)NSTimer * timer;

@end

@implementation BackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSTimer * timer = [NSTimer timerWithTimeInterval:1.0 repeats:YES eventCallBackBlock:^(NSTimer *timer) {
        NSLog(@"gogogo");
    }];
    self.timer = timer;
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    NSLog(@"Timer_%@",self.timer.class);
}

-(void)dealloc
{
    NSLog(@"viewController___dealloc");
}
@end
