//
//  ViewController.h
//  Frans_CoreData
//
//  Created by Frans Raharja Kurniawan on 1/7/15.
//  Copyright (c) 2015 Frans Kurniawan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *makeTextField;
@property (strong, nonatomic) IBOutlet UITextField *mpgTextField;


//Core Data
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (IBAction)addTruckTapped:(id)sender;
- (IBAction)truckDetailTapped:(id)sender;

@end

