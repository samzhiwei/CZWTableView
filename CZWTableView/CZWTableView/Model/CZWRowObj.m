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
@synthesize model = _model;
@synthesize cellHeight = _cellHeight;
- (instancetype)init
{
    self = [super init];
    if (self) {
        _cellHeight = [NSNumber numberWithFloat:CellNeedRecountHeight];
        _cellClass = NULL;
        _canEdit = CZWRowObjEditStatusNeedRecount;
        _canMove = CZWRowObjMoveStatusNeedRecount;
    }
    return self;
}

- (void)updateObjStatus{
    _cellHeight = [NSNumber numberWithFloat:CellNeedRecountHeight];
    _canEdit = CZWRowObjEditStatusNeedRecount;
    _canMove = CZWRowObjMoveStatusNeedRecount;
}

- (void)updateCellStatus:(void (^)(CZWRowObj *rowObj))status{
    if (status) {
        status(self);
        if (_model) {
            [self updateObjStatus];
            [_model updateRowObj:self];
        }
    }
}




@end
