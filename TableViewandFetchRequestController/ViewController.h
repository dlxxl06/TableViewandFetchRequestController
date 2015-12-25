//
//  ViewController.h
//  TableViewandFetchRequestController
//
//  Created by admin on 15/8/13.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterViewController.h"
#import "coreDataManager.h"

@interface ViewController : UITableViewController<NSFetchedResultsControllerDelegate>
- (IBAction)registerBtn:(id)sender;


@end

