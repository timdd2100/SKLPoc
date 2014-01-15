//
//  SKLAnnotationTextView.h
//  SKLPDFReader
//
//  Created by skcu1805 on 2013/12/27.
//  Copyright (c) 2013年 SKL. All rights reserved.
//

#import "SKLAnnotationView.h"

@interface SKLAnnotationTextView : SKLAnnotationView

@property (nonatomic, strong) NSString *drawText;

- (id) initWithFrame:(CGRect) frame string:(NSString *) txt font:(UIFont *) font;

@end