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
#define SAVE_BUTTON_WIDTH 56.0f
#define CANCEL_BUTTON_WIDTH 56.0f
#define TEXT_BUTTON_WIDTH 56.0f
#define COLOR_BUTTON_WIDTH 56.0f
#define PAINT_BUTTON_WIDTH 56.0f
#define UNDO_BUTTON_WIDTH 56.0f
#define REDO_BUTTON_WIDTH 56.0f


#import "ReaderSecondToolbar.h"
#import "ReaderViewController.h"
#import "ColorViewController.h"

@implementation ReaderSecondToolbar
{
    CGFloat rightButtonX;
    CGFloat leftButtonX;
    UIImage *buttonH;
    UIImage *buttonN;
    CGFloat viewWidth;
}



@synthesize editMode,statusPopover,delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        editMode = YES;//設定編輯模式
        
        //定義按鈕的框框
        UIImage *imageH = [UIImage imageNamed:@"Reader-Button-H.png"];
		UIImage *imageN = [UIImage imageNamed:@"Reader-Button-N.png"];
        buttonH = [imageH stretchableImageWithLeftCapWidth:5 topCapHeight:0];
		buttonN = [imageN stretchableImageWithLeftCapWidth:5 topCapHeight:0];
        
        viewWidth = self.bounds.size.width;//寬度
        
        leftButtonX = BUTTON_X; // Left button start X position
        //init -- end
        
        
        /*
         共有的UI生成（取消 儲存）
         */
        
        //取消button
        UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
		cancelButton.frame = CGRectMake(leftButtonX, BUTTON_Y, CANCEL_BUTTON_WIDTH, BUTTON_HEIGHT);
		[cancelButton setTitle:NSLocalizedString(@"取消", @"button") forState:UIControlStateNormal];
		[cancelButton setTitleColor:[UIColor colorWithWhite:0.0f alpha:1.0f] forState:UIControlStateNormal];
		[cancelButton setTitleColor:[UIColor colorWithWhite:1.0f alpha:1.0f] forState:UIControlStateHighlighted];
		[cancelButton addTarget:self action:@selector(cancelButtonTapped) forControlEvents:UIControlEventTouchUpInside];
		[cancelButton setBackgroundImage:buttonH forState:UIControlStateHighlighted];
		[cancelButton setBackgroundImage:buttonN forState:UIControlStateNormal];
		cancelButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
		cancelButton.autoresizingMask = UIViewAutoresizingNone;
		[self addSubview:cancelButton];
        
        //儲存
        rightButtonX = viewWidth; // Right button start X position
        rightButtonX -= (SAVE_BUTTON_WIDTH + BUTTON_SPACE);
        
		UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
		saveButton.frame = CGRectMake(rightButtonX, BUTTON_Y, SAVE_BUTTON_WIDTH, BUTTON_HEIGHT);
        [saveButton setTitle:@"儲存" forState:UIControlStateNormal];
		//[flagButton setImage:[UIImage imageNamed:@"Reader-Mark-N.png"] forState:UIControlStateNormal];
		[saveButton addTarget:self action:@selector(saveButtonTapped) forControlEvents:UIControlEventTouchUpInside];
		[saveButton setBackgroundImage:buttonH forState:UIControlStateHighlighted];
		[saveButton setBackgroundImage:buttonN forState:UIControlStateNormal];
		saveButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
		[self addSubview:saveButton];
        //---共有 end
    }
    return self;
}


#pragma -mark functions

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

#pragma -mark 各種模式UI生成

