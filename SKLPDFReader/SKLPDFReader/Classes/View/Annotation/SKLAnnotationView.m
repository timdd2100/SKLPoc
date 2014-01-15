//
//  SKLAnnotationView.m
//  SKLPDFReader
//
//  Created by skcu1805 on 2014/1/2.
//  Copyright (c) 2014年 SKL. All rights reserved.
//

#import "SKLAnnotationView.h"
#import <QuartzCore/QuartzCore.h>
#import "SKLAnnotationResizingItem.h"

@interface SKLAnnotationView () {
    BOOL _selected;
}

@property (strong, nonatomic) SKLAnnotationResizingItem *resizingControl;
@property (strong, nonatomic) UIImageView *deleteControl;
@property (strong, nonatomic) UIImageView *customControl;
@property (strong, nonatomic) UIView *selectedView;
@property (nonatomic) BOOL preventsLayoutWhileResizing;
@property (nonatomic) CGFloat deltaAngle;
@property (nonatomic) CGPoint prevPoint;
@property (nonatomic) CGAffineTransform startTransform;
@property (nonatomic) CGPoint touchStart;

@end

@implementation SKLAnnotationView

- (id) initWithFrame:(CGRect) frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupDefaultAttributes];
        
        UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(selectLongGesturePress:)];
        [self addGestureRecognizer:longGesture];
        
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesturePress:)];
        [self addGestureRecognizer:panGesture];
    }
    return self;
}

- (void) resizeTranslate:(UIPanGestureRecognizer *) recognizer {
    if ([recognizer state]== UIGestureRecognizerStateBegan) {
        _prevPoint = [recognizer locationInView:self];
        [self setNeedsDisplay];
    } else if ([recognizer state] == UIGestureRecognizerStateChanged) {
        if (self.bounds.size.width < _minWidth || self.bounds.size.height < _minHeight) {
            self.bounds = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, _minWidth + 1, _minHeight + 1);
            _selectedView.frame = CGRectInset(self.bounds, kZDStickerViewControlSize / 2, kZDStickerViewControlSize / 2);
            _resizingControl.frame = CGRectMake(self.bounds.size.width - kZDStickerViewControlSize, self.bounds.size.height - kZDStickerViewControlSize, kZDStickerViewControlSize, kZDStickerViewControlSize);
            _deleteControl.frame = CGRectMake(0, 0, kZDStickerViewControlSize, kZDStickerViewControlSize);
            _customControl.frame = CGRectMake(self.bounds.size.width - kZDStickerViewControlSize, 0, kZDStickerViewControlSize, kZDStickerViewControlSize);
            _prevPoint = [recognizer locationInView:self];
            
        } else {
            CGPoint point = [recognizer locationInView:self];
            float wChange = 0.0, hChange = 0.0;
            
            wChange = (point.x - _prevPoint.x);
            hChange = (point.y - _prevPoint.y);
            
            if (ABS(wChange) > 20.0f || ABS(hChange) > 20.0f) {
                _prevPoint = [recognizer locationInView:self];
                return;
            }
            
            if (YES == self.preventsLayoutWhileResizing) {
                if (wChange < 0.0f && hChange < 0.0f) {
                    float change = MIN(wChange, hChange);
                    wChange = change;
                    hChange = change;
                }

                if (wChange < 0.0f) {
                    hChange = wChange;
                } else if (hChange < 0.0f) {
                    wChange = hChange;
                } else {
                    float change = MAX(wChange, hChange);
                    wChange = change;
                    hChange = change;
                }
            }
            
            self.bounds = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width + (wChange), self.bounds.size.height + (hChange));
            _selectedView.frame = CGRectInset(self.bounds, kZDStickerViewControlSize / 2, kZDStickerViewControlSize / 2);
            _resizingControl.frame = CGRectMake(self.bounds.size.width - kZDStickerViewControlSize, self.bounds.size.height - kZDStickerViewControlSize, kZDStickerViewControlSize, kZDStickerViewControlSize);
            _deleteControl.frame = CGRectMake(0, 0, kZDStickerViewControlSize, kZDStickerViewControlSize);
            _customControl.frame = CGRectMake(self.bounds.size.width-kZDStickerViewControlSize, 0, kZDStickerViewControlSize, kZDStickerViewControlSize);
            _prevPoint = [recognizer locationInView:self];
        }
        
        /* Rotation */
        float ang = atan2([recognizer locationInView:self.superview].y - self.center.y, [recognizer locationInView:self.superview].x - self.center.x);
        float angleDiff = _deltaAngle - ang;
        if (NO == _preventsResizing) {
            self.transform = CGAffineTransformMakeRotation(-angleDiff);
        }
        
        [self setNeedsDisplay];
    } else if ([recognizer state] == UIGestureRecognizerStateEnded) {
        _prevPoint = [recognizer locationInView:self];
        [self setNeedsDisplay];
    }
}

