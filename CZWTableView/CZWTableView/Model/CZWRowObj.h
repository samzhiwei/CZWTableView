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
#import "CZWTableViewProtocol.h"
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
@property (weak, nonatomic, readonly) id <CZWTableViewModelProtocol> model;

/**
 *  全由其他类提供，在此做缓存
 */
@property (assign, nonatomic, readonly) NSNumber *cellHeight;
@property (assign, nonatomic) CZWRowObjEditStatus canEdit;
@property (assign, nonatomic) CZWRowObjMoveStatus canMove;


#pragma mark - 即时反馈更新
/**
 *  改变后马上更新UI
 */
- (void)updateCellStatus:(void (^)(CZWRowObj *rowObj))status;

@property (assign, nonatomic) CGFloat priorityCellHeight;
/**
 *  只改变model不立即更新UI
 */
- (void)updateObjStatus;

/**
 *  此值根据+ (CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)rowObj;计算得出。修改泚值马上改变Cell高度，
 *  在- (void)updateCellStatus:(void (^)(CZWRowObj *))status中cellHeight改为CellNeedRecountHeight
 *  最好不要手动改高度，最好是通过 cellHeight = CellNeedRecountHeight然后通过cell自己进行重新计算
 */



@end
