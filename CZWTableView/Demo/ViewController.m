//
//  ViewController.m
//  CZWTableView
//
//  Created by tianqu on 16/6/1.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "ViewController.h"
#import "CZWTableViewController.h"
@interface ViewController ()
@property (strong, nonatomic) CZWTableViewController *tableViewController;
@end

@implementation ViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        _tableViewController = [[CZWTableViewController alloc]init];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (int i = 0; i<3; i++) {
        NSMutableArray *array1 = [[NSMutableArray alloc]init];
        for (int j = 0; j<100; j++) {
            NSString *stu1 = [[NSString alloc]init];
            stu1 = [NSString stringWithFormat:@"张%d 行%d",j,i];
            [array1 addObject:stu1];
        }
        [array addObject:array1];
    }
    _tableViewController.tableView = [[CZWTableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain registerCellNibParam:nil];
    _tableViewController.model = [[CZWTableViewModel alloc]initWithData:array];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
