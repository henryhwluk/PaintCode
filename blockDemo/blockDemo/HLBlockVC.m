//
//  HLBlockVC.m
//  blockDemo
//
//  Created by henvy on 30/12/2016.
//  Copyright © 2016 henvy. All rights reserved.
//

#import "HLBlockVC.h"

@interface HLBlockVC ()

@end

@implementation HLBlockVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __block HLBlockVC *block = [[HLBlockVC alloc]init];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [block toPrintNum];
    });
    for (int i = 0; i < 51; i ++) {
        NSLog(@"BLOCK WILL NIL");
        if (i == 50) {
            block = nil;
            NSLog(@"BLOCK WAS NIL");
        }
    }
}

- (void) toPrintNum{
    typedef void (^testBlock)();
    __weak __typeof(self)weakSelf = self;
    testBlock block = ^{
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        
        for (int i = 0; i < 100; i ++) {
            [strongSelf go:i];
        }
    };
    block();
}

-(void)go:(int)number{
    NSLog(@"%d",number);
}
-(void)blockTest{
    __block HLBlockVC *point = [HLBlockVC new];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        [point toPrintNum];
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
