//
//  FirstLevelViewController.m
//  SeattleService
//
//  Created by JD Wallace on 2/13/10.
//  Copyright 2010 jdwallace.com. All rights reserved.
//

#import "FirstLevelViewController.h"
#import "TroubleReportController.h"

@implementation FirstLevelViewController
@synthesize controllers;

-(void)viewDidLoad {
	self.title = @"Seattle Service";
	NSMutableArray *array = [[NSMutableArray alloc]init];
	
	//Trouble Report
	TroubleReportController *troubleReportController = [[TroubleReportController alloc]initWithStyle:UITableViewStyleGrouped];
	troubleReportController.title = @"Trouble Report";
	[array addObject:troubleReportController];
	[troubleReportController release];
	
	self.controllers = array;
	[array release];
	[super viewDidLoad];
}
-(void)viewDidUnload {
	self.controllers = nil;
	[super viewDidUnload];
}
-(void)dealloc {
	[controllers release];
	[super dealloc];
}
#pragma mark -
#pragma mark Table Data Source Methods
-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section {
	return [self.controllers count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView
cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *FirstLevelCell = @"FirstLevelCell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FirstLevelCell];
	
	if (cell == nil) {
		cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FirstLevelCell]autorelease];
	}
	//Configure the cell
	NSUInteger row = [indexPath row];
	UITableViewController *controller = [controllers objectAtIndex:row];
	cell.textLabel.text = controller.title;
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	return cell;
}
#pragma mark -
#pragma mark Table View Delegate Methods
-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSUInteger row = [indexPath row];
	UITableViewController *nextController = [self.controllers objectAtIndex:row];
	[self.navigationController pushViewController:nextController animated:YES];
}

@end
