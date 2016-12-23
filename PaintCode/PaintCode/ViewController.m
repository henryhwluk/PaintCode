//
//  ViewController.m
//  PaintCode
//
//  Created by henvy on 23/12/2016.
//  Copyright © 2016 henvy. All rights reserved.
//

#import "ViewController.h"
#import "LaunchViewTwitter.h"

@interface ViewController ()
@property (strong, nonatomic) LaunchViewTwitter *launchView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self launchAnimation];

}
- (void)launchAnimation {
    UIViewController *viewController = [[UIStoryboard storyboardWithName:@"LaunchScreen" bundle:nil] instantiateViewControllerWithIdentifier:@"LaunchScreen"];
    
    UIView *launchView = viewController.view;
    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;
    launchView.frame = [UIApplication sharedApplication].keyWindow.frame;
    [mainWindow addSubview:launchView];
    
    self.launchView = [[LaunchViewTwitter alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.launchView addLayerToLaunchView];
    [launchView addSubview:self.launchView];
    
    [UIView animateWithDuration:0.5f delay:2.5f options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        launchView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [launchView removeFromSuperview];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
