//
//  CZWRowObj.m
//  CZWTableView
//
//  Created by tianqu on 16/5/27.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "CZWRowObj.h"
CGFloat const CellNeedRecountHeight = 44;
@implementation CZWRowObj

@synthesize cellHeight = _cellHeight;
- (instancetype)init
{
    self = [super init];
    if (self) {
        //默认
        _needRecountCellHeight = YES;
        _cellHeight = CellNeedRecountHeight;
        _cellClass = NULL;
        _canEdit = CZWRowObjEditStatusNeedRecount;
        _canMove = CZWRowObjMoveStatusNeedRecount;
        _cellHeightCorrection = 0.0;
    }
    return self;
}

- (void)updateCellHeight:(CGFloat)cellHeight{
    _cellHeight = cellHeight + self.cellHeightCorrection;
}

@end
