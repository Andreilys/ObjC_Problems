
//
//  BNRPalleteViewController.m
//  ColorBoard
//
//  Created by Andrei on 6/22/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "BNRPalleteViewController.h"
#import "BNRColorViewController.h"
#import "BNRColorDescription.h"

@interface BNRPalleteViewController ()
@property (nonatomic) NSMutableArray *colors;

@end

@implementation BNRPalleteViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"NewColor"]){
        //if we are adding a new color create an instance here
        //and add it to the colors array
        
        BNRColorDescription *color = [[BNRColorDescription alloc]init];
        [self.colors addObject:color];
        
        //then use the segue to set the color on the view controller
        UINavigationController *nc = (UINavigationController *)segue.destinationViewController;
        BNRColorViewController *mvc = (BNRColorViewController *)[nc topViewController];
        mvc.colorDescription = color;
    }
    else if ([segue.identifier isEqualToString:@"ExistingColor"]){
        //for the push segue the sender is the uitableviewcell
        NSIndexPath *ip = [self.tableView indexPathForCell:sender];
        BNRColorDescription *color = self.colors[ip.row];
        
        //set the color and also tell the view controller that this is the existing color
        BNRColorViewController *cvc = (BNRColorViewController *)segue.destinationViewController;
        cvc.colorDescription = color;
        cvc.existingColor = YES;
    }
}

-(NSMutableArray *) colors
{
    if(!_colors){
        _colors = [NSMutableArray array];
    
    BNRColorDescription *cd = [[BNRColorDescription alloc] init];
    [_colors addObject:cd];
    }
return _colors;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.colors count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    BNRColorDescription *color = self.colors[indexPath.row];
    cell.textLabel.text = color.name;
    return cell;
}
@end
