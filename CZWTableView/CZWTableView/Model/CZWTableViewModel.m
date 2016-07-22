//
//  CZWTableViewModel.m
//  CZWTableView
//
//  Created by tianqu on 16/6/1.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "CZWTableViewModel.h"
#import <objc/runtime.h>
@interface CZWTableViewModel ()

@end

@implementation CZWTableViewModel
@synthesize sectionCount = _sectionCount;
@synthesize objectCount = _objectCount;
//@synthesize messageChannel = _messageChannel;
- (instancetype)initWithData:(NSMutableArray<CZWSectionObj *>*)dataArray{
    self = [super init];
    if (self) {
        self.dataArray = dataArray;
        //_messageChannel = name;
    }
    return self;
}

- (void)setDataArray:(NSMutableArray<CZWSectionObj *> *)dataArray{
    _dataArray = dataArray;
    NSUInteger count = 0;
    for (CZWSectionObj *secObj in dataArray) {
        if (secObj) {
            count += secObj.rowArray.count;
        }
    }
    _sectionCount = dataArray.count;
    _objectCount = count;
}

- (NSUInteger)sectionCount{
    return _dataArray.count;
}

- (NSUInteger)objectCount{
    NSUInteger count = 0;
    for (CZWSectionObj *secObj in _dataArray) {
        if (secObj) {
            count += secObj.rowArray.count;
        }
    }
    return count;
}

#pragma mark - 查询

- (CZWSectionObj *)sectionObjectAtIndex:(NSInteger)section{
    if (self.dataArray.count > section) {
        return self.dataArray[section];
    } else {
        NSLog(@"check model.dataArray:%s",__FUNCTION__);
        return nil;
    }
    
}

- (CZWRowObj *)objectForRowAtIndexPath:(NSIndexPath *)indexPath {
    //暂时没用到tableView
    if (self.dataArray.count > indexPath.section) {
        CZWSectionObj *sectionObj = [self.dataArray objectAtIndex:indexPath.section];
        if (sectionObj.rowArray.count > indexPath.row) {
            CZWRowObj *rowObj = [sectionObj.rowArray objectAtIndex:indexPath.row];
            return rowObj;
        }
    }
    NSLog(@"check model.dataArray:%s",__FUNCTION__);;
    return nil;
}

- (CZWRowObj *)firstObjectInSection:(NSInteger)section{
    CZWSectionObj *sectionObj = [self.dataArray objectAtIndex:section];
    return sectionObj.rowArray.firstObject;
}

- (CZWRowObj *)lastObjectInSection:(NSInteger)section{
    CZWSectionObj *sectionObj = [self.dataArray objectAtIndex:section];
    return sectionObj.rowArray.lastObject;
}

#pragma mark - 遍历
- (void)enumerateRowObjectsInSection:(NSUInteger)section usingBlock:(BOOL (^)(id obj, NSIndexPath *indexPath))block{
    CZWSectionObj *secObj = [self sectionObjectAtIndex:section];
    for (NSUInteger j = 0; j < secObj.rowArrayCount; j ++) {
        CZWRowObj *rowObj = [secObj.rowArray objectAtIndex:j];
        BOOL stop = block(rowObj,[NSIndexPath indexPathForRow:j inSection:section]);
        if (stop) {
            return;
        }
    }
}

- (void)enumerateRowObjectsUsingBlock:(BOOL (^)(id obj, NSIndexPath *indexPath))block{
    for (NSUInteger i = 0; i < self.sectionCount; i ++) {
        [self enumerateRowObjectsInSection:i usingBlock:^BOOL(id obj, NSIndexPath *indexPath) {
            return block(obj,indexPath);
        }];
    }
}

- (void)enumerateSectionObjectsUsingBlock:(BOOL (^)(id obj, NSUInteger section))block{
    for (NSUInteger i = 0; i < self.sectionCount ; i ++) {
        CZWSectionObj *secObj = [self sectionObjectAtIndex:i];
        BOOL stop = block(secObj,i);
        if (stop) {
            return;
        }
    }
}

- (NSInteger)sectionOfSectionObj:(CZWSectionObj *)obj{
    for (NSInteger i = 0; i < self.dataArray.count; i++) {
        CZWSectionObj *secObj = self.dataArray[i];
        if (obj == secObj) { //地址相等
            return i;
        }
    }
    //无法判空
    return 0;
}

- (NSIndexPath *)indexPathOfRowObj:(CZWRowObj *)obj{
    for (NSInteger i = 0; i < self.dataArray.count; i ++) {
        CZWSectionObj *secObj = self.dataArray[i];
        for (NSInteger j = 0; j < secObj.rowArray.count; j++) {
            CZWRowObj *rowObj = secObj.rowArray[j];
            if (obj == rowObj) {//地址相等
                return [NSIndexPath indexPathForRow:j inSection:i];
            }
        }
    }
    return nil;
}

#pragma mark - 操作

- (void)moveObjAtIndexPath:(NSIndexPath *)indexPathOne toIndexPath:(NSIndexPath *)indexPathTwo{
    CZWRowObj *one = [self objectForRowAtIndexPath:indexPathOne];
    CZWSectionObj *insertSecObj = [self sectionObjectAtIndex:indexPathTwo.section];
    CZWSectionObj *removeSecObj = [self sectionObjectAtIndex:indexPathOne.section];
    [removeSecObj.rowArray removeObject:one];
    [insertSecObj.rowArray insertObject:one atIndex:indexPathTwo.row];
    
}

- (void)deleteObjAtIndexPath:(NSIndexPath *)indexPath{
    CZWSectionObj *removeSecObj = [self sectionObjectAtIndex:indexPath.section];
    [removeSecObj.rowArray removeObjectAtIndex:indexPath.row];
}

- (void)insertObj:(CZWRowObj *)insertRowObj AtIndexPath:(NSIndexPath *)indexPath{
    CZWSectionObj *insertSecObj = [self sectionObjectAtIndex:indexPath.section];
    [insertSecObj.rowArray insertObject:insertRowObj atIndex:indexPath.row];
}

- (void)replaceObjAtIndexPath:(NSIndexPath *)indexPath withObj:(CZWRowObj *)rowObj{
    CZWSectionObj *secObj = [self sectionObjectAtIndex:indexPath.section];
    [secObj.rowArray replaceObjectAtIndex:indexPath.row withObject:rowObj];
}

- (void)updateRowObjAtIndexPath:(NSIndexPath *)indexPath handler:(void (^)(CZWRowObj *rowObj))handler{
    CZWRowObj *rowObj = [self objectForRowAtIndexPath:indexPath];
    handler(rowObj);
}



@end
