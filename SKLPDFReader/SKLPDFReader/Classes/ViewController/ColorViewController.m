//
//  ColorViewController.m
//  SKLPDFReader
//
//  Created by timkao on 14/1/16.
//  Copyright (c) 2014年 SKL. All rights reserved.
//

#import "ColorViewController.h"
#import "ColorCell.h"

@implementation ColorViewController

-(void) viewDidLoad
{
    [super viewDidLoad];
    
    [self.collection registerNib:[UINib nibWithNibName:@"ColorCell" bundle:Nil]  forCellWithReuseIdentifier:@"CELL"];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
#pragma -mark -- CollectionView


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    collectionView.scrollEnabled = YES;
    
    ColorCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    
    //修改cell上的物件 名字
    UILabel *label = (UILabel *) [[cell.contentView subviews] objectAtIndex:0];
    
    label.text = [NSString stringWithFormat:@"cell %i",indexPath.row];
    return cell;
}


@end
