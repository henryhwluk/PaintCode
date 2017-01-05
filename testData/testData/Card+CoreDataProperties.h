//
//  Card+CoreDataProperties.h
//  testData
//
//  Created by henvy on 03/01/2017.
//  Copyright © 2017 henvy. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface Card (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *no;
@property (nullable, nonatomic, retain) NSManagedObject *psrson;

@end

NS_ASSUME_NONNULL_END
