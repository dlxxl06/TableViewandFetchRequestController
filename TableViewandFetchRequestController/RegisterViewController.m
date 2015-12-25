//
//  RegisterViewController.m
//  TableViewandFetchRequestController
//
//  Created by admin on 15/8/13.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "RegisterViewController.h"
#import "coreDataManager.h"


@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(didFinished)];
    
    [self.navigationItem setRightBarButtonItem:rightBtn animated:YES];
}
-(void)didFinished
{
    [coreDataManager insertNewPersonWithName:_nameTextField.text age:[_ageTextField.text integerValue]];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
