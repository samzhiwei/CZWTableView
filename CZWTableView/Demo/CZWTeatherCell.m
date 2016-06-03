//
//  CZWTeatherCell.m
//  CZWTableView
//
//  Created by tianqu on 16/6/2.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "CZWTeatherCell.h"

@implementation CZWTeatherCell

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)rowObj{
    return 66;
}
//配置好然后返回self
- (UITableViewCell *)settingData:(id)rowObj{
    NSString *name = [rowObj valueForKey:@"name"];
    self.image.image = [UIImage imageNamed:name];
    self.label.text = [[rowObj valueForKey:@"workNumber"] stringValue];
    return self;
}
@end
