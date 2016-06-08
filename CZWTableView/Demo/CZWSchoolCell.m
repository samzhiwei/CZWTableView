//
//  CZWSchoolCell.m
//  CZWTableView
//
//  Created by tianqu on 16/6/6.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "CZWSchoolCell.h"

@implementation CZWSchoolCell

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)rowObj{
    return 44;
}
- (UITableViewCell *)settingData:(id)rowObj{
    self.backgroundColor = [UIColor redColor];
    self.label.text = [rowObj valueForKey:@"headerTitle"];
    return self;
}

@end
