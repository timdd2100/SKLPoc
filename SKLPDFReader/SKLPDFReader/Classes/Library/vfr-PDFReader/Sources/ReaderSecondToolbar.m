//
//  ReaderSecondToolbar.m
//  SKLPDFReader
//
//  Created by timkao on 14/1/15.
//  Copyright (c) 2014年 SKL. All rights reserved.
//

#define BUTTON_X 8.0f
#define BUTTON_Y 8.0f
#define BUTTON_SPACE 8.0f
#define BUTTON_HEIGHT 30.0f
#define TITLE_HEIGHT 28.0f

#import "ReaderSecondToolbar.h"
#import "ReaderViewController.h"

@implementation ReaderSecondToolbar
{
    Product *mProduct;
}

-(id)initWithFrame:(CGRect)frame Product:(Product *)pro
{
    mProduct = pro;
    return [self initWithFrame:frame];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UIImage *imageH = [UIImage imageNamed:@"Reader-Button-H.png"];
		UIImage *imageN = [UIImage imageNamed:@"Reader-Button-N.png"];
        
		UIImage *buttonH = [imageH stretchableImageWithLeftCapWidth:5 topCapHeight:0];
		UIImage *buttonN = [imageN stretchableImageWithLeftCapWidth:5 topCapHeight:0];

        
        CGFloat viewWidth = self.bounds.size.width;
        
        CGFloat titleX = BUTTON_X; CGFloat titleWidth = (viewWidth - (titleX + titleX));
        
		CGFloat leftButtonX = BUTTON_X; // Left button start X position
        
        UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        //取消
		doneButton.frame = CGRectMake(leftButtonX, BUTTON_Y, DONE_BUTTON_WIDTH, BUTTON_HEIGHT);
		[doneButton setTitle:NSLocalizedString(@"返回", @"button") forState:UIControlStateNormal];
		[doneButton setTitleColor:[UIColor colorWithWhite:0.0f alpha:1.0f] forState:UIControlStateNormal];
		[doneButton setTitleColor:[UIColor colorWithWhite:1.0f alpha:1.0f] forState:UIControlStateHighlighted];
		[doneButton addTarget:self action:@selector(doneButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
		[doneButton setBackgroundImage:buttonH forState:UIControlStateHighlighted];
		[doneButton setBackgroundImage:buttonN forState:UIControlStateNormal];
		doneButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
		doneButton.autoresizingMask = UIViewAutoresizingNone;
        
		[self addSubview:doneButton]; leftButtonX += (DONE_BUTTON_WIDTH + BUTTON_SPACE);
        
		titleX += (DONE_BUTTON_WIDTH + BUTTON_SPACE); titleWidth -= (DONE_BUTTON_WIDTH + BUTTON_SPACE);
        
        //儲存
        CGFloat rightButtonX = viewWidth; // Right button start X position
        
        rightButtonX -= (MARK_BUTTON_WIDTH + BUTTON_SPACE);
        
		UIButton *flagButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
		flagButton.frame = CGRectMake(rightButtonX, BUTTON_Y, MARK_BUTTON_WIDTH, BUTTON_HEIGHT);
		//[flagButton setImage:[UIImage imageNamed:@"Reader-Mark-N.png"] forState:UIControlStateNormal];
		[flagButton addTarget:self action:@selector(markButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
		[flagButton setBackgroundImage:buttonH forState:UIControlStateHighlighted];
		[flagButton setBackgroundImage:buttonN forState:UIControlStateNormal];
		flagButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
        
		[self addSubview:flagButton]; titleWidth -= (MARK_BUTTON_WIDTH + BUTTON_SPACE);
        
		markButton = flagButton; markButton.enabled = NO; markButton.tag = NSIntegerMin;

    }
    return self;
}


-(void)hideToolbar
{
    [UIView animateWithDuration:0.25 delay:0.0
                        options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction
                     animations:^(void)
                    {
                        self.alpha = 0.0f;
                        [self removeFromSuperview];
                    }
                     completion:^(BOOL finished)
                    {
                        self.hidden = YES;
                    }
     ];

}

-(void)showToolbar
{
    [UIView animateWithDuration:0.25 delay:0.0
                        options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction
                     animations:^(void){
                         self.hidden = NO;
                         self.alpha = 1.0f;
                         
                         ReaderViewController *test = (ReaderViewController *)self.delegate;
                         [test.view addSubview:self];
                         
                     }
                     completion:NULL
     ];

}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
