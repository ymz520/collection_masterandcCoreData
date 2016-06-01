//
//  ViewController.h
//  collection_master
//
//  Created by xiaoliangwang on 14-6-27.
//  Copyright (c) 2014年 芳仔小脚丫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>


@property (strong, nonatomic)NSMutableArray *dataMArr;
@property (weak, nonatomic) IBOutlet UICollectionView *myConllection;


@end
