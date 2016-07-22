//
//  CZWTableViewSectionHeader.h
//  CZWTableView
//
//  Created by tianqu on 16/7/21.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import <UIKit/UIKit.h>
#pragma mark - 定义协议
@class CZWTableViewSectionHeader;
@protocol CZWSectionHeaderDelegate <NSObject>
@optional
- (void)headerView:(CZWTableViewSectionHeader*)header didTriggerBySender:(id)sender;

@end

@interface CZWTableViewSectionHeader : UITableViewHeaderFooterView

@property (weak, nonatomic) id <CZWSectionHeaderDelegate> delegate;
@property (assign, nonatomic) NSInteger section;
- (UITableView *)superTableView;
#pragma mark - must override
+(CGFloat)headerHeightForSection:(id)secObj inSection:(NSInteger)section;

- (void)bindingShowData:(id)secObj inSection:(NSInteger)section delegate:(id <CZWSectionHeaderDelegate>)delegate;

/**
 *  用于绑定触发headerView: didTriggerBySender:
 */
- (void)triggerOff:(id)sender;


@end
