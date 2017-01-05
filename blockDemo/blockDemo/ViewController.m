//
//  ViewController.m
//  blockDemo
//
//  Created by henvy on 28/12/2016.
//  Copyright © 2016 henvy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, copy)NSString *string;
@property (nonatomic, copy)void(^myBlock)();

@end

@implementation ViewController
#define HLWeakSelf(type)  __weak typeof(type) weak##type = type
#define HLStrongSelf(type)  __strong typeof(type) type = weak##type
#define LRStrongSelf(type)  __strong typeof(type) type = weak##type;
- (void)dealloc{
    
    NSLog(@"dealloc:%@",[self class]);
    
}


- (void)testRetainCycle
{
    
//    __weak SampleObject* weaksample = self.sample;
//    __strong SampleObject* strongsample = weaksample;

//    HLStrongSelf(self);
//    self.myBlock = ^{
//        NSLog(@"%@",strongself.string);
//    };
    
    
    self.string = @"henvy";
    
    __weak typeof(self) weakSelf = self;
//    self.myBlock = ^{
//        __strong typeof(weakSelf) strongSelf = weakSelf;
//        NSInteger count =0;
//        while(count < 10) {
//            count++;
//            NSLog(@"%@",strongSelf.string);
//            sleep(1);
//        }
//    };
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^{
        NSInteger count =0;
//        __strong typeof(weakSelf) strongSelf = weakSelf;

        while(count < 10) {
            count++;

//            NSLog(@"%@",weakSelf.string);
            sleep(1);
        }
     
    });
    
//    self.myBlock();

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2*NSEC_PER_SEC)),dispatch_get_main_queue(), ^{
        
        self.string = nil;
    });

}
- (void)test{
    NSLog(@"test");
}
- (void)test2{
    NSLog(@"test2");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //    [self testStaticObj];
    //    [self testLocalObj];
    //    [self testGlobalObj];
    //    [self testBlockObj];
//    [self testWeakObj];
    //    [self forTest];
}
NSString *__globalString = nil;
- (void)testGlobalObj
{
    
    __globalString = @"henvy";
    printf("%p\n",&__globalString);//0x108cea130
    printf("%p\n",__globalString);//0x108ce9290

    void (^testBlock)(void) = ^{
        
        printf("%p\n",&__globalString);//0x108cea130
        printf("%p\n",__globalString);//0x0
        
        NSLog(@"%@", __globalString);//null
    };
    __globalString = nil;

    testBlock();
}//不复制指针,只强引用指针指向的对象一次，地址传递

- (void)testStaticObj
{
    static NSString *staticString = nil;
    staticString = @"henvy";
    
    printf("%p\n", &staticString);//0x10b0d6138
    printf("%p\n", staticString);//0x10b0d5290

    void (^testBlock)() = ^{
        
        printf("%p\n", &staticString);//0x10b0d6138
        printf("%p\n", staticString);//0x0

        NSLog(@"%@", staticString);//null
    };
    staticString = nil;
    
    testBlock();
}//不复制指针,只强引用指针指向的对象一次，地址传递

- (void)testLocalObj
{
    NSString *localString = nil;
    localString = @"henvy";
    
    printf("%p\n", &localString); //0x7fff569cca48
    printf("%p\n", localString); //0x109234290
    void (^testBlock)(void) = ^{
        
        printf("%p\n", &localString); //0x7fcd20511100
        printf("%p\n", localString); //0x109234290

        NSLog(@"%@", localString); //henvy
    };
    localString = nil;
    testBlock();
    printf("%p\n", &localString); //0x7fff569cca48
    printf("%p\n", localString); //0x0
}//复制指针，且强引用指针指向的对象一次,值传递

- (void)testBlockObj
{
    __block NSString *blockString = @"henvy";
    printf("%p\n", &blockString); //0x7fff54507a38
    printf("%p\n", blockString); //0x10b6f9290

    void (^testBlock)(void) = ^{
        printf("%p\n", &blockString); //0x7feb79c1e4b8
        printf("%p\n", blockString); //0x0
        
        NSLog(@"%@", blockString);//null
    };
    
//    _blockString = nil;

    testBlock();
    printf("%p\n", &blockString); //0x7feb79c1e4b8
    printf("%p\n", blockString); //0x0
}//复制指针，且强引用指针指向的对象一次，地址传递

- (void)testWeakObj
{
    NSString *__localString = @"henvy";
    
    __weak NSString *weakString = __localString;
    
    printf("%p\n", &weakString);  //0x7fff54057a40
    printf("%p\n", weakString); //0x10bba9290
    
    void (^testBlock)(void) = ^{
        
        printf("%p\n", &weakString); //0x7f97e3e10a60
        printf("%p\n", weakString); //0x10bba9290
        
        NSLog(@"%@", weakString); //henvy
    };
    
    __localString = nil;
    
    testBlock();
    printf("%p\n", &weakString); //0x7f97e3e10a60
    printf("%p\n", weakString); //0x10bba9290
}

- (void) forTest
{
    typedef int (^GlobalBlock)(int);
    GlobalBlock blk = ^(int count){
        return count;
    };
    
    typedef void (^StackBlock)();
    NSString *str = @"henvy";
    StackBlock block = ^{
        NSLog(@"%@",str);
    };
//    
//    __block int a = 10;
//    block_t returnBlock2 = ^{
//        a = a+1;
//    };
    
    NSLog(@"%@",blk);
    NSLog(@"%@",block);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
