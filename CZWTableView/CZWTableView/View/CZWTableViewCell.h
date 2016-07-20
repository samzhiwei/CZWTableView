//
//  CZWTableViewCell.h
//  ChinaBus
//
//  Created by tianqu on 16/7/18.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "CZWTextView.h"

//#define kPadding 5.0
//#define kTopToSuper 45.0 //15+20+10
//#define kLeadingToSuper 19.0
//#define kTailingToSuper 19.0
//#define kORG  60.0//15+20+10+15;



@interface CZWTableViewCell : UITableViewCell

/**
 *  在didDequeueReusableCell方法之后才能正常使用
 */
@property (weak, nonatomic, readonly) UITableView *superTableView;
/**
 *  call self.textView就会直接加载并添加进contentView中,找适合时机布局
 */
//@property (nonatomic, strong) CZWTextView *textView;

#pragma mark - must override
/**
 *  cell还没有初始化，预先计算高度
 */
+ (CGFloat)rowHeightForObject:(id)rowObj atIndexPath:(NSIndexPath *)indexPath;
/**
*  在此方法中superview及初始化设定都已完成
*/
- (UITableViewCell *)bindingShowData:(id)rowObj atIndexPath:(NSIndexPath *)indexPath;

#pragma mark - optional override
/**
 *  刚从队列中取出cell进行设置
 *  要call [super didDequeueReusableCell];
 *  比bindingShowData:早call

 */
- (void)didDequeueReusableCell;
@end
