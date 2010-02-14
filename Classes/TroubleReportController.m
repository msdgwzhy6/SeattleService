//
//  TroubleReportController.m
//  SeattleService
//
//  Created by JD Wallace on 2/13/10.
//  Copyright 2010 jdwallace.com. All rights reserved.
//

#import "TroubleReportController.h"
#import "SeattleServiceAppDelegate.h"
#import "TroubleReport.h"

@implementation TroubleReportController
@synthesize troubleReport;
@synthesize fieldLabels;
@synthesize tempValues;
@synthesize textFieldBeingEdited;

-(IBAction)cancel:(id)sender {
	[self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)save:(id)sender {
	if (textFieldBeingEdited != nil) {
		NSNumber *tagAsNum = [[NSNumber alloc]initWithInt:textFieldBeingEdited.tag];
		[tempValues setObject:textFieldBeingEdited.text forKey: tagAsNum];
		[tagAsNum release];
	}
	for (NSNumber *key in [tempValues allKeys]) {
		switch ([key intValue]) {
			case kTypeOfRequestRowIndex:
				troubleReport.typeOfRequest = [tempValues objectForKey:key];
				break;
			case kLocationOfProblemRowIndex:
				troubleReport.locationOfProblem = [tempValues objectForKey:key];
				break;
			case kDescriptionOfProblemRowIndex:
				troubleReport.descriptionOfProblem = [tempValues objectForKey:key];
				break;
			case kUserNameRowIndex:
				troubleReport.userName = [tempValues objectForKey:key];
				break;
			case kUserEmailRowIndex:
				troubleReport.userEmail = [tempValues objectForKey:key];
				break;
			case kUserPhoneRowIndex:
				troubleReport.userPhone = [tempValues objectForKey:key];
				break;
			default:
				break;
		}
	}
	[self.navigationController popViewControllerAnimated:YES];
	
	NSArray *allControllers = self.navigationController.viewControllers;
	UITableViewController *parent = [allControllers lastObject];
	[parent.tableView reloadData];
}
-(IBAction)textFieldDone:(id)sender {
	[sender resignFirstResponder];
}
#pragma mark -
-(void)viewDidLoad {
	
}

@end
