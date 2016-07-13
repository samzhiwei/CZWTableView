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
 *  PS.如果sectionObj有对应的自定义View。系统的header和footer会默认不显示,sectionObj的titleForHeader和titleForFooter会失效。
 */

#import "CZWTableViewProtocol.h"



@interface CZWTableView : UITableView
@property (weak, nonatomic) id <CZWTableViewModelProtocol> model;
/**
 *  约束创建
 */
- (instancetype)initWithRegisterCellClasses:(NSArray <Class>*)classes delegate:(id<UITableViewDelegate>)delegate dataSource:(id<UITableViewDataSource>)dataSource;

/**
 *  frame创建
 */
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style registerCellClasses:(NSArray <Class>*)classes delegate:(id<UITableViewDelegate>)delegate dataSource:(id<UITableViewDataSource>)dataSource;
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style registerCellNibNames:(NSArray <NSString *>*)nibNames delegate:(id<UITableViewDelegate>)delegate dataSource:(id<UITableViewDataSource>)dataSource;
/**
 *  注册cell
 *  classes:传需要注册的cellClass
 *  默认重用符为cellClass的名字;
 *  后续支持class注册
 */

- (void)registerCellClasses:(NSArray <Class>*)classes;
- (void)registerCellNibs:(NSArray <NSString *>*)nibNames;
/**
 *  刷新对应的obj;
 */
- (void)refreshRowObjIndexPath:(NSIndexPath *)indexPath;


@end
