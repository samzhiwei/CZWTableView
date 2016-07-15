//
//  CZWTableViewModel.h
//  CZWTableView
//
//  Created by tianqu on 16/6/1.
//  Copyright © 2016年 Tianqu. All rights reserved.
//
/**
 *  创建会强引用dataArray
 */
#import "CZWTableViewProtocol.h"
#import "CZWSectionObj.h"
#import "CZWRowObj.h"
@interface CZWTableViewModel : NSObject <CZWTableViewModelProtocol>
/**
 *  必须是二维数组
 */
@property (strong, nonatomic) NSMutableArray<CZWSectionObj *>* dataArray;
@property (copy, nonatomic, readonly) NSString *messageChannel;

- (instancetype)initWithData:(NSMutableArray<CZWSectionObj *>*)dataArray messageChannel:(NSString *)name;

/**
 *  自动计算方便调用
 */
@property (assign, nonatomic, readonly) NSUInteger sectionCount;
@property (assign, nonatomic, readonly) NSUInteger objectCount;



#pragma mark - 查询
/**
 *  section位置查询第一维数组
 */
- (CZWSectionObj *)sectionObjectAtIndex:(NSInteger)section;
/**
 *  indexPath查询第二维数组
 */
- (CZWRowObj *)objectForRowAtIndexPath:(NSIndexPath *)indexPath;

#pragma mark - 操作

- (void)moveObjAtIndexPath:(NSIndexPath *)indexPathOne toIndexPath:(NSIndexPath *)indexPathTwo;

- (void)deleteObjAtIndexPath:(NSIndexPath *)indexPath;

- (void)insertObj:(CZWRowObj *)insertRowObj AtIndexPath:(NSIndexPath *)indexPath;

- (void)replaceObjAtIndexPath:(NSIndexPath *)indexPath withObj:(CZWRowObj *)rowObj;


@end
