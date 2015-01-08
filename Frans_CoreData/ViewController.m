//
//  ViewController.m
//  Frans_CoreData
//
//  Created by Frans Raharja Kurniawan on 1/7/15.
//  Copyright (c) 2015 Frans Kurniawan. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Trucks.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _managedObjectContext = [appDelegate managedObjectContext];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)addTruckTapped:(id)sender {
    
    _managedObjectContext = [appDelegate managedObjectContext];
    
    Trucks *trucks = [NSEntityDescription insertNewObjectForEntityForName:@"Trucks" inManagedObjectContext:_managedObjectContext];
    
    [trucks setMake:_makeTextField.text];
    [trucks setMpg:[NSNumber numberWithInteger:[_mpgTextField.text integerValue]]];
    
    NSError *error = nil;
    if (![_managedObjectContext save:&error]) {
        //handled error
        
    }
    else
    {
        UIAlertView *successSaved = [[UIAlertView alloc]initWithTitle:@"Success" message:@"Saved" delegate:self cancelButtonTitle:@"Nice!" otherButtonTitles: nil];
        [successSaved show];
    }
    
    _mpgTextField.text = NULL;
    _makeTextField.text = NULL;
    
    
}

- (IBAction)truckDetailTapped:(id)sender {
    
    
    _managedObjectContext = [appDelegate managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *cars = [NSEntityDescription entityForName:@"Trucks"  inManagedObjectContext:_managedObjectContext];
    [request setEntity:cars];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"mpg" ascending:YES];
    NSArray *sortDescriptors = [[NSArray alloc]initWithObjects:sortDescriptor, nil];
    [request setSortDescriptors:sortDescriptors];
    
    NSError *error = nil;
    NSArray *mutableFetchResults = [_managedObjectContext executeFetchRequest:request error:&error];
    
    if (mutableFetchResults == nil) {
        
    }
    
    
    for (int i = 0; i < [mutableFetchResults count]; i++) {
        NSManagedObject *fetchInformation = [mutableFetchResults objectAtIndex:i];
        
        UIAlertView *currentInventory = [[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"Item %d :",i+1] message:[NSString stringWithFormat:@"Make : %@\nMPG : %@",[fetchInformation valueForKey:@"make"],[fetchInformation valueForKey:@"mpg"]] delegate:self cancelButtonTitle:@"Okay" otherButtonTitles: nil];
        
        [currentInventory show];
        
        NSLog(@"%@", [fetchInformation valueForKey:@"make"]);
        NSLog(@"%@", [fetchInformation valueForKey:@"mpg"]);
    }
    
}
@end
