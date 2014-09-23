//
//  AMISecondViewController.m
//  Amit_test1
//
//  Created by User1 on 2014-06-06.
//  Copyright (c) 2014 Lambton college. All rights reserved.
//

#import "AMISecondViewController.h"

@interface AMISecondViewController ()
@property (weak, nonatomic) IBOutlet UIButton *actionButton1;
@property (weak, nonatomic) IBOutlet UIButton *actionButton2;
@property (weak, nonatomic) IBOutlet UIButton *actionButton3;
@property (weak, nonatomic) IBOutlet UIButton *actionButton4;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@end

@implementation AMISecondViewController

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
    self.sliderLabel.text = @"50";
    // Do any additional setup after loading the view.
    
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doLayoutForOrientation:) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    
    
    [self doLayoutForOrientation:[NSNotificationCenter defaultCenter] ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */




- (IBAction)buttonPressed:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"Are you sure?"
                                  delegate:self
                                  cancelButtonTitle:@"No Way!"
                                  destructiveButtonTitle:@"Yes, I’m Sure!"
                                  otherButtonTitles:nil];
    [actionSheet showInView:self.view];
    
    
}



- (void)actionSheet:(UIActionSheet *)actionSheet
didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != [actionSheet cancelButtonIndex]) {
        NSString *msg = nil;
        if ([self.nameField.text length] > 0) {
            msg = [NSString stringWithFormat:
                   @"You can breathe easy, %@, everything went OK.",
                   self.nameField.text];
        } else {
            msg = @"You can breathe easy, everything went OK.";
        }
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Something was done"
                              message:msg
                              delegate:self
                              cancelButtonTitle:@"Phew!"
                              otherButtonTitles:nil];
        [alert show];
    }
}

//- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)
//toInterfaceOrientation duration:(NSTimeInterval)duration {
//    [self doLayoutForOrientation:toInterfaceOrientation];
//}

- (void)doLayoutForOrientation:(NSNotificationCenter *)orientation {
        UIApplication *app = [UIApplication sharedApplication]; UIInterfaceOrientation currentOrientation = app.statusBarOrientation;
//    [self doLayoutForOrientation:currentOrientation];
    if (UIInterfaceOrientationIsPortrait(currentOrientation)) {
        [self layoutPortrait];
    } else {
        [self layoutLandscape];
    }
}


static const CGFloat buttonHeight = 30;
static const CGFloat buttonWidth = 100;
static const CGFloat spacing = 20;
- (void)layoutPortrait {
    CGRect b = self.view.bounds;
    CGFloat contentWidth = CGRectGetWidth(b) - (4 * spacing);
    CGFloat contentHeight = CGRectGetHeight(b) - (8 * spacing) -
    (2 * buttonHeight);
    self.contentView.frame = CGRectMake(spacing, spacing,
                                        contentWidth, contentHeight);
    CGFloat buttonRow1y = contentHeight + (2 * spacing);
    CGFloat buttonRow2y = buttonRow1y + buttonHeight +  spacing;
    CGFloat buttonCol1x = spacing;
    CGFloat buttonCol2x = CGRectGetWidth(b) - buttonWidth - spacing;
    self.actionButton1.frame = CGRectMake(buttonCol1x, buttonRow1y,
                                          buttonWidth, buttonHeight);
    self.actionButton2.frame = CGRectMake(buttonCol2x, buttonRow1y,
                                          buttonWidth, buttonHeight);
    self.actionButton3.frame = CGRectMake(buttonCol1x, buttonRow2y,
                                          buttonWidth, buttonHeight);
    self.actionButton4.frame = CGRectMake(buttonCol2x, buttonRow2y,
                                          buttonWidth, buttonHeight);
}
- (void)layoutLandscape {
    CGRect b = self.view.bounds;
    CGFloat contentWidth = CGRectGetHeight(b) - buttonWidth - (6 * spacing);
    CGFloat contentHeight = CGRectGetWidth(b) - (6 * spacing);
    self.contentView.frame = CGRectMake(spacing, spacing,
                                        contentWidth, contentHeight);
    CGFloat buttonX = CGRectGetHeight(b) - buttonWidth - spacing;
    CGFloat buttonRow1y = spacing;
    CGFloat buttonRow4y = CGRectGetWidth(b) - buttonHeight - 3 * spacing;
    CGFloat buttonRow2y = buttonRow1y + floor((buttonRow4y - buttonRow1y)
                                              * 0.333);
    
    CGFloat buttonRow3y = buttonRow1y + floor((buttonRow4y - buttonRow1y)
                                              * 0.667);
    self.actionButton1.frame = CGRectMake(buttonX, buttonRow1y,
                                          buttonWidth, buttonHeight);
    self.actionButton2.frame = CGRectMake(buttonX, buttonRow2y,
                                          buttonWidth, buttonHeight);
    self.actionButton3.frame = CGRectMake(buttonX, buttonRow3y,
                                          buttonWidth, buttonHeight);
    self.actionButton4.frame = CGRectMake(buttonX, buttonRow4y,
                                          buttonWidth, buttonHeight);
}

@end
