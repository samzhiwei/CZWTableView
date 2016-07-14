//
//  CZWRowObj.m
//  CZWTableView
//
//  Created by tianqu on 16/5/27.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "CZWRowObj.h"
CGFloat const CellNeedRecountHeight = -1;

@implementation CZWRowObj
- (instancetype)init
{
    self = [super init];
    if (self) {
        //默认
        _usePriorityCellHeight = NO;
        _usePriorityEditStatus = NO;
        _usePriorityMoveStatus = NO;

        _cellHeight = CellNeedRecountHeight;
        _cellClass = NULL;
        _canEdit = CZWRowObjEditStatusNeedRecount;
        _canMove = CZWRowObjMoveStatusNeedRecount;
    }
    return self;
}

- (void)updateCellStatus:(void (^)(CZWRowObj *rowObj))status{
    CGFloat tempCellHeight = _cellHeight;
    CZWRowObjEditStatus tempCanEdit = _canEdit;
    CZWRowObjMoveStatus tempCanMove = _canMove;
    if (status) {
        status(self);
        if (_delegate) {
            if (self.cellHeight != tempCellHeight) {
                _usePriorityCellHeight = YES;
            }
            if (self.canEdit != tempCanEdit) {
                _usePriorityEditStatus = YES;
            }
            if (self.canMove != tempCanMove) {
                 _usePriorityMoveStatus = YES;
            }
            [_delegate updateModel:self];
        }
    }
}




@end
