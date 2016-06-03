//
//  CZWTeatherCell.h
//  CZWTableView
//
//  Created by tianqu on 16/6/2.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "CZWTableViewProtocol.h"
@interface CZWTeatherCell : UITableViewCell <CZWTableViewCellProtocol>
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end
