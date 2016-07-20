//
//  CZWRowObj.m
//  CZWTableView
//
//  Created by tianqu on 16/5/27.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "CZWRowObj.h"
CGFloat const CellNeedRecountHeight = -1;
@interface CZWRowObj ()

@end
@implementation CZWRowObj
@synthesize cellHeight = _cellHeight;
- (instancetype)init
{
    self = [super init];
    if (self) {
        _cellHeight = CellNeedRecountHeight;
        _cellClass = NULL;
        _canEdit = CZWRowObjEditStatusNeedRecount;
        _canMove = CZWRowObjMoveStatusNeedRecount;
        _priorityCellHeight = 0.0;
    }
    return self;
}

- (void)setCellHeight:(CGFloat)cellHeight{
    _cellHeight = cellHeight;
}


@end
