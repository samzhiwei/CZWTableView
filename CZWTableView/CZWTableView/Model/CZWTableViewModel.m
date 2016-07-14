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
/**
 *  必须是二维数组
 */
@property (strong, nonatomic) NSMutableArray<CZWSectionObj *>* dataArray;
@end

@implementation CZWTableViewModel
- (instancetype)initWithData:(NSMutableArray<CZWSectionObj *>*)dataArray{
    self = [super init];
    if (self) {
        self.dataArray = dataArray;
    }
    return self;
}

- (void)setDataArray:(NSMutableArray<CZWSectionObj *> *)dataArray{
    _dataArray = dataArray;
    NSUInteger count = 0;
    for (CZWSectionObj *secObj in dataArray) {
        if (secObj) {
            count += secObj.rowArray.count;
            for (CZWRowObj *rowObj in secObj.rowArray) {
                rowObj.delegate = self;//绑定更新信息反馈时候用
            }
        }
    }
    _sectionCount = dataArray.count;
    _objectCount = count;
    
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

- (void)exchangeObj:(CZWRowObj *)objOne obj:(CZWRowObj *)objTwo{
    NSIndexPath *one = [self indexPathOfRowObj:objOne];
    NSIndexPath *two = [self indexPathOfRowObj:objTwo];
    if (one.section == two.section) {
        CZWSectionObj *secOne = [self sectionObjectAtIndex:one.section];
        [secOne.rowArray exchangeObjectAtIndex:one.row withObjectAtIndex:two.row];
    } else {
        CZWSectionObj *secOne = [self sectionObjectAtIndex:one.section];
        CZWSectionObj *secTwo = [self sectionObjectAtIndex:two.section];
        [secOne.rowArray replaceObjectAtIndex:one.row withObject:objTwo];
        [secTwo.rowArray replaceObjectAtIndex:two.row withObject:objOne];
    }
}

- (void)exchangeIndexPath:(NSIndexPath *)indexPathOne toIndexPath:(NSIndexPath *)indexPathTwo{
    CZWRowObj *one = [self objectForRowAtIndexPath:indexPathOne];
    CZWRowObj *two = [self objectForRowAtIndexPath:indexPathTwo];
    [self exchangeObj:one obj:two];
}

- (NSIndexPath *)indexPathOfRowObj:(CZWRowObj *)obj{
    for (int i = 0; i < self.dataArray.count; i ++) {
        CZWSectionObj *secObj = self.dataArray[i];
        for (int j = 0; j < secObj.rowArray.count; j++) {
            CZWRowObj *rowObj = secObj.rowArray[j];
            if (obj == rowObj) {//地址相等
                return [NSIndexPath indexPathForRow:j inSection:i];
            }
        }
    }
    return nil;
}

- (void)updateModel:(CZWRowObj *)rowObj{
    NSIndexPath *indexPath = [self indexPathOfRowObj:rowObj];
    if (indexPath == nil) {
        NSLog(@"地址比对失败");
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:ntkModelUpdate object:nil userInfo:@{@"indexPath" : indexPath}];
}



@end
