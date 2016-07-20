//
//  CZWTextView.h
//  ChinaBus
//
//  Created by tianqu on 16/7/18.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

//ps.初始化时将textView.delegate设为了self

#import <UIKit/UIKit.h>
@protocol CZWCellHeightUpdateWithTextProtocol <NSObject>

@required
- (void)tableView:(UITableView *)tableView updatedText:(NSString *)text atIndexPath:(NSIndexPath *)indexPath;

@optional
- (void)tableView:(UITableView *)tableView updatedHeight:(CGFloat)height atIndexPath:(NSIndexPath *)indexPath;
- (BOOL)tableView:(UITableView *)tableView textView:(UITextView*)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;
- (void)tableView:(UITableView *)tableView textViewDidChangeSelection:(UITextView*)textView;

- (void)tableView:(UITableView *)tableView textViewDidBeginEditing:(UITextView *)textView indexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView *)tableView textViewDidEndEditing:(UITextView*)textView indexPath:(NSIndexPath *)indexPath;

@end

@interface CZWTextView : UITextView 
@property (copy, nonatomic) IBInspectable NSString *placeholder;
@property (nonatomic) IBInspectable double fadeTime;
@property (copy, nonatomic) NSAttributedString *attributedPlaceholder;
@property (strong, nonatomic) UIColor *placeholderTextColor UI_APPEARANCE_SELECTOR;



@property (weak, nonatomic) UITableView *tableView;//textView所在的cell的tableView
@property (weak, nonatomic) UITableViewCell *cell;//textView所在的cell

- (id)initWithFrame:(CGRect)frame tableView:(UITableView *)tableView cell:(UITableViewCell *)cell;

-(void)updateTextViewHeight; // Call to update the textView height (useful for viewdidload)(手动更新)
@end
