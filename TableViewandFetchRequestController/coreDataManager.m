//
//  coreDataManager.m
//  TableViewandFetchRequestController
//
//  Created by admin on 15/8/13.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "coreDataManager.h"


#define MOC [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext]

static NSString *personName = @"Person";


@implementation coreDataManager

#pragma mark 插入指定数据
+(void)insertNewPersonWithName:(NSString *)name age:(NSInteger)age
{
    @try {
        Person *person = [NSEntityDescription insertNewObjectForEntityForName:personName inManagedObjectContext:MOC];
        if (person!=nil) {
            person.name = name;
            person.age = @(age);
        }
        [MOC save:nil];
        NSLog(@"添加成功");
    }
    @catch (NSException *exception) {
        NSLog(@"%@",exception);
    }   
}

#pragma mark 用fetchedResultsController查询数据 完美匹配tableView

+(NSFetchedResultsController *)queryAllObjectsWithDelegate:(id<NSFetchedResultsControllerDelegate>)delegate
{
    NSFetchedResultsController *frc = nil;
    @try {
        NSFetchRequest *fr = [[NSFetchRequest alloc]init];
        NSEntityDescription *ent = [NSEntityDescription entityForName:personName inManagedObjectContext:MOC];
        [fr setEntity:ent];
        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:NO];
        [fr setSortDescriptors:@[sort]];
        
        //用fetchedResultsController返回数据
        frc = [[NSFetchedResultsController alloc]initWithFetchRequest:fr managedObjectContext:MOC sectionNameKeyPath:nil cacheName:nil];
        [frc setDelegate:delegate];
        //执行请求
        [frc performFetch:nil];
    }
    @catch (NSException *exception) {
        NSLog(@"%@",exception);
    }
    @finally {
         return frc;
    }
    
}
@end
