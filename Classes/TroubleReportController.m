//
//  TroubleReportController.m
//  SeattleService
//
//  Created by JD Wallace on 2/13/10.
//  Copyright 2010 jdwallace.com. All rights reserved.
//

#import "TroubleReportController.h"
#import "SeattleServiceAppDelegate.h"

@implementation TroubleReportController
@synthesize list;
-(void)viewDidLoad {
	NSArray *array = [[NSArray alloc]initWithObjects:@"foo", @"bar", nil];
	self.list = array;
	[array release];
	[super viewDidLoad];
}
-(void)viewDidUnload {
	self.list = nil;
}
-(void)dealloc {
	[list release];
	[super dealloc];
}
#pragma mark -
#pragma mark Table Data Source Methods
-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section {
	return [list count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView
cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString * TroubleReportCellIdentifier = @"TroubleReportCellIdentifier";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TroubleReportCellIdentifier];
	
	if (cell == nil) {
		cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TroubleReportCellIdentifier]autorelease];
	}
	NSUInteger row = [indexPath row];
	NSString *rowString = [list objectAtIndex:row];
	cell.textLabel.text = rowString;
	//cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
	[rowString release];
	return cell;
}
#pragma mark -
#pragma mark Table Delegate Methods
-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	//do something
}
@end
