//
//  CZWRowObj.h
//  CZWTableView
//
//  Created by tianqu on 16/5/27.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

/**
 *  同理如果将cellHeight = CellNeedRecountHeight;
 *  controller就会重新进行高度计算
 */

#import <UIKit/UIKit.h>
FOUNDATION_EXPORT CGFloat const CellNeedRecountHeight;//高度缓存判断用

typedef NS_ENUM(NSUInteger, CZWRowObjEditStatus) {
    CZWRowObjEditStatusNeedRecount = 0,
    CZWRowObjEditStatusCanEdit = 1,
    CZWRowObjEditStatusNotEdit = 2
};
typedef NS_ENUM(NSUInteger, CZWRowObjMoveStatus) {
    CZWRowObjMoveStatusNeedRecount = 0,
    CZWRowObjMoveStatusCanMove = 1,
    CZWRowObjMoveStatusNotMove = 2
};

@interface CZWRowObj : NSObject
@property (assign, nonatomic) Class cellClass;
@property (assign, nonatomic) CGFloat cellHeight;
@property (assign, nonatomic) CZWRowObjEditStatus canEdit;
@property (assign, nonatomic) CZWRowObjMoveStatus canMove;
@end
