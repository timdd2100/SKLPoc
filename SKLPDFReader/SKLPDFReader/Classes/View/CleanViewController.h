//
//  CleanViewController.h
//  SKLPDFReader
//
//  Created by timkao on 14/1/21.
//  Copyright (c) 2014年 SKL. All rights reserved.
//

#import <UIKit/UIKit.h>


//@class CleanDelegate;

#pragma -mark clean 協定
@protocol CleanDelegate <NSObject>
// Delegate protocols

@required
-(void)tappedPageCleanButton:(UIButton *)sender;
-(void)tappedAllPageCleanButton:(UIButton *)sender;
@end


@interface CleanViewController : UIViewController

@property (nonatomic) id delegate;
@property (nonatomic ,weak) UIPopoverController* popover;
@end
