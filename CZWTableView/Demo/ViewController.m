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
#import "CZWStudentCell.h"
#import "CZWTeatherCell.h"
@interface ViewController ()
@property (strong, nonatomic) CZWTableViewModel *firstModel;
@property (strong, nonatomic) CZWTableViewModel *secondModel;
@end

@implementation ViewController

- (CZWTableViewModel *)firstModel{
    if (!_firstModel) {
        NSMutableArray *array = [[NSMutableArray alloc]init];
        for (int i = 0; i<3; i++) {
            CZWSchool *array1 = [[CZWSchool alloc]init];
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

- (Class)tableView:(CZWTableView *)tableView cellClassForObject:(CZWRowObj *)rowObj{
    if ([rowObj isKindOfClass:[CZWStudent class]]) {
        return [CZWStudentCell class];
    } else if ([rowObj isKindOfClass:[CZWTeather class]]){
        return [CZWTeatherCell class];
    }else {
        return NULL;
    }
}


- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"start");
    NSString *key = NSStringFromClass([CZWStudentCell class]);
    UINib *nib = [UINib nibWithNibName:key bundle:nil];
    NSString *key1 = NSStringFromClass([CZWTeatherCell class]);
    UINib *nib1 = [UINib nibWithNibName:key1 bundle:nil];
    NSDictionary *dic = @{key:nib,key1:nib1};
    self.tableView = [[CZWMapTableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain registerCellNibParam:dic delegate:self dataSource:self];
    self.tableView.tag = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //CZWTableViewModel *model = self.model;

}
@end
