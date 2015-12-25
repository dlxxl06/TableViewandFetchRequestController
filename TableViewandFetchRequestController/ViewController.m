//
//  ViewController.m
//  TableViewandFetchRequestController
//
//  Created by admin on 15/8/13.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
{
    NSFetchedResultsController *_frc;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _frc = [coreDataManager queryAllObjectsWithDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)registerBtn:(id)sender {
    
    RegisterViewController *RVC = [[RegisterViewController alloc]init];
    [self.navigationController pushViewController:RVC animated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_frc.fetchedObjects count];

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    
    Person *p = [_frc objectAtIndexPath:indexPath];
    [cell.textLabel setText:p.name];
    [cell.detailTextLabel setText:[p.age stringValue]];
    return cell;
}

-(void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView reloadData];

}
@end
