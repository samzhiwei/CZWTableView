//
//  CZWTableView.m
//  CZWTableView
//
//  Created by tianqu on 16/6/1.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "CZWTableView.h"

@implementation CZWTableView

#pragma mark - Initialize
- (instancetype)init{
    self = [super init];
    if (self) {
        [self initSetting];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSetting];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self initSetting];
    }
    return self;
}

- (void)initSetting{
    self.autoresizingMask =  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.separatorColor = [UIColor clearColor];
    self.showsVerticalScrollIndicator = YES;
    self.showsHorizontalScrollIndicator = NO;
}

- (instancetype)initWithFrame:(CGRect)frame registerCellNibParam:(NSDictionary *)param{
    self = [self initWithFrame:frame];
    if (self) {
        [self registerCellParam:param];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style  registerCellNibParam:(NSDictionary *)param{
    self = [self initWithFrame:frame style:style];
    if (self) {
        [self registerCellParam:param];
        
    }
    return self;
}

- (void)registerCellParam:(NSDictionary *)param{
    if (param.allKeys.count > 0) {
        for (NSString *key in param.allKeys) {
            UINib *nib = [param objectForKey:key];
            [self registerNib:nib forCellReuseIdentifier:key];
        }
    }
}

@end
