//
//  ColorViewController.h
//  SKLPDFReader
//
//  Created by timkao on 14/1/16.
//  Copyright (c) 2014年 SKL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet UICollectionView *collection;

@end
