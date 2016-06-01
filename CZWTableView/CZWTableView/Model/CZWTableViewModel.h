//
//  CZWTableViewModel.h
//  CZWTableView
//
//  Created by tianqu on 16/6/1.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CZWSectionObj.h"
#import "CZWRowObj.h"
@interface CZWTableViewModel : NSObject

@property (assign, nonatomic, readonly) NSUInteger sectionCount;
@property (assign, nonatomic, readonly) NSUInteger objectCount;

- (instancetype)initWithData:(NSMutableArray<CZWSectionObj *>*)dataArray;

#pragma mark - 查询
/**
 *  section位置查询第一维数组
 */
- (CZWSectionObj *)sectionObjectAtIndex:(NSInteger)section;
/**
 *  indexPath查询第二维数组
 */
- (CZWRowObj *)tableView:(UITableView *)tableView objectForRowAtIndexPath:(NSIndexPath *)indexPath;
@end