//文字方塊模式
-(void) textMode
{
    //調色盤
    rightButtonX -= (COLOR_BUTTON_WIDTH + BUTTON_SPACE);
    
    UIButton *colorButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    colorButton.frame = CGRectMake(rightButtonX, BUTTON_Y, COLOR_BUTTON_WIDTH, BUTTON_HEIGHT);
    [colorButton setImage:[UIImage imageNamed:@"COLOR.png"] forState:UIControlStateNormal];
    [colorButton addTarget:self action: @selector(colorButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [colorButton setBackgroundImage:buttonH forState:UIControlStateHighlighted];
    [colorButton setBackgroundImage:buttonN forState:UIControlStateNormal];
    colorButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    
    [self addSubview:colorButton];
}


//paint筆繪模式
-(void)paintMode
{
    //調色盤
    rightButtonX -= (COLOR_BUTTON_WIDTH + BUTTON_SPACE);
    
    UIButton *colorButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    colorButton.frame = CGRectMake(rightButtonX, BUTTON_Y, COLOR_BUTTON_WIDTH, BUTTON_HEIGHT);
    [colorButton setImage:[UIImage imageNamed:@"COLOR.png"] forState:UIControlStateNormal];
    [colorButton addTarget:self action:@selector(colorButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [colorButton setBackgroundImage:buttonH forState:UIControlStateHighlighted];
    [colorButton setBackgroundImage:buttonN forState:UIControlStateNormal];
    colorButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    [self addSubview:colorButton];
    
    //畫筆
    rightButtonX -= (PAINT_BUTTON_WIDTH + BUTTON_SPACE);
    
    UIButton *paintButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    paintButton.frame = CGRectMake(rightButtonX, BUTTON_Y, PAINT_BUTTON_WIDTH, BUTTON_HEIGHT);
    [paintButton setImage:[UIImage imageNamed:@"pen.png"] forState:UIControlStateNormal];
    [paintButton addTarget:self action:@selector(paintButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [paintButton setBackgroundImage:buttonH forState:UIControlStateHighlighted];
    [paintButton setBackgroundImage:buttonN forState:UIControlStateNormal];
    paintButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    [self addSubview:paintButton];
    
    
    //undo
    rightButtonX -= (UNDO_BUTTON_WIDTH + BUTTON_SPACE);
    
    UIButton *undoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    undoButton.frame = CGRectMake(rightButtonX, BUTTON_Y, UNDO_BUTTON_WIDTH, BUTTON_HEIGHT);
    [undoButton setImage:[UIImage imageNamed:@"undo.png"] forState:UIControlStateNormal];
    [undoButton addTarget:self action:@selector(undoButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [undoButton setBackgroundImage:buttonH forState:UIControlStateHighlighted];
    [undoButton setBackgroundImage:buttonN forState:UIControlStateNormal];
    undoButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    [self addSubview:undoButton];
    
    //redo
    rightButtonX -= (PAINT_BUTTON_WIDTH + BUTTON_SPACE);
    
    UIButton *redoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    redoButton.frame = CGRectMake(rightButtonX, BUTTON_Y, REDO_BUTTON_WIDTH, BUTTON_HEIGHT);
    [redoButton setImage:[UIImage imageNamed:@"redo.png"] forState:UIControlStateNormal];
    [redoButton addTarget:self action:@selector(paintButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [redoButton setBackgroundImage:buttonH forState:UIControlStateHighlighted];
    [redoButton setBackgroundImage:buttonN forState:UIControlStateNormal];
    redoButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    [self addSubview:redoButton];
    
}


#pragma -mark functions

//回傳他自己
-(id)getSecondToolbar
{
    if(self)
    {
        return self;
    }
    else
    {
        return Nil;
    }
}

-(void)showToolbar
{
    //判定是哪種模式進來mode = 0(文字方塊) or 1（筆繪模式）
    if (self.Mode == 0) {
        //文字方塊模式
        [self textMode];
    }
    else if(self.Mode == 1 )
    {
        //筆繪模式
        [self paintMode];
    }
    
    //加入動畫
    [UIView animateWithDuration:0.3 delay:0.0
                        options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction
                     animations:^(void){
                         self.alpha = 0.0f;
                         self.alpha = 1.0f;
                         
                         //要修正
                         ReaderViewController *test = (ReaderViewController *)self.delegate;
                         [test.view addSubview:self];
                     }
                     completion:NULL
     ];
    
}

-(void)cancelButtonTapped
{
    //加入動畫
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         self.alpha = 1.0f;
                         self.alpha = 0.0f;
                     } completion:^(BOOL finished) {
                         
                         //消失後要讓上一個toolbar顯示回來
                         [UIView animateWithDuration:0.3 delay:0.0
                                             options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction
                                          animations:^(void){
                                              self.firstToolbar.alpha = 0.0f;
                                              self.firstToolbar.alpha = 1.0f;
                                          }
                                          completion:^(BOOL finished)
                          {
                              [self removeFromSuperview];//動畫完成後移除secondtoolbar
                          }
                          ];
                     }];
}

#pragma -mark 新增 委派按鈕事件

-(void)saveButtonTapped:(UIButton *)button
{
    //委派給編輯模式的viewcontroller處理
    [delegate tappedInToolbar:self saveButton:button];
    NSLog(@"finish");
}

-(void)colorButtonTapped:(UIButton *)button
{
    ColorViewController *colorPop = [[ColorViewController alloc]initWithNibName:@"ColorView" bundle:Nil];
    
    statusPopover =   [[UIPopoverController alloc]initWithContentViewController:colorPop];
    statusPopover.popoverContentSize = CGSizeMake(200.0f, 200.0f);
    [statusPopover presentPopoverFromRect:button.frame inView:self permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
    //委派給編輯模式的viewcontroller
    //[delegate tappedInToolbar:self colorButton:button];
    NSLog(@"finish");
}

-(void)paintButtonTapped:(UIButton *)button
{
    //委派給編輯模式的viewcontroller
    [delegate tappedInToolbar:self paintButton:button];
    NSLog(@"finish");
}

-(void)redoButtonTapped:(UIButton *)button
{
    //委派給編輯模式的viewcontroller
    [delegate tappedInToolbar:self redoButton:button];
    NSLog(@"finish");
}

-(void)undoButtonTapped:(UIButton *)button
{
    //委派給編輯模式的viewcontroller
    [delegate tappedInToolbar:self undoButton:button];
    NSLog(@"finish");
}


@end
