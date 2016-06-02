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
@interface CZWTableViewController : UITableViewController

//@property (strong, nonatomic) CZWTableViewModel *model;
- (instancetype)initWithStyle:(UITableViewStyle)style tableView:(CZWTableView *)tableVIew;
@end
