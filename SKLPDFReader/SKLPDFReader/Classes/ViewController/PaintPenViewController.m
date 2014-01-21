//
//  PaintPenViewController.m
//  SKLPDFReader
//
//  Created by timkao on 14/1/21.
//  Copyright (c) 2014年 SKL. All rights reserved.
//

#import "PaintPenViewController.h"



@interface PaintPenViewController ()


@end

@implementation PaintPenViewController
@synthesize delegate,popover;

-(id)init
{
    self = [self initWithNibName:@"PaintPen" bundle:Nil];
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor blackColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)StraightButton:(UIButton *)sender {
    if(delegate && [delegate respondsToSelector:@selector(tappedStraightButton:)])
    {
        NSLog(@"enter in Straight Mode");
        [delegate tappedStraightButton:sender];
        NSLog(@"Finished Straight Paint");
        [popover dismissPopoverAnimated:YES];
    }
}
- (IBAction)Curve:(UIButton *)sender {
    if (delegate && [delegate respondsToSelector:@selector(tappedCurveButton:)]) {
        NSLog(@"enter in Curve Mode");
        [delegate tappedCurveButton:sender];
        NSLog(@"Finished Curve Paint");
        [popover dismissPopoverAnimated:YES];
    }
}


@end
