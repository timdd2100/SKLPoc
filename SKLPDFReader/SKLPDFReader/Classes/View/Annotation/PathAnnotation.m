//
//  PathAnnotation.m
//  SKLPDFReader
//
//  Created by skcu1805 on 2013/12/25.
//  Copyright (c) 2013年 SKL. All rights reserved.
//

#import "PathAnnotation.h"

@implementation PathAnnotation

+ (id) pathAnnotationWithPath:(CGPathRef)path color:(CGColorRef) color fill:(BOOL)fill {
    return [PathAnnotation pathAnnotationWithPath:path color:color lineWidth:3.0 fill:fill];
}

+ (id) pathAnnotationWithPath:(CGPathRef)path color:(CGColorRef) color lineWidth:(CGFloat) width fill:(BOOL) fill {
    PathAnnotation *pa = [[PathAnnotation alloc] init];
    pa.path = path;
    pa.color = color;
    pa.lineWidth = width;
    pa.fill = fill;
    return pa;
}

- (void) drawInContext:(CGContextRef)context {
    CGContextAddPath(context, self.path);
    CGContextSetLineWidth(context, self.lineWidth);
    if (self.fill) {
        CGContextSetFillColorWithColor(context, self.color);
        CGContextFillPath(context);
    } else {
        CGContextSetStrokeColorWithColor(context, self.color);
        CGContextStrokePath(context);
    }
}


@end