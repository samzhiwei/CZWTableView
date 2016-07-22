//
//  CZWStudentCell.m
//  CZWTableView
//
//  Created by tianqu on 16/6/2.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "CZWStudentCell.h"

@implementation CZWStudentCell

+ (CGFloat)rowHeightForObject:(id)rowObj atIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
- (UITableViewCell *)bindingShowData:(id)rowObj atIndexPath:(NSIndexPath *)indexPath delegate:(id<CZWCellDelegate>)delegate{
    self.delegate = delegate;
    self.label.text = [rowObj valueForKey:@"name"];
    NSNumber *age = [rowObj valueForKey:@"age"];
    [self.button setTitle:[age stringValue] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(triggerOff:) forControlEvents:UIControlEventTouchUpInside];
    self.image.image = [UIImage imageNamed:[rowObj valueForKey:@"imageName"]];
    return self;
}
@end
