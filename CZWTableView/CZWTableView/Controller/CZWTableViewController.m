//
//  CZWTableViewController.m
//  CZWTableView
//
//  Created by tianqu on 16/6/1.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "CZWTableViewController.h"
#import <objc/runtime.h>
@interface CZWTableViewController ()

@end

@implementation CZWTableViewController
#pragma mark - must override
- (CZWTableViewModel *)createModel:(UITableView *)tableView{
    //没有重写就会抛出异常
    @throw [NSException exceptionWithName:@"Cann't use this method"
                                   reason:@"You can only call this method in subclass"
                                 userInfo:nil];
    //eg.
    return [[CZWTableViewModel alloc]initWithData:nil];
}

#pragma mark - initialize

- (void)initSetting{
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initSetting];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
    if (self) {
        [self initSetting];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle: nibBundleOrNil];
    if (self) {
        [self initSetting];
    }
    return self;
}

#pragma mark - initialize Api
//初始化必须要tableView (原因：根据tableView区分model(逻辑由用户写))
- (instancetype)initWithStyle:(UITableViewStyle)style tableView:(CZWTableView *)tableVIew delegate:(id<CZWTableViewControllerDelegate>)delegate{
    self = [self initWithStyle:style];
    if (self) {
        [self settingTableView:tableVIew delegate:delegate];
    }
    return self;
}

- (void)settingTableView:(CZWTableView *)tableVIew delegate:(id<CZWTableViewControllerDelegate>)delegate{

    tableVIew.delegate = self;
    tableVIew.dataSource = self;
    self.controllerDelegate = delegate;
    
}





- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    CZWTableViewModel *model = [self createModel:tableView];
    return model.sectionCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    CZWSectionObj *secObj = [self.model sectionObjectAtIndex:section];
    return secObj.rowArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CZWRowObj *rowObj = [self.model tableView:tableView objectForRowAtIndexPath:indexPath];
    Class cellClass = [self.controllerDelegate tableView:tableView cellClassForObject:rowObj];
    NSString *cellName = [NSString stringWithFormat:@"%s",class_getName(cellClass)];
    if ([cellClass isSubclassOfClass:[CZWTableViewCell class]]) {
        return [[tableView dequeueReusableCellWithIdentifier:cellName] settingData:rowObj];
    } else {
        NSLog(@"cell Class isn't inherit CZWTableViewCell : %s",__FUNCTION__);
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


@end
