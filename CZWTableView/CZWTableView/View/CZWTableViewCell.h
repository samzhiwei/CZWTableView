//
//  CZWCellTableViewCell.h
//  CZWTableView
//
//  Created by tianqu on 16/5/27.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CZWRowObj.h"
@interface CZWTableViewCell : UITableViewCell
/**
 *  重写这个方法可以根据rowObj内容来计算高度并返回
 */
+ (CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(CZWRowObj *)rowObj;
+ (CGFloat)tableView:(UITableView *)tableView checkCacheRowHeightForObject:(CZWRowObj *)rowObj;

/**
 *  重写这个方法设定数据接入逻辑
 */

- (CZWTableViewCell *)settingData:(CZWRowObj *)rowObj;
@end
