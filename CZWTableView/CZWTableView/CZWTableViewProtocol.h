//
//  CZWTableViewProtocol.h
//  CZWTableView
//
//  Created by tianqu on 16/6/3.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  为解耦而设
 */
@protocol CZWTableViewCellProtocol <NSObject>
@required
/**
 *  返回用rowObj来计算cell的高度返回
 *  如果清楚rowObj类型可以直接强转类型来使用;
 *  正常来说会rowObj的类型名会是收到的cell的类型名去掉cell;
 */
+ (CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)rowObj;
//配置好然后返回self
- (UITableViewCell *)settingData:(id)rowObj;

@end

@protocol CZWTableViewModelProtocol <NSObject>


@end


