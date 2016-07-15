//
//  CZWTableViewController.h
//  CZWTableView
//
//  Created by tianqu on 16/6/1.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

/**
 *  ps.
 *  1.继承CZWTableViewController
 *  2.重写- (CZWTableViewModel *)createModel:(CZWTableView *)tableView;绑定model和tableView
 *  3.CZWTableViewModel数据按形式继承CZWSectionObj,CZWRowObj类;建立二维数组
 *  4.创建tableView时绑定相应的cell
 *  5.cell视图准守CZWTableViewCellProtocol协议
 */
#import "CZWBaseViewController.h"

#import "CZWTableViewProtocol.h"
#import "CZWTableView.h"
#import "CZWTableViewModel.h"

@interface CZWTableViewController : CZWBaseViewController <UITableViewDataSource,UITableViewDelegate>
/**
 *  自动绑定tableView的delegate和dataSource
 */
- (instancetype)initWithTableView:(CZWTableView *)tableVIew;


@end
