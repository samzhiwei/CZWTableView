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
 *  需要修改在updateObjStatus/updateCellStatus方法中修改
 */
@property (assign, nonatomic) Class cellClass;

/**
 *  全由其他类提供，在此做缓存
 */
@property (assign, nonatomic, readonly) CGFloat cellHeight;
@property (assign, nonatomic) CZWRowObjEditStatus canEdit;
@property (assign, nonatomic) CZWRowObjMoveStatus canMove;
/**
 *  修改cellHeight
 */
- (void)setCellHeight:(CGFloat)cellHeight;
/**
*  额外给予的高度，实际tableView计算出来的高度 = cellHeight + priorityCellHeight
*/
@property (assign, nonatomic) CGFloat priorityCellHeight;




@end
