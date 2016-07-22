//
//  CZWTableViewController.h
//  CZWTableView
//
//  Created by tianqu on 16/6/1.
//  Copyright © 2016年 Tianqu. All rights reserved.
//  version1.5 by 2016/7/20

/**
 *  ps.
 *  1.继承CZWTableViewController
 *  2.重写- (CZWTableViewModel *)createModel:(CZWTableView *)tableView;绑定model和tableView
 *  3.CZWTableViewModel数据按形式继承CZWSectionObj,CZWRowObj类;建立二维数组
 *  4.创建tableView时绑定相应的cell
 *  5.cell视图准守CZWTableViewCellProtocol协议
 */
#import <UIKit/UIKit.h>
#import "CZWBaseViewController.h"
#import "CZWTableView.h"
#import "CZWTableViewModel.h"

@interface CZWTableViewController : CZWBaseViewController <UITableViewDataSource,UITableViewDelegate,CZWSectionHeaderDelegate,CZWSectionFooterDelegate,CZWCellDelegate>
/**
 *  自动绑定tableView的delegate和dataSource
 */
- (instancetype)initWithTableView:(CZWTableView *)tableVIew;




#pragma mark - must override
/**
 *  子类必须重写，子类必须自己强持有model和view;由子类自己控制model和view的生命周期
 *  会被多次调用，不要做任何初始化动作。(缓存方案待定)
 */
- (CZWTableViewModel *)createModel:(CZWTableView *)tableView;

#pragma mark - optional override

/**
 *  绑定rowObj所对应的Cell类
 *  如果不重写这个方法就要按照
 *   "obj类名后加Cell为Cell的类名" 的命名规则命名
 */
- (Class)tableView:(CZWTableView *)tableView cellClassForObject:(CZWRowObj *)rowObj;
- (Class)tableView:(CZWTableView *)tableView sectionHeaderForSection:(CZWSectionObj *)secObj;
- (Class)tableView:(CZWTableView *)tableView sectionFooterForSection:(CZWSectionObj *)secObj;

/**
 *  可以重写这些获得obj,也可以重写UITableViewDelegate的获得IndexPath
 */
//UITableViewDataSource
- (BOOL)czw_tableView:(CZWTableView *)tableView canEditRowObj:(CZWRowObj *)obj;
- (BOOL)czw_tableView:(CZWTableView *)tableView canMoveRowObj:(CZWRowObj *)obj;

/**
 *  已经设置好cell之后调用
 */
- (void)didDequeueReusableCell:(CZWTableViewCell *)cell;
- (void)didDequeueReusableHeader:(CZWTableViewSectionHeader *)headerView;
- (void)didDequeueReusableFooter:(CZWTableViewSectionFooter *)footerView;
//UITableViewDelegate
- (void)czw_tableView:(CZWTableView *)tableView didSelectRowObj:(CZWRowObj *)obj atIndexPath:(NSIndexPath *)indexPath;
- (void)czw_tableView:(CZWTableView *)tableView didDeselectRowObj:(CZWRowObj *)rowObj atIndexPath:(NSIndexPath *)indexPath;

/**
 *  cell相应反馈
 */
- (void)czw_tableView:(CZWTableView *)tableView rowObj:(CZWRowObj *)rowObj atIndexPath:(NSIndexPath *)indexPath cellDidTriggerBySender:(id)sender;
- (void)czw_tableView:(CZWTableView *)tableView secObj:(CZWSectionObj *)secObj inSection:(NSInteger)section headerViewDidTriggerBySender:(id)sender;
- (void)czw_tableView:(CZWTableView *)tableView secObj:(CZWSectionObj *)secObj inSection:(NSInteger)section  footerViewDidTriggerBySender:(id)sender;


//编辑操作
- (void)czw_tableView:(CZWTableView *)tableView cellEditingStyleDidNoneObjAtIndexPath:(NSIndexPath *)indexPath;
- (void)czw_tableView:(CZWTableView *)tableView cellEditingStyleDidDeleteObjAtIndexPath:(NSIndexPath *)deleteIndexPath;;
- (CZWRowObj *)czw_tableView:(CZWTableView *)tableView cellEditingStyleInsert:(NSIndexPath *)insertIndexPath;
- (void)czw_tableView:(CZWTableView *)tableView cellEditingStyleDidInsert:(NSIndexPath *)indexPath;
- (void)czw_tableView:(CZWTableView *)tableView didMoveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath;



@end
