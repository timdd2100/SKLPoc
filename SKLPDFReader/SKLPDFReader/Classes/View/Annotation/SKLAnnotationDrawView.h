//
//  SKLAnnotationDrawView.h
//  SKLPDFReader
//
//  Created by skcu1805 on 2013/12/27.
//  Copyright (c) 2013年 SKL. All rights reserved.
//

#import "SKLAnnotationView.h"

@interface SKLAnnotationDrawView : UIView

- (id) initWithFrame:(CGRect) frame
       drawPathWidth:(CGFloat) dpwidth
           drawColor:(CGColorRef) dcolor;

- (void) movePoint:(CGPoint) point;
- (void) addLinePoint:(CGPoint) point;
- (SKLAnnotationView *) getDrawPathImageView;


@end