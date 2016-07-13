//
//  CustomViewController.h
//  Metro
//
//  Created by tianqu on 12/26/13.
//
//

#import <UIKit/UIKit.h>

@interface CZWBaseViewController : UIViewController

/**
 *  添加左划返回手势
 */
- (void)addSwipeGestureRecognizer;
- (void)removeSwipeGestureRecognizer;
@end
