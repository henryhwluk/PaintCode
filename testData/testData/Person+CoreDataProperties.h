//
//  Person+CoreDataProperties.h
//  testData
//
//  Created by henvy on 03/01/2017.
//  Copyright © 2017 henvy. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *age;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) Card *card;

@end

NS_ASSUME_NONNULL_END