- (void) setupDefaultAttributes {
    _selectedView = [[UIView alloc] initWithFrame:CGRectInset(self.bounds, kZDStickerViewControlSize / 2, kZDStickerViewControlSize / 2)];
    [_selectedView setBackgroundColor:[UIColor clearColor]];
    [_selectedView.layer setBorderWidth:2];
    [_selectedView.layer setBorderColor:[[UIColor blueColor] CGColor]];
    [self addSubview:_selectedView];
    
    if (kSPUserResizableViewDefaultMinWidth > self.bounds.size.width*0.5) {
        self.minWidth = kSPUserResizableViewDefaultMinWidth;
        self.minHeight = self.bounds.size.height * (kSPUserResizableViewDefaultMinWidth/self.bounds.size.width);
    } else {
        self.minWidth = self.bounds.size.width*0.5;
        self.minHeight = self.bounds.size.height*0.5;
    }
    
    self.preventsPositionOutsideSuperview = YES;
    self.preventsLayoutWhileResizing = YES;
    self.preventsResizing = NO;
    self.preventsDeleting = NO;
    self.preventsCustomButton = YES;
    
    /* delete */
    _deleteControl = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kZDStickerViewControlSize, kZDStickerViewControlSize)];
    _deleteControl.backgroundColor = [UIColor clearColor];
    _deleteControl.image = [UIImage imageNamed:@"ZDBtn3.png" ];
    _deleteControl.userInteractionEnabled = YES;
    
    UITapGestureRecognizer * singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(deleteTapGesturePress:)];
    [_deleteControl addGestureRecognizer:singleTap];
    [self addSubview:_deleteControl];
    
    /* resizing */
    _resizingControl = [[SKLAnnotationResizingItem alloc] initWithFrame:CGRectMake(self.frame.size.width - kZDStickerViewControlSize, self.frame.size.height - kZDStickerViewControlSize, kZDStickerViewControlSize, kZDStickerViewControlSize)];
    _resizingControl.backgroundColor = [UIColor clearColor];
    _resizingControl.userInteractionEnabled = YES;
    
    UIPanGestureRecognizer* panResizeGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(resizeTranslate:)];
    [_resizingControl addGestureRecognizer:panResizeGesture];
    [self addSubview:_resizingControl];
    
    /* custom */
    _customControl = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width - kZDStickerViewControlSize, 0, kZDStickerViewControlSize, kZDStickerViewControlSize)];
    _customControl.backgroundColor = [UIColor clearColor];
    _customControl.userInteractionEnabled = YES;
    _customControl.image = nil;
    
    UITapGestureRecognizer * customTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(customTapGesture:)];
    [_customControl addGestureRecognizer:customTapGesture];
    [self addSubview:_customControl];

    _deltaAngle = atan2(self.frame.origin.y+self.frame.size.height - self.center.y, self.frame.origin.x+self.frame.size.width - self.center.x);
}


- (void) setContentView:(UIView *) newContentView {
    [_contentView removeFromSuperview];
    _contentView = newContentView;
    _contentView.frame = CGRectInset(self.bounds, kZDStickerViewControlSize, kZDStickerViewControlSize);
    _contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addSubview:_contentView];
    
    for (UIView* subview in [_contentView subviews]) {
        [subview setFrame:CGRectMake(0, 0, _contentView.frame.size.width, _contentView.frame.size.height)];
        subview.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    
    [self bringSubviewToFront:_resizingControl];
    [self bringSubviewToFront:_deleteControl];
    [self bringSubviewToFront:_customControl];
}

