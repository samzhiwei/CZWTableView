//
//  CZWStudentCell.h
//  CZWTableView
//
//  Created by tianqu on 16/6/2.
//  Copyright © 2016年 Tianqu. All rights reserved.
//


#import "CZWTableViewCell.h"
#import "CZWStudent.h"
@interface CZWStudentCell : CZWTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end
