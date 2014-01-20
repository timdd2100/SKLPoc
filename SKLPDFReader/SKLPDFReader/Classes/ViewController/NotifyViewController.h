//
//  NotifyViewController.h
//  SKLPDFReader
//
//  Created by timkao on 14/1/17.
//  Copyright (c) 2014年 SKL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotifyViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *notifyLabel;

//給定需要呈現的文字和指定要長出的view
-(id)initWithNotifyContent:(NSString *)Content WithView:(UIView *)View;



@end
