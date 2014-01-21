//
//  PaintPenViewController.h
//  SKLPDFReader
//
//  Created by timkao on 14/1/21.
//  Copyright (c) 2014年 SKL. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma -mark clean 協定

@protocol PaintPenDelegate <NSObject>
// Delegate protocols

@required
-(void)tappedStraightButton:(UIButton *)sender;
-(void)tappedCurveButton:(UIButton *)sender;
@end


@interface PaintPenViewController : UIViewController

@property (nonatomic) id delegate;
@property (weak, nonatomic) UIPopoverController *popover;


@end
