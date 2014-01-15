//
//  SKLAnnotationResizingItem.m
//  SKLPDFReader
//
//  Created by skcu1805 on 2014/1/7.
//  Copyright (c) 2014年 SKL. All rights reserved.
//

#import "SKLAnnotationResizingItem.h"

#define RESIZING_BORDER_WIDTH 3.0

@implementation SKLAnnotationResizingItem

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (void) drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextAddEllipseInRect(context, rect);
    CGContextSetRGBFillColor(context, 0.0, 0.0, 255.0, 1.0);
    CGContextFillPath(context);
    
    CGContextAddEllipseInRect(context, CGRectInset(rect, 2, 2));
    CGContextSetRGBFillColor(context, 255.0, 255.0, 255.0, 1.0);
    CGContextFillPath(context);
    
    CGContextAddEllipseInRect(context, CGRectInset(rect, 4, 4));
    CGContextSetRGBFillColor(context, 0.0, 0.0, 255.0, 1.0);
    CGContextFillPath(context);
}

@end