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
- (CZWTableViewModel *)createModel:(CZWTableView *)tableView{
    //没有重写就会抛出异常
    @throw [NSException exceptionWithName:@"Must override this method"
                                   reason:[NSString stringWithFormat:@"Didn't override this method %s in subClass", __FUNCTION__]
                                 userInfo:nil];
    //eg.
    return [[CZWTableViewModel alloc]initWithData:nil];
}

- (Class)tableView:(CZWTableView *)tableView cellClassForObject:(CZWRowObj *)rowObj{
    //没有重写就会抛出异常
    @throw [NSException exceptionWithName:@"Must override this method"
                                   reason:[NSString stringWithFormat:@"Didn't override this method %s in subClass", __FUNCTION__]
                                 userInfo:nil];
    //eg.
    return [self class];
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
- (instancetype)initWithStyle:(UITableViewStyle)style tableView:(CZWTableView *)tableVIew{
    self = [self initWithStyle:style];
    if (self) {
        [self settingTableView:tableVIew];
    }
    return self;
}

- (void)settingTableView:(CZWTableView *)tableVIew{

    tableVIew.delegate = self;
    tableVIew.dataSource = self;
    
}

#pragma mark - Private

- (CZWTableViewModel *)getModelFromTableView:(CZWTableView *)tableView{
    return [self checkModelCache:tableView];
}

- (CZWSectionObj *)getSectionObjAtIndex:(NSInteger)section fromTableView:(CZWTableView *)tableView{
     CZWTableViewModel *model = [self checkModelCache:tableView];
    return [model sectionObjectAtIndex:section];
}

- (CZWRowObj *)getObjectAtIndewPath:(NSIndexPath *)indexPath fromTableView:(CZWTableView *)tableView{
    CZWTableViewModel *model = [self checkModelCache:tableView];
    return [model tableView:tableView objectForRowAtIndexPath:indexPath];
}


#pragma mark - Cache
/**
 *  model cache
 *  暂时不缓存:还没想到换乘方案
 */
- (CZWTableViewModel *)checkModelCache:(CZWTableView *)tableView{
//    if (!_model) {
//        _model = [self createModel:tableView];
//    }
//    return _model;
    return [self createModel:tableView];
}

/**
 *  obj Cell Class cache
 */
- (Class)checkObjCellClassCache:(CZWTableView *)tableView object:(CZWRowObj *)rowObj{
    if (!rowObj.cellClass) {
        rowObj.cellClass = [self tableView:tableView cellClassForObject:rowObj];
    }
    return rowObj.cellClass;
}



#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(CZWTableView *)tableView {
    CZWTableViewModel *model = [self getModelFromTableView:tableView];
    return model.sectionCount;
}

- (NSInteger)tableView:(CZWTableView *)tableView numberOfRowsInSection:(NSInteger)section {
    CZWSectionObj *secObj = [self getSectionObjAtIndex:section fromTableView:tableView];
    return secObj.rowArray.count;
}

- (UITableViewCell *)tableView:(CZWTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CZWRowObj *rowObj = [self getObjectAtIndewPath:indexPath fromTableView:tableView];
    Class cellClass = [self checkObjCellClassCache:tableView object:rowObj];
    NSString *cellName = [NSString stringWithFormat:@"%s",class_getName(cellClass)];
    if ([cellClass isSubclassOfClass:[CZWTableViewCell class]]) {
        CZWTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName forIndexPath:indexPath];
        return [cell settingData:rowObj];
    } else {
        NSLog(@"cell Class isn't inherit CZWTableViewCell : %s",__FUNCTION__);
        return nil;
    }
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(CZWTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CZWRowObj *rowObj = [self getObjectAtIndewPath:indexPath fromTableView:tableView];
    Class cellClass = [self checkObjCellClassCache:tableView object:rowObj];
    return [cellClass tableView:tableView checkCacheRowHeightForObject:rowObj];
}


@end
