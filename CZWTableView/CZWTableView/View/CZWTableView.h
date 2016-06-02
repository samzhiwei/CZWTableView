//
//  CZWTableView.h
//  CZWTableView
//
//  Created by tianqu on 16/6/1.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

/**
 *  创建2步：
 *  1.注册所有需要用到的cell(暂时只能通过nib注册)
 *  2.设置delegate
 *  3.设置dataSource
 */

#import <UIKit/UIKit.h>
#import "CZWTableViewCell.h"
@interface CZWTableView : UITableView

/**
 *  约束创建
 */
- (instancetype)initWithRegisterCellNibParam:(NSDictionary *)param;
- (instancetype)initWithRegisterCellNibParam:(NSDictionary *)param delegate:(id<UITableViewDelegate>)delegate dataSource:(id<UITableViewDataSource>)dataSource;

/**
 *  frame创建
 */
- (instancetype)initWithFrame:(CGRect)frame registerCellNibParam:(NSDictionary *)param;
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style  registerCellNibParam:(NSDictionary *)param;
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style registerCellNibParam:(NSDictionary *)param delegate:(id<UITableViewDelegate>)delegate dataSource:(id<UITableViewDataSource>)dataSource;
/**
 *  注册cell
 *  Param : key(cell名) : value:(cell Nib)
 *  默认重用符为cellClass的名字;
 *  后续支持class注册
 */
- (void)registerCellParam:(NSDictionary *)param;
@end
