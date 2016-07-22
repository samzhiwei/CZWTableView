//
//  CZWTableViewSectionHeader.m
//  CZWTableView
//
//  Created by tianqu on 16/7/21.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "CZWTableViewSectionHeader.h"

@implementation CZWTableViewSectionHeader
- (UITableView *)superTableView{
    UIView *view = self;
    while (![view isKindOfClass:[UITableView class]]) {
        view = view.superview;
    }
    return (UITableView *)view;
}

+(CGFloat)headerHeightForSection:(id)secObj inSection:(NSInteger)section{
    @throw [NSException exceptionWithName:@"Must override this method"
                                   reason:[NSString stringWithFormat:@"Didn't override this method %s in subClass", __FUNCTION__]
                                 userInfo:nil];
}
- (void)bindingShowData:(id)secObj inSection:(NSInteger)section delegate:(id <CZWSectionHeaderDelegate>)delegate{
    @throw [NSException exceptionWithName:@"Must override this method"
                                   reason:[NSString stringWithFormat:@"Didn't override this method %s in subClass", __FUNCTION__]
                                 userInfo:nil];
}

- (void)triggerOff:(id)sender{
    if ([self.delegate respondsToSelector:@selector(headerView:didTriggerBySender:)]) {
        [self.delegate headerView:self didTriggerBySender:sender];
    }
}
@end
