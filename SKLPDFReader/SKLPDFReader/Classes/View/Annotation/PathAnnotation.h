//
//  PathAnnotation.h
//  SKLPDFReader
//
//  Created by skcu1805 on 2013/12/25.
//  Copyright (c) 2013年 SKL. All rights reserved.
//

#import "Annotation.h"

@interface PathAnnotation : Annotation

@property CGPathRef path;
@property CGColorRef color;
@property BOOL fill;
@property CGFloat lineWidth;

+ (id) pathAnnotationWithPath:(CGPathRef) path color:(CGColorRef) color fill:(BOOL) fill;
+ (id) pathAnnotationWithPath:(CGPathRef) path color:(CGColorRef) color lineWidth:(CGFloat) width fill:(BOOL) fill;

@end