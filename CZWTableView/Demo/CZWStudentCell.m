//
//  CZWStudentCell.m
//  CZWTableView
//
//  Created by tianqu on 16/6/2.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "CZWStudentCell.h"

@implementation CZWStudentCell

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)rowObj{
    return 44;
}
//配置好然后返回self
- (UITableViewCell *)settingData:(id)rowObj{
    self.label.text = [rowObj valueForKey:@"name"];
    NSNumber *age = [rowObj valueForKey:@"age"];
    [self.button setTitle:[age stringValue] forState:UIControlStateNormal];
    self.image.image = [UIImage imageNamed:[rowObj valueForKey:@"imageName"]];
    return self;
}
@end
