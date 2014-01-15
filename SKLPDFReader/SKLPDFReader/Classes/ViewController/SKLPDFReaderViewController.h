//
//  SKLPDFReaderViewController.h
//  SKLPDFReader
//
//  Created by skcu1805 on 2013/12/13.
//  Copyright (c) 2013年 SKL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKLMainViewController.h"
#import "ReaderDocument.h"
#import "Product.h"

@interface SKLPDFReaderViewController : SKLMainViewController <UIGestureRecognizerDelegate>

@property (nonatomic, strong) IBOutlet UIView *baseView;
@property (nonatomic, strong) ReaderDocument *document;
@property (nonatomic, strong) Product *product;

@end
