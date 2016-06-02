//
//  CZWStudentCell.m
//  CZWTableView
//
//  Created by tianqu on 16/6/2.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "CZWStudentCell.h"

@implementation CZWStudentCell

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(CZWRowObj *)rowObj{
    return 44.0;
}

- (CZWTableViewCell *)settingData:(CZWStudent *)rowObj{
    _image.image = [UIImage imageNamed:rowObj.imageName];
    _label.text = rowObj.name;
    [_button setTitle:[rowObj.age stringValue] forState:UIControlStateNormal];
    return self;
}

@end
