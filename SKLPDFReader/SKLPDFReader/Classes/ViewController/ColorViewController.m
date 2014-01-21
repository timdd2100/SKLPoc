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
    
    [self.collection registerNib:[UINib nibWithNibName:@"ColorCell" bundle:Nil]  forCellWithReuseIdentifier:@"CELL1"];
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
    
    ColorCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL1" forIndexPath:indexPath];
    
    //修改cell上的物件 名字
    UILabel *label = (UILabel *) [[cell.contentView subviews] objectAtIndex:0];
    cell.tag = indexPath.row;
    label.tag = indexPath.row;
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ColorCell *cell = (ColorCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.highlighted = YES;
    
    UILabel *label = (UILabel *) [[cell.contentView subviews] objectAtIndex:0];
    NSLog(@"%ld",(long)cell.tag);
}


@end
