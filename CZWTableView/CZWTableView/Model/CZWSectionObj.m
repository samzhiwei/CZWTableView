//
//  CZWSectionObj.m
//  CZWTableView
//
//  Created by tianqu on 16/5/27.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "CZWSectionObj.h"
@implementation CZWSectionObj
@synthesize rowArrayCount = _rowArrayCount;
@synthesize headerHeight = _headerHeight;
@synthesize footerHeight = _footerHeight;
- (instancetype)init{
    self = [super init];
    if (self) {
        //默认
        self.rowArray = [[NSMutableArray alloc]init];
        self.titleForFooter = nil;
        self.titleForHeader = nil;
        self.open = YES;
        _headerHeight = CellNeedRecountHeight;
        _footerHeight = CellNeedRecountHeight;
        _priorityHeaderHeight = 0.0;
        _priorityFooterHeight = 0.0;
    }
    return self;
}

- (instancetype)initWithItemArray:(NSArray <CZWRowObj*>*)items{
    self = [self init];
    if (self) {
        [self.rowArray addObjectsFromArray:items];
    }
    return self;
}

- (NSUInteger)rowArrayCount{
    return self.rowArray.count;
}

- (void)setHeaderHeight:(CGFloat)headerHeight{
    _headerHeight = headerHeight;
}

- (void)setFooterHeight:(CGFloat)footerHeight{
    _footerHeight = footerHeight;
}

@end
