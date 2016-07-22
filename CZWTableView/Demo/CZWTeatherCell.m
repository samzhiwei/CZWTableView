//
//  CZWTeatherCell.m
//  CZWTableView
//
//  Created by tianqu on 16/6/2.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "CZWTeatherCell.h"

@implementation CZWTeatherCell

+ (CGFloat)rowHeightForObject:(id)rowObj atIndexPath:(NSIndexPath *)indexPath{
    return 66;
}
- (UITableViewCell *)bindingShowData:(id)rowObj atIndexPath:(NSIndexPath *)indexPath delegate:(id<CZWCellDelegate>)delegate{
    self.delegate = delegate;
    NSString *name = [rowObj valueForKey:@"name"];
    self.image.image = [UIImage imageNamed:name];
    self.label.text = [[rowObj valueForKey:@"workNumber"] stringValue];
    return self;
}
@end
