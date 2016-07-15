//
//  CZWSectionObj.m
//  CZWTableView
//
//  Created by tianqu on 16/5/27.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "CZWSectionObj.h"

@implementation CZWSectionObj
@synthesize model = _model;
- (instancetype)init{
    self = [super init];
    if (self) {
        //默认
        self.rowArray = [[NSMutableArray alloc]init];
        self.titleForFooter = nil;
        self.titleForHeader = nil;
        _model = nil;
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

- (void)updateSectionStatus:(void (^)(id <CZWTableViewModelProtocol> model))status{
    if (status) {
        status(_model);
        if (_model) {
            for (CZWRowObj *rowObj in _rowArray) {
                [rowObj updateObjStatus];
            }
            [_model updateSectionObj :self];
        }
    }
}

@end
