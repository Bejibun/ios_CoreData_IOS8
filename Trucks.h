//
//  Trucks.h
//  Frans_CoreData
//
//  Created by Frans Raharja Kurniawan on 1/7/15.
//  Copyright (c) 2015 Frans Kurniawan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Trucks : NSManagedObject

@property (nonatomic, retain) NSString * make;
@property (nonatomic, retain) NSNumber * mpg;

@end
