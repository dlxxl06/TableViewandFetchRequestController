//
//  coreDataManager.h
//  TableViewandFetchRequestController
//
//  Created by admin on 15/8/13.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "Person.h"


@interface coreDataManager : NSObject
+(void)insertNewPersonWithName :(NSString *)name age:(NSInteger)age;
+(NSFetchedResultsController *) queryAllObjectsWithDelegate:(id<NSFetchedResultsControllerDelegate>)delegate;
@end
