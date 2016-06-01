//
//  CZWTableView.h
//  CZWTableView
//
//  Created by tianqu on 16/6/1.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CZWTableViewCell.h"
@interface CZWTableView : UITableView

/**
 *
 */
- (instancetype)initWithFrame:(CGRect)frame registerCellNibParam:(NSDictionary *)param;
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style registerCellNibParam:(NSDictionary *)param;
/**
 *  注册cell
 *  Param : key(cell名) : value:(cell Nib)
 *  后续支持class注册
 */
- (void)registerCellParam:(NSDictionary *)param;
@end
