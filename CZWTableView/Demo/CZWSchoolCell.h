//
//  CZWSchoolCell.h
//  CZWTableView
//
//  Created by tianqu on 16/6/6.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "CZWTableViewProtocol.h"

@interface CZWSchoolCell : UITableViewCell <CZWTableViewCellProtocol>
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end
