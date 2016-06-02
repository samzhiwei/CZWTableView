//
//  CZWStudent.h
//  CZWTableView
//
//  Created by tianqu on 16/6/2.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "CZWRowObj.h"

@interface CZWStudent : CZWRowObj
@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic) NSNumber *age;
@property (strong, nonatomic) NSString *imageName;
@end
