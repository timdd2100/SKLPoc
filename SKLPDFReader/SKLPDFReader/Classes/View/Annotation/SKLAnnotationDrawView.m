//
//  SKLAnnotationDrawView.m
//  SKLPDFReader
//
//  Created by skcu1805 on 2013/12/27.
//  Copyright (c) 2013年 SKL. All rights reserved.
//

#import "SKLAnnotationDrawView.h"
#import <QuartzCore/QuartzCore.h>
#import "UIBezierPath+Points.h"

#define DEGREES_TO_RADIANS(x) (M_PI * x / 180.0)

typedef enum {
    CGScaleBasePointTop,
    CGScaleBasePointLeft,
    CGScaleBasePointRight,
    CGScaleBasePointBotton
} CGScaleBasePoint;

@interface SKLAnnotationDrawView () {
    CGFloat _drawPathWidth;
    CGColorRef _drawColor;
    CGMutablePathRef _drawPathRef;
}

@property (nonatomic, strong) UIBezierPath *drawBezierPath;

@end

@implementation SKLAnnotationDrawView

- (id) initWithFrame:(CGRect) frame drawPathWidth:(CGFloat) dpwidth drawColor:(CGColorRef) dcolor; {
    self = [self initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        
        _drawPathWidth = dpwidth;
        _drawColor = dcolor;
    }
    return self;
}

- (void) movePoint:(CGPoint) point {
    if (!_drawBezierPath) {
        _drawPathRef = CGPathCreateMutable();
        CGPathMoveToPoint(_drawPathRef, NULL, point.x, point.y);
        
        [self setDrawBezierPath:[UIBezierPath bezierPathWithCGPath:_drawPathRef]];
        [_drawBezierPath setLineWidth:_drawPathWidth];
        [_drawBezierPath setLineJoinStyle:kCGLineJoinRound];
        [_drawBezierPath setLineCapStyle:kCGLineCapRound];
    }else {
        CGPathMoveToPoint(_drawPathRef, NULL, point.x, point.y);
        [_drawBezierPath moveToPoint:point];
    }
}

- (void) addLinePoint:(CGPoint) point {
    CGPathAddLineToPoint(_drawPathRef, NULL, point.x, point.y);
    [_drawBezierPath addLineToPoint:point];
}

- (void) drawRect:(CGRect)rect {
    [super drawRect:rect];
    [self drawPathWithRect:rect];
}

- (void) drawPathWithRect:(CGRect) rect {
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSetShouldAntialias(currentContext, YES);
    CGContextSetStrokeColorWithColor(currentContext, _drawColor);
    CGContextSetLineJoin(currentContext, _drawBezierPath.lineJoinStyle);
    CGContextSetLineCap(currentContext, _drawBezierPath.lineCapStyle);
    CGContextSetLineWidth(currentContext, _drawBezierPath.lineWidth);
    CGContextAddPath(currentContext, _drawBezierPath.CGPath);
    CGContextStrokePath(currentContext);
}

- (SKLAnnotationView *) getDrawPathImageView {
    CGRect rect = [self getDrawRect];
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextTranslateCTM(context, -rect.origin.x, -rect.origin.y);
    [self.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    SKLAnnotationView *imageView = [[SKLAnnotationView alloc] initWithFrame:[self getDrawRect]];
    [imageView.layer setContents:(id)(img.CGImage)];
    
    CGPathRelease(_drawPathRef);
    return imageView;
}

- (CGRect) getDrawRect {
    CGRect rect = CGPathGetPathBoundingBox(_drawBezierPath.CGPath);
    rect.origin.x -= _drawPathWidth + kZDStickerViewControlSize / 2;
    rect.origin.y -= _drawPathWidth + kZDStickerViewControlSize / 2;
    rect.size.width += _drawPathWidth * 2 + kZDStickerViewControlSize;
    rect.size.height += _drawPathWidth * 2 + kZDStickerViewControlSize;
    return rect;
}

CGPathRef createPathRotatedAroundBoundingBoxCenter(CGPathRef path, CGFloat radians) {
    CGRect bounds = CGPathGetBoundingBox(path);
    CGPoint center = CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds));
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform = CGAffineTransformTranslate(transform, center.x, center.y);
    transform = CGAffineTransformRotate(transform, radians);
    transform = CGAffineTransformTranslate(transform, -center.x, -center.y);
    return CGPathCreateCopyByTransformingPath(path, &transform);
}

CGPathRef createPathToScale(CGPathRef path, CGScaleBasePoint point, CGFloat x, CGFloat y) {
    CGRect bounds = CGPathGetBoundingBox(path);
    CGPoint center = CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds));
    CGPoint base = CGPointZero;
    CGAffineTransform transform = CGAffineTransformMakeScale(x, y);
    switch (point) {
        case CGScaleBasePointTop:
            base = CGPointMake(center.x, bounds.origin.y);
            break;
        case CGScaleBasePointLeft:
            base = CGPointMake(bounds.origin.x, center.y);
            break;
        case CGScaleBasePointRight:
            base = CGPointMake(bounds.size.width, center.y);
            break;
        default:
            base = CGPointMake(center.x, bounds.size.height);
            break;
    }
    transform = CGAffineTransformTranslate(transform, base.x, base.y);
    return CGPathCreateCopyByTransformingPath(path, &transform);
}

@end