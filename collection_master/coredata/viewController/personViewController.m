//
//  personViewController.m
//  collection_master
//
//  Created by 张 荣桂 on 16/6/1.
//  Copyright © 2016年 芳仔小脚丫. All rights reserved.
//

#import "personViewController.h"
#import <CoreData/CoreData.h>
#import "Person.h"
#import "Department.h"
@interface personViewController ()

@property(strong,nonatomic)NSManagedObjectContext *contexts;
@end

@implementation personViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createContext];
}
#pragma mark_创见上下文关联模型生产数据酷
-(void)createContext
{
    //1.创建上下文
    NSManagedObjectContext *context=[[NSManagedObjectContext alloc]init];
    //2.关联模型文件
    //3.persistentStoreCoordinator持久化存储协调员
    //
    //
    //    NSManagedObjectModel *model=[[NSManagedObjectModel alloc]initWithContentsOfURL:@""]
    NSManagedObjectModel *model=[NSManagedObjectModel mergedModelFromBundles:nil];
    NSPersistentStoreCoordinator *store=[[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:model];
    NSError *error=nil;
    //获取document目录（沙盒）
    NSString *doc=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    //数据库保存路径
    NSString *documentpath=[doc stringByAppendingString:@"company.sqlite"];
    NSLog(@"%@",documentpath);
    //    存储数据库名称（fileURLWithPath保存到本地）
    [store addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[NSURL fileURLWithPath:documentpath] options:nil error:&error];
    context.persistentStoreCoordinator=store;
    self.contexts=context;
}
#pragma mark-添加数据
- (IBAction)add:(UIButton *)sender
{
    
//    Person *p1=[NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:self.contexts];
//    int ages=[self.tage.text intValue];
//    float heights=[self.theight.text floatValue];
//    p1.name=self.tname.text;
//    p1.age=@(ages);
//    p1.height=@(heights);
//    NSError *error=nil;
//    [self.contexts save:&error];
//    if (!error) {
//        NSLog(@"success");
//    }else
//    {
//        NSLog(@"%@",error);
//
//    
//    }
    
    //向两张表插入数据
    Person *p1=[NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:self.contexts];
    int ages=[self.tage.text intValue];
        float heights=[self.theight.text floatValue];
        p1.name=self.tname.text;
        p1.age=@(ages);
        p1.height=@(heights);
    Department *de1=[NSEntityDescription insertNewObjectForEntityForName:@"Department" inManagedObjectContext:self.contexts];
    int numid=[self.num.text intValue];
    NSDate *dates=(NSDate *)self.date.text;
    de1.departName=self.dename.text;
    de1.departNum=@(numid);
    de1.departDate=[NSDate date];
    p1.depart=de1;
    //
    [self.contexts save:nil];
}
#pragma mark-修改
- (IBAction)update:(UIButton *)sender
{
    
}
#pragma mark-删除
- (IBAction)deleteDatas:(id)sender
{
    //
    //1.查找到你要删除的航
    NSFetchRequest *request=[NSFetchRequest fetchRequestWithEntityName:@"Person"];
    //过滤查询
    NSPredicate *predicates=[NSPredicate predicateWithFormat:@"name=%@",@"the"];
    request.predicate=predicates;
    //2.删除
    NSArray * ar=[self.contexts executeFetchRequest:request error:nil];
    for (Person *p in ar)
    {
        [self.contexts deleteObject:p];
    }
    //3.同步上下文context
    [self.contexts save:nil];
}

#pragma mark-查询
- (IBAction)select:(id)sender
{
//    //创建请求对象（填入要查询到的表名（实体类））
//    NSFetchRequest *requests=[NSFetchRequest fetchRequestWithEntityName:@"Person"];
    NSError *error=nil;
//    //
//    //过滤查询predicate(谓词)
//    NSPredicate *pre=[NSPredicate predicateWithFormat:@"name=%@",@"the"];
////    requests.predicate=pre;
//    //排序
//    //创建排序对象
//    NSSortDescriptor *sort=[NSSortDescriptor sortDescriptorWithKey:@"age" ascending:YES];
//    requests.sortDescriptors=@[sort];
//    //分页查询（9）每页显示3条limit(限制)，fetch（获取）
//    requests.fetchLimit=3;
//    requests.fetchOffset=3;
//    requests.fetchBatchSize//获取批量大小
    //查找a部门的员工
    NSFetchRequest *requests=[NSFetchRequest fetchRequestWithEntityName:@"Person"];
    NSPredicate *predicates=[NSPredicate predicateWithFormat:@"depart.departName=%@",self.dename.text];
    requests.predicate=predicates;
    
     NSArray *ar=[self.contexts executeFetchRequest:requests error:&error];
    if (!error) {
//        NSLog(@"%@",ar);
        for (Person *p in ar) {
            NSLog(@"%@ %@",p.name,p.depart.departName);
        }
    }else
    {
        NSLog(@"%@",error);
    }
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.dename resignFirstResponder];
    [self.num resignFirstResponder];
}
@end
