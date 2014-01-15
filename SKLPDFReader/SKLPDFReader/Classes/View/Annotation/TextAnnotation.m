//
//  TextAnnotation.m
//  SKLPDFReader
//
//  Created by skcu1805 on 2013/12/25.
//  Copyright (c) 2013年 SKL. All rights reserved.
//

#import "TextAnnotation.h"

@implementation TextAnnotation

+ (id) textAnnotationWithText:(NSString *) text inRect:(CGRect) rect withFont:(UIFont*) font {
    TextAnnotation *ta = [[TextAnnotation alloc] init];
    ta.text = text;
    ta.rect = rect;
    ta.font = font;
    return ta;
}

- (void) drawInContext:(CGContextRef) context {
    CGContextSetTextMatrix(context, CGAffineTransformMake(1.0, 0.0, 0.0, -1.0, 0.0, 0.0));
    CGContextSelectFont(context, "Arial", self.font.pointSize, kCGEncodingMacRoman);
    CGContextShowTextAtPoint(context, self.rect.origin.x, self.rect.origin.y + self.font.pointSize,
                             [self.text cStringUsingEncoding:[NSString defaultCStringEncoding]],
                             [self.text length]);
}

@end
