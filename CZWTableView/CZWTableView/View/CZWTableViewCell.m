//
//  CZWTableViewCell.m
//  ChinaBus
//
//  Created by tianqu on 16/7/18.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "CZWTableViewCell.h"

@implementation CZWTableViewCell
+ (CGFloat)rowHeightForObject:(id)rowObj atIndexPath:(NSIndexPath *)indexPath{
    @throw [NSException exceptionWithName:@"Must override this method"
                                   reason:[NSString stringWithFormat:@"Didn't override this method %s in subClass", __FUNCTION__]
                                 userInfo:nil];
}
- (UITableViewCell *)bindingShowData:(id)rowObj atIndexPath:(NSIndexPath *)indexPath delegate:(id <CZWCellDelegate>)delegate{
    @throw [NSException exceptionWithName:@"Must override this method"
                                   reason:[NSString stringWithFormat:@"Didn't override this method %s in subClass", __FUNCTION__]
                                 userInfo:nil];
}

- (void)triggerOff:(id)sender{
    if ([_delegate respondsToSelector:@selector(cell:didTriggerBySender:)]) {
        [_delegate cell:self didTriggerBySender:sender];
    }
}

- (UITableView *)superTableView{
    UIView *view = self;
    while (![view isKindOfClass:[UITableView class]]) {
        view = view.superview;
    }
    return (UITableView *)view;
}


@end
