//
//  ViewController.m
//  StaffManagement
//
//  Created by Derek Harasen on 2015-03-14.
//  Copyright (c) 2015 Derek Harasen. All rights reserved.
//

#import "ViewController.h"
#import "Restaurant.h"
#import "RestaurantManager.h"
#import "Waiter.h"
#import "StaffManagement-Swift.h"
#import "AppDelegate.h"

static NSString * const kCellIdentifier = @"CellIdentifier";

@interface ViewController ()
@property IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSArray *waiters;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    [self waiterList];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self waiterList];
    [[self tableView] reloadData]; // to reload selected cell
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - TableView Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.waiters.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    Waiter *waiter = self.waiters[indexPath.row];
    cell.textLabel.text = waiter.name;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
     AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    if (editingStyle == UITableViewCellEditingStyleDelete){
        Waiter *waiter = self.waiters[indexPath.row];
        waiter.restaurant = nil;
        [waiter setValue:nil forKey:@"restaurant"];
        [[[RestaurantManager sharedManager]currentRestaurant] removeStaffObject:self.waiters[indexPath.row]];
        [self waiterList];
        [appDelegate.managedObjectContext save:nil];
        [[self tableView] reloadData];
    }
}

-(void) waiterList {
    NSSortDescriptor *sortByName = [[NSSortDescriptor alloc]initWithKey:@"name" ascending:YES];
    self.waiters = [[[RestaurantManager sharedManager]currentRestaurant].staff sortedArrayUsingDescriptors:@[sortByName]];
}

@end
