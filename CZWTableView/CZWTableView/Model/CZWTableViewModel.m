//
//  CZWTableViewModel.m
//  CZWTableView
//
//  Created by tianqu on 16/6/1.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "CZWTableViewModel.h"

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
    NSUInteger count = 0;
    for (CZWSectionObj *secObj in _dataArray) {
        if (secObj) {
            count += secObj.rowArray.count;
        }
    }
    _sectionCount = dataArray.count;
    _objectCount = count;
    
}

#pragma mark - 查询

- (CZWSectionObj *)sectionObjectAtIndex:(NSInteger)section{
    if (self.dataArray && self.dataArray.count > section) {
        return self.dataArray[section];
    } else {
        NSLog(@"check model.dataArray:%s",__FUNCTION__);
        return nil;
    }
    
}

- (CZWRowObj *)tableView:(UITableView *)tableView objectForRowAtIndexPath:(NSIndexPath *)indexPath {
    //暂时没用到tableView
    if (self.dataArray.count > indexPath.section) {
        CZWSectionObj *sectionObj = [self.dataArray objectAtIndex:indexPath.section];
        if (sectionObj.rowArray.count > indexPath.row) {
            return [sectionObj.rowArray objectAtIndex:indexPath.row];
        }
    }
    NSLog(@"check model.dataArray:%s",__FUNCTION__);;
    return nil;
}

@end
