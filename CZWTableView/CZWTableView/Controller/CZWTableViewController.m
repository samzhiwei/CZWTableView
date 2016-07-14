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
 *  子类必须重写，子类必须自己强持有model和view;有子类自己控制model和view的生命周期
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

#pragma mark - optional override

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

/**
 *  可以重写这些获得obj,也可以重写UITableViewDelegate的获得IndexPath
 */
//UITableViewDataSource
- (BOOL)czw_tableView:(CZWTableView *)tableView canEditRowObj:(CZWRowObj *)obj{
    return YES;
}
- (BOOL)czw_tableView:(CZWTableView *)tableView canMoveRowObj:(CZWRowObj *)obj{
    return YES;
}
//UITableViewDelegate
- (void)czw_tableView:(CZWTableView *)tableView didSelectRowObj:(CZWRowObj *)obj atIndexPath:(NSIndexPath *)indexPath{}
- (void)czw_tableView:(CZWTableView *)tableView didDeselectRowObj:(CZWRowObj *)rowObj atIndexPath:(NSIndexPath *)indexPath{}
- (CGFloat)czw_tableView:(CZWTableView *)tableView heightForHeaderInSectionObj:(CZWSectionObj *)secObj{
    return 0;
}
- (CGFloat)czw_tableView:(CZWTableView *)tableView heightForFooterInSectionObj:(CZWSectionObj *)secObj{
    return 0;
}
- (nullable UIView *)czw_tableView:(CZWTableView *)tableView viewForHeaderInSectionObj:(CZWSectionObj *)secObj{
    return nil;
}

- (nullable UIView *)czw_tableView:(CZWTableView *)tableView viewForFooterInSectionObj:(CZWSectionObj *)secObj{
    return nil;
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

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle: nibBundleOrNil];
    if (self) {
        [self initSetting];
    }
    return self;
}

#pragma mark - initialize Api
//初始化必须tableView (原因：根据tableView区分model(逻辑由子类写))
- (instancetype)initWithTableView:(CZWTableView *)tableVIew{
    self = [self init];
    if (self) {
        [self settingTableView:tableVIew];
    }
    return self;
}

- (void)settingTableView:(CZWTableView *)tableVIew{
    
    tableVIew.delegate = self;
    tableVIew.dataSource = self;
    
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
        id <CZWTableViewCellProtocol> cell = [tableView dequeueReusableCellWithIdentifier:cellName forIndexPath:indexPath];
        [self cellSetting:(UITableViewCell *)cell];
        return [cell settingData:rowObj];
    } else {
        NSLog(@"cell Class didn't conforms To Protocol CZWTableViewCellProtocol : %s",__FUNCTION__);
        return nil;
    }
}

/**
 *  cell初始化设置
 */
- (void)cellSetting:(UITableViewCell *)cell{
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
}

#pragma 以下的可以重写原生也可以重写自定义czw_开头的
- (BOOL)tableView:(CZWTableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self tableView:tableView checkCanEditRowAtIndexPath:indexPath];
}

- (BOOL)tableView:(CZWTableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self tableView:tableView checkCanMoveRowAtIndexPath:indexPath];
}

- (void)tableView:(CZWTableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (editingStyle) {
        case UITableViewCellEditingStyleNone:
            break;
        case UITableViewCellEditingStyleDelete:{
            
        }
            break;
        case UITableViewCellEditingStyleInsert:
            break;
    }
}


