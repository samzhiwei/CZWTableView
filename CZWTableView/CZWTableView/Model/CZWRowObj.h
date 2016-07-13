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
FOUNDATION_EXPORT CGFloat const CellNeedRecountHeight;

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
/**
 *  不能手动修改
 */
@property (assign, nonatomic) Class cellClass;
@property (assign, nonatomic, readonly) CGFloat cellHeight;//自动计算，会自动加上修正量
@property (assign, nonatomic) CZWRowObjEditStatus canEdit;
@property (assign, nonatomic) CZWRowObjMoveStatus canMove;

/**
 *  可以修改
 */
@property (assign, nonatomic) BOOL needRecountCellHeight;//修改成Yes后刷新就可以强制改变了
@property (assign, nonatomic) CGFloat cellHeightCorrection;//高度修正量

- (void)updateCellStat

- (void)updateCellHeight:(CGFloat)cellHeight;

@end
