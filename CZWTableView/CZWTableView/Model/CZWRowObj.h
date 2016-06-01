//
//  CZWRowObj.h
//  CZWTableView
//
//  Created by tianqu on 16/5/27.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import <UIKit/UIKit.h>
FOUNDATION_EXPORT CGFloat const CellInvalidHeight;//高度缓存判断用
@interface CZWRowObj : NSObject
@property (assign, nonatomic) Class cellClass;
@property (nonatomic, assign) CGFloat cellHeight;
@end
