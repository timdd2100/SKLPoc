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

@required // Delegate protocols

- (void)tappedInToolbar:(ReaderSecondToolbar *)toolbar doneButton:(UIButton *)button;
- (void)tappedInToolbar:(ReaderSecondToolbar *)toolbar thumbsButton:(UIButton *)button;
- (void)tappedInToolbar:(ReaderSecondToolbar *)toolbar printButton:(UIButton *)button;
- (void)tappedInToolbar:(ReaderSecondToolbar *)toolbar emailButton:(UIButton *)button;
- (void)tappedInToolbar:(ReaderSecondToolbar *)toolbar markButton:(UIButton *)button;

@end

@interface ReaderSecondToolbar : UIXToolbarView
{
}

@property (nonatomic, strong)ReaderMainToolbar *firstToolbar;

@property (nonatomic) int Mode;

@property (nonatomic, readonly)BOOL editMode;

@property (nonatomic, unsafe_unretained, readwrite) id delegate;

- (id)initWithFrame:(CGRect)frame Product:(Product*)pro;

- (void)hideToolbar;
- (void)showToolbar;

-(id)getSecondToolbar;

@end
