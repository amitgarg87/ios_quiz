//
//  AMISwitchViewController.m
//  Amit_test1
//
//  Created by User1 on 2014-06-06.
//  Copyright (c) 2014 Lambton college. All rights reserved.
//

#import "AMISwitchViewController.h"
#import "AMIOneViewController.h"
#import "AMISecondViewController.h"
@interface AMISwitchViewController ()
@property (strong, nonatomic) AMIOneViewController *yellowViewController;
@property (strong, nonatomic) AMISecondViewController *blueViewController;
@end

@implementation AMISwitchViewController

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
    self.blueViewController = [self.storyboard
                               instantiateViewControllerWithIdentifier:
                               @"Blue"];
    [self.view insertSubview:self.blueViewController.view atIndex:0];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    if (!self.blueViewController.view.superview) {
        self.blueViewController = nil;
    } else {
        self.yellowViewController = nil;
    }
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



- (IBAction)switchViews:(id)sender
{
    [UIView beginAnimations:@"View Flip" context:NULL];
    [UIView setAnimationDuration:3];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    if (!self.yellowViewController.view.superview) {
        if (!self.yellowViewController) {
            self.yellowViewController = [self.storyboard
                                         instantiateViewControllerWithIdentifier:@"Yellow"];
        }
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
                               forView:self.view cache:YES];
        [self.blueViewController.view removeFromSuperview];
        [self.view insertSubview:self.yellowViewController.view atIndex:0];
    } else {
        if (!self.blueViewController) {
            self.blueViewController = [self.storyboard
                                       instantiateViewControllerWithIdentifier:@"Blue"];
        }
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                               forView:self.view cache:YES];
        [self.yellowViewController.view removeFromSuperview];
        [self.view insertSubview:self.blueViewController.view atIndex:0];
    }
    [UIView commitAnimations];
}

@end
