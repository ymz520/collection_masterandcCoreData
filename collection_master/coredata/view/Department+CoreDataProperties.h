//
//  Department+CoreDataProperties.h
//  collection_master
//
//  Created by 张 荣桂 on 16/6/2.
//  Copyright © 2016年 芳仔小脚丫. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Department.h"

NS_ASSUME_NONNULL_BEGIN

@interface Department (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *departName;
@property (nullable, nonatomic, retain) NSNumber *departNum;
@property (nullable, nonatomic, retain) NSDate *departDate;

@end

NS_ASSUME_NONNULL_END
