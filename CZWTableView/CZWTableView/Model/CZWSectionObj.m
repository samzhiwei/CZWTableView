//
//  CZWSectionObj.m
//  CZWTableView
//
//  Created by tianqu on 16/5/27.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "CZWSectionObj.h"

@implementation CZWSectionObj
- (instancetype)init{
    self = [super init];
    if (self) {
        self.rowArray = [[NSMutableArray alloc]init];
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
@end
