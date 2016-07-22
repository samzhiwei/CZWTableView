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
@property (assign, nonatomic, readonly) NSUInteger rowArrayCount;
@property (strong, nonatomic) Class sectionHeaderClass;
@property (strong, nonatomic) Class sectionFooterClass;

- (instancetype)initWithItemArray:(NSArray <CZWRowObj*>*)items;
#pragma mark - tableViewStyle为plain下的折叠效果相关
/** 
 * 展开属性
 */
@property (assign, nonatomic, getter=isOpen) BOOL open;

@property (assign, nonatomic, readonly) CGFloat headerHeight;
@property (assign, nonatomic, readonly) CGFloat footerHeight;
- (void)setHeaderHeight:(CGFloat)headerHeight;
- (void)setFooterHeight:(CGFloat)footerHeight;
@property (assign, nonatomic) CGFloat priorityHeaderHeight;
@property (assign, nonatomic) CGFloat priorityFooterHeight;
#pragma mark - 只有tableViewStyle为grouped才生效
/**
 *  设置后就按照系统的HeaderView生成
 */
@property (copy, nonatomic) NSString *titleForHeader;
/**
 *  设置后就按照系统的FooterView生成
 */
@property (copy, nonatomic) NSString *titleForFooter;



@end
