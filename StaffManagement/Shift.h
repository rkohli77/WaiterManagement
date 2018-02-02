//
//  Shift.h
//  StaffManagement
//
//  Created by Ritz on 2018-02-01.
//  Copyright © 2018 Derek Harasen. All rights reserved.
//

#ifndef Shift_h
#define Shift_h


#endif /* Shift_h */
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Waiter;

@interface Shift : NSManagedObject

@property (nonatomic, retain) NSString * endTime;
@property (nonatomic, retain) NSString * startTime;
@property (nonatomic, retain) Waiter *waiter;
@end

@interface Shift (CoreDataGeneratedAccessors)

- (void)addWaiterObject:(NSManagedObject *)value;
- (void)removeWaiterObject:(NSManagedObject *)value;
- (void)addWaiter:(NSSet *)values;
- (void)removeWaiter:(NSSet *)values;

@end
