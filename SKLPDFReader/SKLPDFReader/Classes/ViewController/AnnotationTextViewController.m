//
//  AnnotationTextViewController.m
//  SKLPDFReader
//
//  Created by skcu1805 on 2013/12/27.
//  Copyright (c) 2013年 SKL. All rights reserved.
//

#import "AnnotationTextViewController.h"
#import "SKLAnnotationTextView.h"

@interface AnnotationTextViewController () {
    UIFont *_drawFont;
}

@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;
@property (nonatomic, strong) SKLAnnotationTextView *drawView;
@property (nonatomic, strong) UIImageView *drawFinishedView;

@end

@implementation AnnotationTextViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor clearColor]];
    
    _drawFont = [UIFont fontWithName:Nil size:16];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizerProcess:)];
    [self setTapGestureRecognizer:tapGesture];
    [self.view addGestureRecognizer:_tapGestureRecognizer];
}

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) tapGestureRecognizerProcess:(UITapGestureRecognizer *) recognizer {
    NSString *str = @"I have a custom subclass of UILabel which makes custom drawing using CoreText. I used to draw my strings using the UIFont that is set on the label accessing it using the font property. I also add some traits to the font. ";
    
    CGPoint point = [recognizer locationInView:self.view];
    CGSize layoutSize = [str sizeWithFont:_drawFont constrainedToSize:CGSizeMake(self.view.frame.size.width - point.x , CGFLOAT_MAX) lineBreakMode:NSLineBreakByClipping];
    CGRect rect = CGRectMake(point.x, point.y, layoutSize.width, layoutSize.height);
    
    SKLAnnotationTextView *textView = [[SKLAnnotationTextView alloc] initWithFrame:rect string:str font:_drawFont];
    [self.view addSubview:textView];
    
}

#pragma mark - SKLAnnotationViewDelegate Methods
- (void) tapAnnotationView:(SKLAnnotationView *)antView {
    for (SKLAnnotationView *sView in self.view.subviews) {
        if (sView == antView) {
            [sView setSelect:!sView.select];
        }else {
            [sView setSelect:NO];
        }
    }
}

@end