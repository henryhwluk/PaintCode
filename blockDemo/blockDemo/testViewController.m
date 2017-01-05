//
//  testViewController.m
//  blockDemo
//
//  Created by henvy on 29/12/2016.
//  Copyright © 2016 henvy. All rights reserved.
//

#import "testViewController.h"

@interface testViewController ()

@end

@implementation testViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self blockTest];

}
- (void) netwrokDataBack{
    typedef void (^SuccBlock)();
    __weak __typeof(self)weakSelf = self;
    SuccBlock block = ^{
        __strong __typeof(weakSelf) strongSelf = weakSelf;

        for (int i = 0; i < 100; i ++) {
            [strongSelf go:i];
        }
    };
    block();
}

-(void)go:(int)number{
    NSLog(@"BLOCK GO %d",number);
}
-(void)blockTest{
    __block testViewController *point = [testViewController new];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        [point netwrokDataBack];
    });
    for (int i = 0; i < 51; i ++) {
        NSLog(@"Point will die");
        if (i == 50) {
            point = nil;
            NSLog(@"NO REFERENCE");
        }
    }
    NSLog(@"OVER");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
