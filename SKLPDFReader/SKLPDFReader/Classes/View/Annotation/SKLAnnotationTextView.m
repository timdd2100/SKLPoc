//
//  SKLAnnotationTextView.m
//  SKLPDFReader
//
//  Created by skcu1805 on 2013/12/27.
//  Copyright (c) 2013年 SKL. All rights reserved.
//

#import "SKLAnnotationTextView.h"
#import <CoreText/CoreText.h>
#import <QuartzCore/QuartzCore.h>

@interface SKLAnnotationTextView () {
    CGRect _drawRect;
}

@property (nonatomic, strong) UIFont *drawFont;

@end

@implementation SKLAnnotationTextView

- (id) initWithFrame:(CGRect) frame string:(NSString *) txt font:(UIFont *) font {
    self = [self initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        [self setDrawFont:font];
        [self setDrawText:txt];
        _drawRect = frame;
    }
    return self;
}

- (void) drawRect:(CGRect) rect {
    CGRect contentRect = CGRectInset(rect, kZDStickerViewControlSize * 4, kZDStickerViewControlSize * 4);
//    [self drawText:_drawText inRect:contentRect font:_drawFont];
    [self drawLabelWIthText:_drawText inRect:contentRect font:_drawFont];
}

- (void) drawLabelWIthText:(NSString *) text inRect:(CGRect) rect font:(UIFont *) dfont {
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    [label setNumberOfLines:0];
    [label setText:text];
    [label setTextColor:[UIColor darkGrayColor]];
    [label setFont:dfont];
    [self setContentView:label];
}

- (void) drawText:(NSString *) text inRect:(CGRect) rect font:(UIFont *) dfont {
    CTFontRef font = CTFontCreateWithName((CFStringRef)[dfont fontName], [dfont pointSize], NULL);
    CFStringRef string = (__bridge CFStringRef)text;
    CFStringRef keys[] = { kCTFontAttributeName };
    CFTypeRef values[] = { font };
    CFDictionaryRef attributes = CFDictionaryCreate(kCFAllocatorDefault,
                                                    (const void**)&keys,
                                                    (const void**)&values,
                                                    sizeof(keys) / sizeof(keys[0]),
                                                    &kCFTypeDictionaryKeyCallBacks,
                                                    &kCFTypeDictionaryValueCallBacks);
    
    CFAttributedStringRef currentText = CFAttributedStringCreate(kCFAllocatorDefault, string, attributes);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGMutablePathRef framePath = CGPathCreateMutable();
    CGRect frame = CGRectMake(3, 3, rect.size.width - 6, rect.size.height - 6);
    
    CGPathAddRect(framePath, NULL, frame);
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString(currentText);
    CTFrameRef frameRef = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), framePath, NULL);
    CGContextTranslateCTM(context, 0, self.frame.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CTFrameDraw(frameRef, context);
    CGContextTranslateCTM(context, 0, self.frame.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CGPathRelease(framePath);
    CFRelease(string);
    CFRelease(currentText);
    CFRelease(frameRef);
}

@end