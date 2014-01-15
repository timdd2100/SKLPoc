//
//  UIView+Annotation.h
//  SKLPDFReader
//
//  Created by skcu1805 on 2014/1/2.
//  Copyright (c) 2014年 SKL. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SKLAnnotationViewDelegate;

@interface UIView (Annotation)

@property (nonatomic, weak) id<SKLAnnotationViewDelegate> sklDelegate;
@property (nonatomic, assign, getter=isSelect) BOOL select;

- (id) initWithAnnotationFrame:(CGRect)frame;

@end

@protocol SKLAnnotationViewDelegate <NSObject>
@optional
- (void) tapAnnotationView:(UIView *) antView;

@end
