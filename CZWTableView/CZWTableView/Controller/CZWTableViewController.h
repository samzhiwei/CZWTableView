//
//  CZWTableViewController.h
//  CZWTableView
//
//  Created by tianqu on 16/6/1.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

/**
 *  一个controller只对应一个tableView,一个model;
 */

#import <UIKit/UIKit.h>
#import "CZWTableView.h"
#import "CZWTableViewModel.h"
@protocol CZWTableViewControllerDelegate <NSObject>


/**
 *  数据与cell类型匹配
 */
- (Class)tableView:(UITableView *)tableView cellClassForObject:(CZWRowObj *)rowObj;
@end
@interface CZWTableViewController : UITableViewController
@property (weak, nonatomic) id<CZWTableViewControllerDelegate> controllerDelegate;
@property (strong, nonatomic) CZWTableViewModel *model;
- (instancetype)initWithStyle:(UITableViewStyle)style tableView:(CZWTableView *)tableVIew delegate:(id<CZWTableViewControllerDelegate>)delegate;
@end
