//
//  AnnotationViewController.h
//  SKLPDFReader
//
//  Created by skcu1805 on 2013/12/25.
//  Copyright (c) 2013年 SKL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKLAnnotationDrawView.h"
#import "ReaderContentView.h"

@protocol AnnotationViewControllerDelegate;

@interface AnnotationViewController : UIViewController

@property (nonatomic, weak) id<AnnotationViewControllerDelegate> delegate;
- (id) initWithContentView:(UIView *) contentView currentPage:(NSInteger) page;

@end

@protocol AnnotationViewControllerDelegate <NSObject>
@optional
- (void) annotationDidFinishEditing:(AnnotationViewController *) controller resultView:(SKLAnnotationView *) annotationView;
- (void) annotationWillBeginEditing:(AnnotationViewController *) controller;

@end