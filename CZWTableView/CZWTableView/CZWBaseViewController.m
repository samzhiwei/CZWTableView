//
//  CustomViewController.m
//  Metro
//
//  Created by tianqu on 12/26/13.
//
//

#import "CZWBaseViewController.h"

@interface CZWBaseViewController ()
@property (strong, nonatomic) UISwipeGestureRecognizer* swipe;
@end

@implementation CZWBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
        
        CGRect frame = self.view.frame;
        frame.size.height -= 20.0f;
        self.view.frame = frame;
        
    }

}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0) {
//        if ( self.navigationController.navigationBarHidden == YES )
//        {
//            [self.view setBounds:CGRectMake(0, -20, self.view.bounds.size.width, self.view.bounds.size.height)];
//        }
//        else
//        {
//            self.edgesForExtendedLayout = UIRectEdgeNone;
//        }
         self.navigationController.navigationBar.translucent = NO;
    }
    
}

- (void)addBackSwipeGestureRecognizer{
    //右滑动手势
    if (!_swipe) {
        _swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self.navigationController action:@selector(popBackwordViewController)];
        [_swipe setDirection:UISwipeGestureRecognizerDirectionRight];
    }
    [self.view addGestureRecognizer:_swipe];
}

- (void)removeBackSwipeGestureRecognizer{
    if (_swipe) {
        [self.view removeGestureRecognizer:_swipe];
    }
}

- (void)popBackwordViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dismissBackwordViewController
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

@end
