//
//  ViewController.m
//  CZWTableView
//
//  Created by tianqu on 16/6/1.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "ViewController.h"
#import "CZWMapTableView.h"
#import "CZWSchool.h"
#import "CZWStudent.h"
#import "CZWTeather.h"
#import "CZWStudentCell.h"
#import "CZWTeatherCell.h"
#import "CZWSchoolCell.h"
@interface ViewController ()
@property (strong, nonatomic) CZWTableViewModel *firstModel;
@property (strong, nonatomic) CZWTableViewModel *secondModel;
@property (strong, nonatomic) CZWTableView *tableView;
@end

@implementation ViewController

- (CZWTableViewModel *)firstModel{
    if (!_firstModel) {
        NSMutableArray *array = [[NSMutableArray alloc]init];
        for (int i = 0; i<3; i++) {
            CZWSchool *array1 = [[CZWSchool alloc]init];
            array1.titleForHeader = [NSString stringWithFormat:@"第%d,titleForHeader",i];
            array1.titleForFooter = [NSString stringWithFormat:@"第%d,titleForFooter",i];
            array1.headerTitle = [NSString stringWithFormat:@"第%d",i];
            for (int j = 0; j<100; j++) {
                if (j<50) {
                    CZWStudent *stu1 = [[CZWStudent alloc]init];
                    stu1.name = [NSString stringWithFormat:@"张%d 行%d",j,i];
                    stu1.age = [NSNumber numberWithInt:j+10i];
                    stu1.imageName = @"37x-Checkmark";
                    [array1.rowArray addObject:stu1];
                } else{
                    CZWTeather *stu1 = [[CZWTeather alloc]init];
                    stu1.name = @"37x-Checkmark";
                    stu1.workNumber = [NSNumber numberWithInt:j+10i];
                    [array1.rowArray addObject:stu1];
                }
                
            }
            [array addObject:array1];
        }
        _firstModel = [[CZWTableViewModel alloc]initWithData:array];
    }
    return _firstModel;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"start");
    NSArray *array = @[NSStringFromClass([CZWStudentCell class]),NSStringFromClass([CZWTeatherCell class])];
    self.tableView = [[CZWMapTableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain registerCellNibNames:array delegate:self dataSource:self];
    self.tableView.tag = 1;
    [self.view addSubview:self.tableView];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:button];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.tableView.frame = self.view.bounds;
    [self addSwipeGestureRecognizer];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self removeSwipeGestureRecognizer];
}

- (CZWTableViewModel *)createModel:(CZWTableView *)tableView{
    NSLog(@"%s",__FUNCTION__);
    if (tableView.tag == 1) {
        return self.firstModel;
    } else if (tableView.tag == 2) {
        return self.secondModel;
    } else {
        return nil;
    }
}
- (void)czw_tableView:(CZWTableView *)tableView didSelectRowObj:(CZWRowObj *)obj atIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if ([obj isMemberOfClass:[CZWTeather class]]) {
        CZWTeather *teatherObj = (CZWTeather *)obj;
        teatherObj.workNumber = @2000;
        [obj updateCellStatus:^(CZWRowObj *rowObj) {
            rowObj.cellHeight = 100;
        }];
       
    }

}


- (void)click:(UIButton *)sender{
    self.tableView.allowsMultipleSelection =YES;
    self.tableView.editing = !self.tableView.editing;
    
}
@end
