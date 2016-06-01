//
//  ViewController.m
//  collection_master
//
//  Created by xiaoliangwang on 14-6-27.
//  Copyright (c) 2014年 芳仔小脚丫. All rights reserved.
//

#import "ViewController.h"
#import "collectionCell.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setUpCollection];
}

-(void)setUpCollection{
    self.dataMArr = [NSMutableArray array];
    for(NSInteger index = 0;index<9; index++){
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",(long)index+1]];
        NSString *title = [NSString stringWithFormat:@"{0,%ld}",(long)index+1];
        NSDictionary *dic = @{@"image": image, @"title":title};
        [self.dataMArr addObject:dic];
    }
    self.myConllection.delegate = self;
    self.myConllection.dataSource = self;
    

}
#pragma mark - Collection View Data Source
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataMArr.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *collectionCellID = @"myCollectionCell";
    collectionCell *cell = (collectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:collectionCellID forIndexPath:indexPath];
    
    NSDictionary *dic    = self.dataMArr[indexPath.row];
    UIImage *image       = dic[@"image"];
    NSString *title      = dic[@"title"];
    
    cell.imageView.image = image;
    cell.titleLabel.text = title;
    
    return cell;
};


@end
