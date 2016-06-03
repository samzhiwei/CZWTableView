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
/**
 *  子类必须重写，controller必须自己强持有model和view;
 *  执行一次后CZWTableView会弱持有自己的model;只有!model 时会重新调用询问
 */
- (CZWTableViewModel * __nonnull)createModel:(CZWTableView *)tableView{
    //没有重写就会抛出异常
    @throw [NSException exceptionWithName:@"Must override this method"
                                   reason:[NSString stringWithFormat:@"Didn't override this method %s in subClass", __FUNCTION__]
                                 userInfo:nil];
    //eg.
    return [[CZWTableViewModel alloc]initWithData:nil];
}

/**
 *  如果不重写这个方法就要按照
 *   "obj类名后加Cell为Cell的类名" 的命名规则命名
 */
- (Class __nonnull)tableView:(CZWTableView *)tableView cellClassForObject:(CZWRowObj *)rowObj{
    
    Class rowObjClass = [rowObj class];
    NSString *rowObjClassStr = NSStringFromClass(rowObjClass);
    NSString *cellClassStr = [rowObjClassStr stringByAppendingString:@"Cell"];
    
    //eg.
    return NSClassFromString(cellClassStr);
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
//初始化必须tableView (原因：根据tableView区分model(逻辑由用户写))
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
 */
- (CZWTableViewModel *)checkModelCache:(CZWTableView *)tableView{
    if (!tableView.model) {
        tableView.model = [self createModel:tableView];
    }
    return tableView.model;
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
    if ([cellClass conformsToProtocol:@protocol(CZWTableViewCellProtocol)]) {
        return [[tableView dequeueReusableCellWithIdentifier:cellName forIndexPath:indexPath] settingData:rowObj];
    } else {
        NSLog(@"cell Class didn't conforms To Protocol CZWTableViewCellProtocol : %s",__FUNCTION__);
        return nil;
    }
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(CZWTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CZWRowObj *rowObj = [self getObjectAtIndewPath:indexPath fromTableView:tableView];
    
    return [self tableView:tableView checkCacheRowHeightForObject:rowObj];
}



#pragma mark - cache
- (CGFloat)tableView:(CZWTableView *)tableView checkCacheRowHeightForObject:(CZWRowObj *)rowObj{
    if (rowObj.cellHeight == CellNeedRecountHeight) {
        Class cellClass = [self checkObjCellClassCache:tableView object:rowObj];
        CGFloat cellHeight = [cellClass tableView:tableView rowHeightForObject:rowObj];
        rowObj.cellHeight = cellHeight;//缓存
    }
    return rowObj.cellHeight;
}


@end
