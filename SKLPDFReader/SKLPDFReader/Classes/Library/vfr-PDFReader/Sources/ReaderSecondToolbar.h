//
//  ReaderSecondToolbar.h
//  SKLPDFReader
//
//  Created by timkao on 14/1/15.
//  Copyright (c) 2014年 SKL. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "UIXToolbarView.h"

#import "ReaderMainToolbar.h"
#import "Product.h"

@class ReaderSecondToolbar;

@protocol ReaderSecondToolbarDelegate <NSObject>
// Delegate protocols

@optional
- (void)tappedInToolbar:(ReaderSecondToolbar *)toolbar saveButton:(UIButton *)button;
- (void)tappedInToolbar:(ReaderSecondToolbar *)toolbar cancelButton:(UIButton *)button;
- (void)tappedInToolbar:(ReaderSecondToolbar *)toolbar colorButton:(UIButton *)button;
- (void)tappedInToolbar:(ReaderSecondToolbar *)toolbar undoButton:(UIButton *)button;
- (void)tappedInToolbar:(ReaderSecondToolbar *)toolbar redoButton:(UIButton *)button;

@end

@protocol ReaderSecondToolbarDelegate;

@interface ReaderSecondToolbar : UIXToolbarView

@property (nonatomic, strong)ReaderMainToolbar *firstToolbar;

@property (nonatomic) int Mode;

@property (nonatomic, readonly)BOOL editMode;

@property (nonatomic, unsafe_unretained, readwrite) id delegate;

@property (nonatomic ,strong) UIPopoverController *paintPopover;

- (void)hideToolbar;
- (void)showToolbar;

-(id)getSecondToolbar;

@end
