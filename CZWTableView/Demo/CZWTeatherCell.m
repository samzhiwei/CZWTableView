//
//  CZWTeatherCell.m
//  CZWTableView
//
//  Created by tianqu on 16/6/2.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "CZWTeatherCell.h"

@implementation CZWTeatherCell

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(CZWRowObj *)rowObj{
    return 66.0;
}

- (CZWTableViewCell *)settingData:(CZWTeather *)rowObj{
    _image.image = [UIImage imageNamed:rowObj.name];
    _label.text = [rowObj.workNumber stringValue];
    return self;
}

@end
