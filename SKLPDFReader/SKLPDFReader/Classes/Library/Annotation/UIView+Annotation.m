//
//  UIView+Annotation.m
//  SKLPDFReader
//
//  Created by skcu1805 on 2014/1/2.
//  Copyright (c) 2014年 SKL. All rights reserved.
//

#import "UIView+Annotation.h"

@interface UIView () {
    BOOL _selected;
}

@end


@implementation UIView (Annotation)
@dynamic sklDelegate;

- (id) initWithAnnotationFrame:(CGRect)frame {
    self = [self initWithFrame:frame];
    if (self) {
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureProcess:)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

- (BOOL) isSelect {
    return _selected;
}

- (void) setSelect:(BOOL)select {
    if (select) {
        [self.layer setBorderColor:[[UIColor blackColor] CGColor]];
        [self.layer setBorderWidth:2.f];
    }else {
        [self.layer setBorderColor:NULL];
        [self.layer setBorderWidth:0.f];
    }
    
    _selected = select;
}

- (void) tapGestureProcess:(UITapGestureRecognizer *) recognizer {
    [self.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [self.layer setBorderWidth:2.f];
    
    if (self.sklDelegate && [self.sklDelegate respondsToSelector:@selector(tapGestureProcess:)]) {
        [self.sklDelegate tapAnnotationView:self];
    }
}

@end