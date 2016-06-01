//
//  ShowCell.m
//  CZWTableView
//
//  Created by tianqu on 16/5/30.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "ShowCell.h"

@implementation ShowCell
+ (CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(CZWRowObj *)rowObj{
    NSLog(@"%s",__FUNCTION__);
    return 66;
}

- (ShowCell *)settingData:(Student *)rowObj{
    NSLog(@"%s",__FUNCTION__);
    
    self.label.text = rowObj.name;
    [self.button setTitle:[rowObj.age stringValue] forState:UIControlStateNormal];
    self.image.image = [UIImage imageNamed:rowObj.imageName];
    return self;
}
@end
