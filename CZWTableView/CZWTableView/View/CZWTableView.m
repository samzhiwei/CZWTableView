//
//  CZWTableView.m
//  CZWTableView
//
//  Created by tianqu on 16/6/1.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "CZWTableView.h"

@implementation CZWTableView
#pragma mark - optional override
/**
 *  可以给子类重写初始化设定
 */
- (void)initSetting{
    self.separatorColor = [UIColor clearColor];
    self.showsVerticalScrollIndicator = YES;
    self.showsHorizontalScrollIndicator = NO;
    self.allowsMultipleSelection = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshUI:) name:ntkModelUpdate object:nil];
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

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ntkModelUpdate object:nil];
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


- (void)pastDelegate:(id<UITableViewDelegate>)delegate dataSource:(id<UITableViewDataSource>)dataSource{
    self.delegate = delegate;
    self.dataSource = dataSource;
}

- (void)refreshUI:(NSNotification *)noti{
    NSIndexPath *indexPath = [noti.userInfo objectForKey:@"indexPath"];
    //[self beginUpdates];
    [self reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    //[self endUpdates];
}



@end
