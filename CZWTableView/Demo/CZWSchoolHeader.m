//
//  CZWSchoolCell.m
//  CZWTableView
//
//  Created by tianqu on 16/6/6.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "CZWSchoolHeader.h"

@implementation CZWSchoolHeader
+(CGFloat)headerHeightForSection:(id)secObj inSection:(NSInteger)section{
    return 40;
}

- (void)bindingShowData:(id)secObj inSection:(NSInteger)section delegate:(id<CZWSectionHeaderDelegate>)delegate{
    self.delegate = delegate;
    _label.text = [secObj valueForKey:@"headerTitle"];
    [_button setTitle:@"ABc" forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(triggerOff:) forControlEvents:UIControlEventTouchUpInside];
}
@end
