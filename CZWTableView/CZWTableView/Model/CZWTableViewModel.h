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
#import <Foundation/Foundation.h>
#import "CZWSectionObj.h"
#import "CZWRowObj.h"
@interface CZWTableViewModel : NSObject
/**
 *  必须是二维数组
 */
@property (strong, nonatomic) NSMutableArray<CZWSectionObj *>* dataArray;
//@property (copy, nonatomic, readonly) NSString *messageChannel;

- (instancetype)initWithData:(NSMutableArray<CZWSectionObj *>*)dataArray;

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

- (CZWRowObj *)firstObjectInSection:(NSInteger)section;

- (CZWRowObj *)lastObjectInSection:(NSInteger)section;

- (NSIndexPath *)indexPathOfRowObj:(CZWRowObj *)obj;

- (NSInteger)sectionOfSectionObj:(CZWSectionObj *)obj;
#pragma mark - 遍历
- (void)enumerateRowObjectsInSection:(NSUInteger)section usingBlock:(BOOL (^)(id obj, NSIndexPath *indexPath))block;

- (void)enumerateRowObjectsUsingBlock:(BOOL (^)(id obj, NSIndexPath *indexPath))block;

- (void)enumerateSectionObjectsUsingBlock:(BOOL (^)(id obj, NSUInteger section))block;

#pragma mark - 操作

- (void)moveObjAtIndexPath:(NSIndexPath *)indexPathOne toIndexPath:(NSIndexPath *)indexPathTwo;

- (void)deleteObjAtIndexPath:(NSIndexPath *)indexPath;

- (void)insertObj:(CZWRowObj *)insertRowObj AtIndexPath:(NSIndexPath *)indexPath;

- (void)replaceObjAtIndexPath:(NSIndexPath *)indexPath withObj:(CZWRowObj *)rowObj;

- (void)updateRowObjAtIndexPath:(NSIndexPath *)indexPath handler:(void (^)(CZWRowObj *rowObj))handler;


@end
