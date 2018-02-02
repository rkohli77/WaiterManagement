//
//  Waiter.h
//  StaffManagement
//
//  Created by Derek Harasen on 2015-03-14.
//  Copyright (c) 2015 Derek Harasen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Shift.h"

@class Restaurant;

@interface Waiter : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Restaurant *restaurant;
@property (nonatomic, retain) NSSet *shifts;
@end

@interface Waiter (CoreDataGeneratedAccessors)

- (void)addShiftObject:(NSManagedObject *)value;
- (void)removeShiftObject:(NSManagedObject *)value;
- (void)addShift:(NSSet *)values;
- (void)removeShift:(NSSet *)values;

@end
