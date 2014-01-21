//
//  NotifyViewController.m
//  SKLPDFReader
//
//  Created by timkao on 14/1/17.
//  Copyright (c) 2014年 SKL. All rights reserved.
//

#import "NotifyViewController.h"

@interface NotifyViewController ()
{
    NSString *content;
}
@end

@implementation NotifyViewController
@synthesize notifyLabel;

-(id)initWithNotifyContent:(NSString *)Content WithView:(UIView *)View
{
    self = [super initWithNibName:@"Notify" bundle:Nil];
    if (self) {
        
        content = Content;
        // 設定frame的大小（橫/豎 時畫面大小不同)
       
        CGFloat width = self.view.frame.size.width;
        CGFloat height = self.view.frame.size.height;
        
        self.view.frame = CGRectMake(View.center.x-(width/2),View.center.y-(height/2), width, height);
        
        //將notify長到指定的view
        [View addSubview: self.view];
        
    }
    return self;
}

- (void)viewDidLoad
{
    //[super viewDidLoad];
    notifyLabel.text = content;
    self.view.backgroundColor = [UIColor clearColor];//將背景設定成空白
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)start
{
    //加入動畫
    [UIView animateWithDuration:3.0 delay:0.0 options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         notifyLabel.alpha = 1.0f;
                         notifyLabel.alpha = 0.0f;
                     } completion:^(BOOL finished) {
                         //完成後的設定
                         [self.view removeFromSuperview];
                     }
     ];
}

@end
