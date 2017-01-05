//
//  henvy.h
//  blockDemo
//
//  Created by henvy on 30/12/2016.
//  Copyright © 2016 henvy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface henvy : NSObject
@property (nonatomic, copy)NSString *string;
@property (nonatomic, copy)void(^myBlock)();
@end