- (void)tableView:(CZWTableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    CZWTableViewModel *model = [self getModelFromTableView:tableView];
    [model exchangeIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
}
#pragma 不重写就自动按照设置创建
- (NSString *)tableView:(CZWTableView *)tableView titleForHeaderInSection:(NSInteger)section {
    CZWSectionObj *secObj = [self getSectionObjAtIndex:section fromTableView:tableView];
    return secObj.titleForHeader;
}

- (NSString *)tableView:(CZWTableView *)tableView titleForFooterInSection:(NSInteger)section {
    CZWSectionObj *secObj = [self getSectionObjAtIndex:section fromTableView:tableView];
    return secObj.titleForFooter;
}

#pragma mark - UITableViewDelegate
/**
 *  can't be override
 *  如果被重写 cell的自我计算高度就会失效
 */
- (CGFloat)tableView:(CZWTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CZWRowObj *rowObj = [self getObjectAtIndewPath:indexPath fromTableView:tableView];
    CGFloat height = [self tableView:tableView checkCacheRowHeightForObject:rowObj];
    return height;
}

#pragma 以下的可以重写原生也可以重写自定义czw_开头的
- (CGFloat)tableView:(CZWTableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CZWSectionObj *secObj = [self getSectionObjAtIndex:section fromTableView:tableView];
    return [self czw_tableView:tableView heightForHeaderInSectionObj:secObj];
}

- (CGFloat)tableView:(CZWTableView *)tableView heightForFooterInSection:(NSInteger)section{
    CZWSectionObj *secObj = [self getSectionObjAtIndex:section fromTableView:tableView];
    return [self czw_tableView:tableView heightForFooterInSectionObj:secObj];
}

- (nullable UIView *)tableView:(CZWTableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CZWSectionObj *secObj = [self getSectionObjAtIndex:section fromTableView:tableView];
    return [self czw_tableView:tableView viewForHeaderInSectionObj:secObj];
}

- (nullable UIView *)tableView:(CZWTableView *)tableView viewForFooterInSection:(NSInteger)section{
    CZWSectionObj *secObj = [self getSectionObjAtIndex:section fromTableView:tableView];
    return [self czw_tableView:tableView viewForFooterInSectionObj:secObj];
}

- (void)tableView:(CZWTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CZWRowObj *rowObj = [self getObjectAtIndewPath:indexPath fromTableView:tableView];
    [self czw_tableView:tableView didSelectRowObj:rowObj atIndexPath:indexPath];
}

- (void)tableView:(CZWTableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    CZWRowObj *rowObj = [self getObjectAtIndewPath:indexPath fromTableView:tableView];
    [self czw_tableView:tableView didDeselectRowObj:rowObj atIndexPath:indexPath];
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
    return [model objectForRowAtIndexPath:indexPath];
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
/**
 *  Cell Height cache
 */
- (CGFloat)tableView:(CZWTableView *)tableView checkCacheRowHeightForObject:(CZWRowObj *)rowObj{
    CGFloat height = 0.0;

    if (rowObj.cellHeight == CellNeedRecountHeight) {    //通过cell自己计算返回高度
        Class cellClass = [self checkObjCellClassCache:tableView object:rowObj];
        CGFloat cellHeight = [cellClass tableView:tableView rowHeightForObject:rowObj];
        rowObj.cellHeight = cellHeight;
        height = rowObj.cellHeight;
        return height;
    }
    if (rowObj.usePriorityCellHeight) {//主动修改
        height = rowObj.cellHeight;
        rowObj.usePriorityCellHeight = NO;
        return height;
    }
    
    return rowObj.cellHeight;
}
/**
 *  Cell canEdit cache
 */
- (BOOL)tableView:(CZWTableView *)tableView checkCanEditRowAtIndexPath:(NSIndexPath *)indexPath{
    CZWRowObj * rowObj = [self getObjectAtIndewPath:indexPath fromTableView:tableView];
    if (rowObj.usePriorityEditStatus) {//主动修改时
        rowObj.usePriorityEditStatus = NO;
        return rowObj.canEdit;
    }
    switch (rowObj.canEdit) {//默认修改时
        case CZWRowObjEditStatusNeedRecount:{
            BOOL canEdit = [self czw_tableView:tableView canEditRowObj:rowObj];
            if (canEdit) {
                rowObj.canEdit = CZWRowObjEditStatusCanEdit;
                return YES;
            } else {
                rowObj.canEdit = CZWRowObjEditStatusNotEdit;
                return NO;
            }
            break;
        }
        case CZWRowObjEditStatusCanEdit:
            return YES;
            break;
        case CZWRowObjEditStatusNotEdit:
            return NO;
            break;
    }
}
/**
 *  Cell canMove cache
 */
- (BOOL)tableView:(CZWTableView *)tableView checkCanMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    CZWRowObj * rowObj = [self getObjectAtIndewPath:indexPath fromTableView:tableView];
    if (rowObj.usePriorityMoveStatus) {//主动修改时
        rowObj.usePriorityMoveStatus = NO;
        return rowObj.canMove;
    }
    
    switch (rowObj.canMove) {//默认修改时
        case CZWRowObjMoveStatusNeedRecount:{
            BOOL canMove = [self czw_tableView:tableView canMoveRowObj:rowObj];
            if (canMove) {
                rowObj.canMove = CZWRowObjMoveStatusCanMove;
                return YES;
            } else {
                rowObj.canMove = CZWRowObjMoveStatusNotMove;
                return NO;
            }
            break;
        }
        case CZWRowObjMoveStatusCanMove:
            return YES;
            break;
        case CZWRowObjMoveStatusNotMove:
            return NO;
            break;
    }
}


@end
