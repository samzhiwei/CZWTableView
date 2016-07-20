//
//  CZWSectionObj.m
//  CZWTableView
//
//  Created by tianqu on 16/5/27.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "CZWSectionObj.h"

@implementation CZWSectionObj
@synthesize rowArrayCount = _rowArrayCount;
- (instancetype)init{
    self = [super init];
    if (self) {
        //默认
        self.rowArray = [[NSMutableArray alloc]init];
        self.titleForFooter = nil;
        self.titleForHeader = nil;
    }
    return self;
}

- (instancetype)initWithItemArray:(NSArray <CZWRowObj*>*)items{
    self = [self init];
    if (self) {
        [self.rowArray addObjectsFromArray:items];
    }
    return self;
}

- (NSUInteger)rowArrayCount{
    return self.rowArray.count;
}

@end
