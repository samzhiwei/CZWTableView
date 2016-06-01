//
//  CZWRowObj.m
//  CZWTableView
//
//  Created by tianqu on 16/5/27.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "CZWRowObj.h"
#import "CZWTableViewCell.h"
CGFloat const CellInvalidHeight = -1;
@implementation CZWRowObj
- (instancetype)init
{
    self = [super init];
    if (self) {
        //默认
        _cellHeight = CellInvalidHeight;
        _cellClass = NULL;
    }
    return self;
}

//- (Class)setCellClass{
//    @throw [NSException exceptionWithName:@"Must override this method"
//                                                     reason:[NSString stringWithFormat:@"Didn't override this %s in subClass", __FUNCTION__]
//                                                   userInfo:nil];
//    //return [CZWTableViewCell class];
//}
@end
