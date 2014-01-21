//
//  CleanViewController.m
//  SKLPDFReader
//
//  Created by timkao on 14/1/21.
//  Copyright (c) 2014年 SKL. All rights reserved.
//

#import "CleanViewController.h"


@interface CleanViewController ()

@end

@implementation CleanViewController
@synthesize delegate,popover;

-(id)init
{
    self = [self initWithNibName:@"CleanView" bundle:Nil];
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

#pragma -mark -button的控制
- (IBAction)pageCleanButton:(UIButton *)sender {
    if(delegate && [delegate respondsToSelector:@selector(tappedPageCleanButton:)])
    {
        //委派
        NSLog(@"enter in one page clean mode");
         [delegate tappedPageCleanButton:sender];
        NSLog(@"This page is cleaned");
        [popover dismissPopoverAnimated:YES];
    }
}
- (IBAction)allPageCleanButton:(UIButton *)sender {
    if(delegate &&[delegate respondsToSelector:@selector(tappedAllPageCleanButton:)])
    {
        //委派
        NSLog(@"enter in all page clean mode");
        [delegate tappedAllPageCleanButton:sender];
        NSLog(@"All page were cleaned");
        [popover dismissPopoverAnimated:YES];
    }
}




@end
