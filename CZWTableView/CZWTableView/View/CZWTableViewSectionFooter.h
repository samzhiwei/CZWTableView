//
//  CZWTableViewSectionFooter.h
//  CZWTableView
//
//  Created by tianqu on 16/7/21.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CZWTableViewSectionFooter;
@protocol CZWSectionFooterDelegate <NSObject>
@optional
- (void)footerView:(CZWTableViewSectionFooter *)footView didTriggerBySender:(id)sender;

@end
@interface CZWTableViewSectionFooter : UITableViewHeaderFooterView
@property (weak, nonatomic) id <CZWSectionFooterDelegate> delegate;
@property (assign, nonatomic) NSInteger section;
- (UITableView *)superTableView;
#pragma mark - must override
+(CGFloat)footerHeightForSection:(id)secObj inSection:(NSInteger)section;

- (void)bindingShowData:(id)secObj inSection:(NSInteger)section delegate:(id<CZWSectionFooterDelegate>)delegate;


/**
 *  用于绑定触发headerView: didTriggerBySender:
 */
- (void)triggerOff:(id)sender;
@end