- (void) setFrame:(CGRect) newFrame {
    [super setFrame:newFrame];
    
    _contentView.frame = CGRectInset(self.bounds, kSPUserResizableViewGlobalInset + kSPUserResizableViewInteractiveBorderSize/2, kSPUserResizableViewGlobalInset + kSPUserResizableViewInteractiveBorderSize/2);
    _contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    for (UIView* subview in [_contentView subviews]) {
        [subview setFrame:CGRectMake(0, 0, _contentView.frame.size.width, _contentView.frame.size.height)];
        subview.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    
    _selectedView.frame = CGRectInset(self.bounds, kZDStickerViewControlSize / 2, kZDStickerViewControlSize / 2);
    _resizingControl.frame = CGRectMake(self.bounds.size.width - kZDStickerViewControlSize, self.bounds.size.height - kZDStickerViewControlSize, kZDStickerViewControlSize, kZDStickerViewControlSize);
    _deleteControl.frame = CGRectMake(0, 0, kZDStickerViewControlSize, kZDStickerViewControlSize);
    _customControl.frame = CGRectMake(self.bounds.size.width-kZDStickerViewControlSize, 0, kZDStickerViewControlSize, kZDStickerViewControlSize);
}

- (void) translateUsingTouchLocation:(CGPoint) touchPoint {
    CGPoint newCenter = CGPointMake(self.center.x + touchPoint.x - _touchStart.x, self.center.y + touchPoint.y - _touchStart.y);
    if (self.preventsPositionOutsideSuperview) {

        CGFloat midPointX = CGRectGetMidX(self.bounds);
        if (newCenter.x > self.superview.bounds.size.width - midPointX)
            newCenter.x = self.superview.bounds.size.width - midPointX;
        
        if (newCenter.x < midPointX)
            newCenter.x = midPointX;
        
        CGFloat midPointY = CGRectGetMidY(self.bounds);
        if (newCenter.y > self.superview.bounds.size.height - midPointY)
            newCenter.y = self.superview.bounds.size.height - midPointY;

        if (newCenter.y < midPointY)
            newCenter.y = midPointY;
    }
    self.center = newCenter;
}

- (void) hideDelHandle {
    _deleteControl.hidden = YES;
}

- (void) showDelHandle {
    _deleteControl.hidden = NO;
}

- (void) hideEditingHandles {
    _resizingControl.hidden = YES;
    _deleteControl.hidden = YES;
    _customControl.hidden = YES;
}

- (void) showEditingHandles {
    _customControl.hidden = !_preventsCustomButton;
    _deleteControl.hidden = !_preventsDeleting;
    _resizingControl.hidden = !_preventsResizing;
}

- (void) showCustmomHandle {
    _customControl.hidden = NO;
}

- (void) hideCustomHandle {
    _customControl.hidden = YES;
}

- (void) setButton:(SKLAnnotationViewEditType) type image:(UIImage*)image {
    switch (type) {
        case SKLAnnotationViewEditTypeResizing:
            break;
        case SKLAnnotationViewBEditTypeDelete:
            _deleteControl.image = image;
            break;
        case SKLAnnotationViewEditTypeCustomer:
            _customControl.image = image;
            break;
        default:
            break;
    }
}


#pragma mark - Gesture Process Methods
- (void) panGesturePress:(UIPanGestureRecognizer *) recognizer {
    CGPoint touchPoint = [recognizer locationInView:self.superview];
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        _touchStart = touchPoint;
    }else if (recognizer.state == UIGestureRecognizerStateChanged) {
        [self translateUsingTouchLocation:touchPoint];
        _touchStart = touchPoint;
    }
}

- (void) deleteTapGesturePress:(UIPanGestureRecognizer *) recognizer {
    if (!self.preventsDeleting) {
        UIView * close = (UIView *)[recognizer view];
        [close.superview removeFromSuperview];
    }
    
    if ([_delegate respondsToSelector:@selector(annotationViewDidClose:)])
        [_delegate annotationViewDidClose:self];
}

- (void) customTapGesturePress:(UIPanGestureRecognizer *) recognizer {
    if (!self.preventsCustomButton)
        if([_delegate respondsToSelector:@selector(annotationViewDidCustomButtonTap:)])
            [_delegate annotationViewDidCustomButtonTap:self];
}

- (void) selectLongGesturePress:(UILongPressGestureRecognizer *) recognizer {
    if (!_select) {
        NSLog(@"selected");
        if ([_delegate respondsToSelector:@selector(annotationViewDidLongPressed:)])
            [_delegate annotationViewDidLongPressed:self];
        _select = YES;
    }
}

@end