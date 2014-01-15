//
//  SKLAnnotationView.h
//  SKLPDFReader
//
//  Created by skcu1805 on 2014/1/2.
//  Copyright (c) 2014年 SKL. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kSPUserResizableViewGlobalInset 2.5
#define kSPUserResizableViewDefaultMinWidth 24.0
#define kSPUserResizableViewInteractiveBorderSize 20.0
#define kZDStickerViewControlSize 20.0

typedef enum {
    SKLAnnotationViewEditTypeNone,
    SKLAnnotationViewBEditTypeDelete,
    SKLAnnotationViewEditTypeResizing,
    SKLAnnotationViewEditTypeCustomer,
    SKLAnnotationViewEditTypeMax
} SKLAnnotationViewEditType;

@protocol SKLAnnotationViewDelegate;

@interface SKLAnnotationView : UIView

@property (nonatomic, weak) id<SKLAnnotationViewDelegate> delegate;
@property (nonatomic, assign, getter=isSelect) BOOL select;

@property (assign, nonatomic) UIView *contentView;
@property (nonatomic) BOOL preventsPositionOutsideSuperview;    //default = YES
@property (nonatomic) BOOL preventsResizing;                    //default = NO
@property (nonatomic) BOOL preventsDeleting;                    //default = NO
@property (nonatomic) BOOL preventsCustomButton;                //default = YES
@property (nonatomic) CGFloat minWidth;
@property (nonatomic) CGFloat minHeight;

- (void) hideDelHandle;
- (void) showDelHandle;
- (void) hideEditingHandles;
- (void) showEditingHandles;
- (void) showCustmomHandle;
- (void) hideCustomHandle;
- (void) setButton:(SKLAnnotationViewEditType) type image:(UIImage*) image;

@end

@protocol SKLAnnotationViewDelegate <NSObject>
@optional
- (void) annotationViewDidBeginEditing:(SKLAnnotationView *) sticker;
- (void) annotationViewDidEndEditing:(SKLAnnotationView *) sticker;
- (void) annotationViewDidCancelEditing:(SKLAnnotationView *) sticker;
- (void) annotationViewDidClose:(SKLAnnotationView *)sticker;
- (void) annotationViewDidLongPressed:(SKLAnnotationView *)sticker;
- (void) annotationViewDidCustomButtonTap:(SKLAnnotationView *)sticker;

@end