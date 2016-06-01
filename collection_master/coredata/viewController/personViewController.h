//
//  personViewController.h
//  collection_master
//
//  Created by 张 荣桂 on 16/6/1.
//  Copyright © 2016年 芳仔小脚丫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface personViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *tname;
@property (weak, nonatomic) IBOutlet UITextField *tage;
@property (weak, nonatomic) IBOutlet UITextField *theight;

- (IBAction)add:(UIButton *)sender;
- (IBAction)update:(UIButton *)sender;
- (IBAction)deleteDatas:(id)sender;

- (IBAction)select:(id)sender;

@end
