//
//  CZWTableViewCell.m
//  ChinaBus
//
//  Created by tianqu on 16/7/18.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "CZWTableViewCell.h"
//#import "EditTextInputAccessoryView.h"
@interface CZWTableViewCell () <UITextViewDelegate>

@end

@implementation CZWTableViewCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

//- (CZWTextView *)textView{
//    if (!_textView) {
//        _textView = [[CZWTextView alloc]init];
//        [self.contentView addSubview:_textView];
//    }
//    return _textView;
//}

+ (CGFloat)rowHeightForObject:(id)rowObj atIndexPath:(NSIndexPath *)indexPath{
    @throw [NSException exceptionWithName:@"Must override this method"
                                   reason:[NSString stringWithFormat:@"Didn't override this method %s in subClass", __FUNCTION__]
                                 userInfo:nil];
}
- (UITableViewCell *)bindingShowData:(id)rowObj atIndexPath:(NSIndexPath *)indexPath{
    @throw [NSException exceptionWithName:@"Must override this method"
                                   reason:[NSString stringWithFormat:@"Didn't override this method %s in subClass", __FUNCTION__]
                                 userInfo:nil];
}

- (void)didDequeueReusableCell{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (UITableView *)superTableView{
    UIView *view = self;
    while (![view isKindOfClass:[UITableView class]]) {
        view = view.superview;
    }
    return (UITableView *)view;
}
@end
