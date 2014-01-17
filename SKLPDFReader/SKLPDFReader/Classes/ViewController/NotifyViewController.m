//
//  NotifyViewController.m
//  SKLPDFReader
//
//  Created by timkao on 14/1/17.
//  Copyright (c) 2014年 SKL. All rights reserved.
//

#import "NotifyViewController.h"

@interface NotifyViewController ()

@end

@implementation NotifyViewController
@synthesize notifyLabel;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
    //add 動畫
    //加入動畫
    [UIView animateWithDuration:3.0 delay:0.0 options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         notifyLabel.alpha = 1.0f;
                         notifyLabel.alpha = 0.0f;
                     } completion:^(BOOL finished) {
                         [self.view removeFromSuperview];
                     }
     
     ];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
