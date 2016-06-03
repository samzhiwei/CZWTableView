//
//  CZWSectionObj.h
//  CZWTableView
//
//  Created by tianqu on 16/5/27.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CZWRowObj.h"
@interface CZWSectionObj : CZWRowObj
@property (strong, nonatomic) NSMutableArray<CZWRowObj *> *rowArray;
- (instancetype)initWithItemArray:(NSArray <CZWRowObj*>*)items;
@end
