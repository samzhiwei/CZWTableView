//
//  CZWSectionObj.h
//  CZWTableView
//
//  Created by tianqu on 16/5/27.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CZWRowObj.h"
@interface CZWSectionObj : NSObject
@property (strong, nonatomic) NSMutableArray<CZWRowObj *> *rowArray;
/**
 *  设置后就按照系统的HeaderView生成
 */
@property (copy, nonatomic) NSString *titleForHeader;
/**
 *  设置后就按照系统的FooterView生成
 */
@property (copy, nonatomic) NSString *titleForFooter;

@property (assign, nonatomic, readonly) NSUInteger rowArrayCount;

- (instancetype)initWithItemArray:(NSArray <CZWRowObj*>*)items;

@end
