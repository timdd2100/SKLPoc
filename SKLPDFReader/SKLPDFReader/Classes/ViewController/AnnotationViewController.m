//
//  AnnotationViewController.m
//  SKLPDFReader
//
//  Created by skcu1805 on 2013/12/25.
//  Copyright (c) 2013年 SKL. All rights reserved.
//

#import "AnnotationViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImage+Crop.h"
#import "SKLAnnotationDrawView.h"
#import "SKLAnnotationResizingItem.h"

@interface AnnotationViewController () <SKLAnnotationViewDelegate> {
    CGFloat _currentPathWidth;
    CGColorRef _selectColor;
}

@property (nonatomic) NSInteger currentPage;
@property (nonatomic, strong) SKLAnnotationView *contentView;
@property (nonatomic, strong) UIPanGestureRecognizer *panGestureRecognizer;
@property (nonatomic, strong) SKLAnnotationDrawView *drawView;
@property (nonatomic, strong) UIButton *doneButton;
@property (nonatomic, strong) UIButton *editButton;

@end

@implementation AnnotationViewController

- (id) initWithContentView:(UIView *) contentView currentPage:(NSInteger) page {
    self = [self init];
    if (self) {
        [self setCurrentPage:page];
    }
    return self;
}

- (void) viewDidLoad {
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor colorWithRed:1.f green:1.f blue:0.f alpha:0.5]];

    _currentPathWidth = 20.0f;
    _selectColor = [[UIColor redColor] CGColor];

    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizerProcess:)];
    [self setPanGestureRecognizer:panGesture];
    [self.view addGestureRecognizer:_panGestureRecognizer];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(0, 0, 100, 50)];
    [button setBackgroundColor:[UIColor redColor]];
    [button addTarget:self action:@selector(doneButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Done" forState:UIControlStateNormal];
    [self setDoneButton:button];
    [self.view addSubview:_doneButton];
    
    [self beginAnnotation];
}

- (void) doneButtonPressed:(id) sender {
    [self finishAnnotation];
}

- (void) finishAnnotation {
    [_drawView removeFromSuperview];
    
    SKLAnnotationView *drawFinishedView = [_drawView getDrawPathImageView];
//    [drawFinishedView setDelegate:self];
//    [self.view addSubview:drawFinishedView];
    
    if (_delegate && [_delegate respondsToSelector:@selector(annotationDidFinishEditing:resultView:)])
        [_delegate annotationDidFinishEditing:self resultView:drawFinishedView];
    
    [self setDrawView:Nil];
}

- (void) beginAnnotation {
    SKLAnnotationDrawView *skfv = [[SKLAnnotationDrawView alloc] initWithFrame:self.view.bounds
                                                                 drawPathWidth:_currentPathWidth
                                                                     drawColor:_selectColor];
    [self setDrawView:skfv];
    [self.view insertSubview:skfv belowSubview:_doneButton];
}

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIGestureRecognizer Methods
- (void) panGestureRecognizerProcess:(UIPanGestureRecognizer *) recognizer {
    NSLog(@"pan");
    CGPoint point = [recognizer locationInView:self.view];
    
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
            [self panBeginProcessWithCGPoint:point];
            break;
        case UIGestureRecognizerStateChanged:
            [self panChangeedProcessWithCGPoint:point];
            break;
        case UIGestureRecognizerStateEnded:
            [self panEndedProcessWithCGPoint:point];
            break;
        default:
            break;
    }
}

- (void) panBeginProcessWithCGPoint:(CGPoint) point {
//    [self beginAnnotation];
    [_drawView movePoint:point];
}

- (void) panChangeedProcessWithCGPoint:(CGPoint) point {
    [_drawView addLinePoint:point];
    [_drawView setNeedsDisplay];
}

- (void) panEndedProcessWithCGPoint:(CGPoint) point {
//    [self finishAnnotation];
}


#pragma mark -
- (void) annotationViewDidBeginEditing:(SKLAnnotationView *) sticker {
    
}

- (void) annotationViewDidEndEditing:(SKLAnnotationView *) sticker {
    
}

- (void) annotationViewDidCancelEditing:(SKLAnnotationView *) sticker {
    
}

- (void) annotationViewDidClose:(SKLAnnotationView *)sticker {
    
}

- (void) annotationViewDidLongPressed:(SKLAnnotationView *)sticker {
    [sticker setSelect:YES];
}

- (void) annotationViewDidCustomButtonTap:(SKLAnnotationView *)sticker {
    
}

@end