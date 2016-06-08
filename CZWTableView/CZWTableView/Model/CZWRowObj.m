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
        _cellHeight = CellNeedRecountHeight;
        _cellClass = NULL;
        _canEdit = CZWRowObjEditStatusNeedRecount;
        _canMove = CZWRowObjMoveStatusNeedRecount;
    }
    return self;
}

@end
