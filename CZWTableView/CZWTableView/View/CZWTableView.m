//
//  CZWTableView.m
//  CZWTableView
//
//  Created by tianqu on 16/6/1.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "CZWTableView.h"

@implementation CZWTableView
//@synthesize model = _model;
#pragma mark - optional override
/**
 *  可以给子类重写初始化设定
 */
- (void)initSetting{
    self.separatorColor = [UIColor clearColor];
    self.showsVerticalScrollIndicator = YES;
    self.showsHorizontalScrollIndicator = NO;
    self.allowsMultipleSelection = YES;
    
}

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

#pragma mark - Api

- (instancetype)initWithRegisterCellClasses:(NSArray <Class>*)classes{
    self = [self init];
    if (self) {
        [self registerCellClasses:classes];
    }
    return self;
}

- (instancetype)initWithRegisterCellClasses:(NSArray <Class>*)classes delegate:(id<UITableViewDelegate>)delegate dataSource:(id<UITableViewDataSource>)dataSource{
    self = [self init];
    if (self) {
        [self registerCellClasses:classes];
        [self pastDelegate:delegate dataSource:dataSource];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame registerCellClasses:(NSArray <Class>*)classes{
    self = [self initWithFrame:frame];
    if (self) {
        [self registerCellClasses:classes];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style registerCellClasses:(NSArray <Class>*)classes{
    self = [self initWithFrame:frame style:style];
    if (self) {
        [self registerCellClasses:classes];
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style registerCellClasses:(NSArray <Class>*)classes delegate:(id<UITableViewDelegate>)delegate dataSource:(id<UITableViewDataSource>)dataSource{
    self = [self initWithFrame:frame style:style];
    if (self) {
        [self registerCellClasses:classes];
        [self pastDelegate:(id<UITableViewDelegate>)delegate dataSource:(id<UITableViewDataSource>)dataSource];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style registerCellNibName:(NSArray <NSString *>*)nibNames delegate:(id<UITableViewDelegate>)delegate dataSource:(id<UITableViewDataSource>)dataSource{
    self = [self initWithFrame:frame style:style];
    if (self) {
        [self registerCellNibs:nibNames];
        [self pastDelegate:(id<UITableViewDelegate>)delegate dataSource:(id<UITableViewDataSource>)dataSource];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style registerCellNibNames:(NSArray <NSString *>*)nibNames delegate:(id<UITableViewDelegate>)delegate dataSource:(id<UITableViewDataSource>)dataSource{
    self = [self initWithFrame:frame style:style];
    if (self) {
        [self registerCellNibs:nibNames];
        [self pastDelegate:delegate dataSource:dataSource];
    }
    return self;
}

- (void)registerCellNibs:(NSArray <NSString *>*)nibNames{
    for (NSString *nibName in nibNames) {
        [self registerNib:[UINib nibWithNibName:nibName bundle:nil] forCellReuseIdentifier:nibName];
    }
}

- (void)registerCellClasses:(NSArray <Class>*)classes{
    for (Class cellClass in classes) {
        NSString *cellClassStr = NSStringFromClass(cellClass);
        [self registerClass:cellClass forCellReuseIdentifier:cellClassStr];
    }
}

- (void)registerSectionNibs:(NSArray <NSString*>*)nibNames{
    for (NSString *nibName in nibNames) {
        [self registerNib:[UINib nibWithNibName:nibName bundle:nil] forHeaderFooterViewReuseIdentifier:nibName];
    }
}

- (void)registerSectionClasses:(NSArray <Class>*)classes{
    for (Class sectionClass in classes) {
        NSString *sectionClassStr = NSStringFromClass(sectionClass);
        [self registerClass:sectionClass forHeaderFooterViewReuseIdentifier:sectionClassStr];
    }
}


- (void)pastDelegate:(id<UITableViewDelegate>)delegate dataSource:(id<UITableViewDataSource>)dataSource{
    self.delegate = delegate;
    self.dataSource = dataSource;
}

- (UITableViewHeaderFooterView *)dequeueReusableHeaderFooterViewWithIdentifier:(NSString *)identifier inSection:(NSInteger)section{
    UITableViewHeaderFooterView *hfView = [self dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (hfView == nil) {
        hfView = [[UITableViewHeaderFooterView alloc]initWithReuseIdentifier:identifier];
    }
    if ([hfView isKindOfClass:[CZWTableViewSectionHeader class]]) {
        CZWTableViewSectionHeader *h = (CZWTableViewSectionHeader *)hfView;
        h.section = section;
    } else if ([hfView isKindOfClass:[CZWTableViewSectionFooter class]]) {
        CZWTableViewSectionFooter *f = (CZWTableViewSectionFooter *)hfView;
        f.section = section;
    }
    
    //可能需要清空自身和子类某些参数再返回(方案待定)
    return hfView;
}



@end
