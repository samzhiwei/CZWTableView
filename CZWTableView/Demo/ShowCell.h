//
//  ShowCell.h
//  CZWTableView
//
//  Created by tianqu on 16/5/30.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "CZWTableViewCell.h"
#import "Student.h"
@interface ShowCell : CZWTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end
