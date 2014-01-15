//
//  TextAnnotation.h
//  SKLPDFReader
//
//  Created by skcu1805 on 2013/12/25.
//  Copyright (c) 2013年 SKL. All rights reserved.
//

#import "Annotation.h"

@interface TextAnnotation : Annotation

@property NSString *text;
@property CGRect rect;
@property UIFont *font;

+ (id) textAnnotationWithText:(NSString*) text inRect:(CGRect) rect withFont:(UIFont*) font;

@end