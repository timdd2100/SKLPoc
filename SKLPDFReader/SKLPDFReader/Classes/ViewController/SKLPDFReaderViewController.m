//
//  SKLPDFReaderViewController.m
//  SKLPDFReader
//
//  Created by skcu1805 on 2013/12/13.
//  Copyright (c) 2013年 SKL. All rights reserved.
//

#import "SKLPDFReaderViewController.h"
#import "ReaderViewController.h"
#import "AnnotationViewController.h"
#import "AnnotationTextViewController.h"
#import "Product.h"

@interface SKLPDFReaderViewController () <ReaderViewControllerDelegate>

@property (nonatomic, strong) ReaderViewController *pdfController;
@property (nonatomic, strong) UIViewController *controller;

@end


@implementation SKLPDFReaderViewController


- (void) viewDidLoad {
    [super viewDidLoad];
    
//    [self addAnnotation];
    [self addPDFReader];
//    [self addAnootationText];
}

- (void) addAnootationText {
    AnnotationTextViewController *controller = [[AnnotationTextViewController alloc] init];
    
    [self addChildViewController:controller];
    [controller.view setFrame:_baseView.bounds];
    [_baseView addSubview:controller.view];
    [controller didMoveToParentViewController:self];
}

- (void) addAnnotation {
    AnnotationViewController *controller = [[AnnotationViewController alloc] init];
    
    [self addChildViewController:controller];
    [controller.view setFrame:_baseView.bounds];
    [_baseView addSubview:controller.view];
    [controller didMoveToParentViewController:self];
}

- (void) addPDFReader {
    Product *prod = [Product new];
    [self setProduct:prod];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Test-Driven iOS Development" ofType:@"pdf"];
    ReaderDocument *doc = [[ReaderDocument alloc] initWithFilePath:filePath password:Nil];
    [self setDocument:doc];
    
    ReaderViewController *readerViewController = [[ReaderViewController alloc] initWithReaderDocument:_document Product:_product];
    [readerViewController setDelegate:self];
    [readerViewController setHidesBottomBarWhenPushed:YES];
    [self setPdfController:readerViewController];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:_pdfController];
    [navController.navigationBar setHidden:YES];
    [self setController:navController];
    
    [self addChildViewController:navController];
    [_controller.view setFrame:_baseView.bounds];
    [_baseView addSubview:_controller.view];
    [_controller didMoveToParentViewController:self];
}

- (void) dealloc {
    NSLog(@"%@ %@",NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

- (BOOL) shouldAutorotate {
    return YES;
}

- (NSUInteger) supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

#pragma mark - ReaderViewControllerDelegate Methods
- (void) dismissReaderViewController:(ReaderViewController *)viewController {
//    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void) annotationPressed {
    [self addAnnotation];
}

@end