//
//  ColorViewController.m
//  SKLPDFReader
//
//  Created by timkao on 14/1/16.
//  Copyright (c) 2014年 SKL. All rights reserved.
//

#import "ColorViewController.h"

@implementation ColorViewController

- (id)initWithFrame:(CGRect)frame
{
    return self;
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

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    collectionView.scrollEnabled = YES;
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"colorcell" forIndexPath:indexPath];
    
  
    
    //修改cell上的物件 名字
    //UILabel *label = (UILabel *) [[cell.contentView subviews] objectAtIndex:1];
    
    //label.text = [(People *)[data.PeopleDataSource objectAtIndex:indexPath.row] Name];
    
    cell.backgroundColor =[UIColor whiteColor];
    return cell;
}


@end
