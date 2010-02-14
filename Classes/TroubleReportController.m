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
	NSArray *array = [[NSArray alloc]initWithObjects:@"Type:", @"Location:", @"Detail:", @"Name:", @"Email:", @"Phone:", nil];
	self.fieldLabels = array;
	[array release];
	
	UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancel:)];
	self.navigationItem.leftBarButtonItem = cancelButton;
	[cancelButton release];
	
	UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]initWithTitle:@"Send" style:UIBarButtonItemStyleDone target:self action:@selector(save:)];
	self.navigationItem.rightBarButtonItem = saveButton;
	[saveButton release];
	
	NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
	self.tempValues = dict;
	[dict release];
	[super viewDidLoad];
}
-(void)dealloc {
	[textFieldBeingEdited release];
	[tempValues release];
	[troubleReport release];
	[fieldLabels release];
	[super dealloc];
}
#pragma mark -
#pragma mark Table Data Source Methods
-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section {
	return kNumberOfEditableRows;
}
-(UITableViewCell *)tableView:(UITableView *)tableView
cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *TroubleReportCellIdentifier = @"TroubleReportCellIdentifier";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TroubleReportCellIdentifier];
	
	if (cell == nil) {
		cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TroubleReportCellIdentifier] autorelease];
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 75, 25)];
		label.textAlignment = UITextAlignmentRight;
		label.tag = kLabelTag;
		label.font = [UIFont boldSystemFontOfSize:14];
		[cell.contentView addSubview:label];
		[label release];
		
		UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(90, 12, 200, 25)];
		textField.clearsOnBeginEditing = NO;
		[textField setDelegate:self];
		textField.returnKeyType = UIReturnKeyDone;
		[textField addTarget:self action:@selector(textFieldDone:) forControlEvents:UIControlEventEditingDidEndOnExit];
		[cell.contentView addSubview:textField];
	}
	NSUInteger row = [indexPath row];
	
	UILabel *label = (UILabel *)[cell viewWithTag:kLabelTag];
	UITextField *textField = nil;
	for (UIView *oneView in cell.contentView.subviews) {
		if ([oneView isMemberOfClass:[UITextField class]])
			textField = (UITextField *)oneView;
	}
	label.text = [fieldLabels objectAtIndex:row];
	NSNumber *rowAsNum = [[NSNumber alloc] initWithInt:row];
	switch (row) {
		case kTypeOfRequestRowIndex:
			if ([[tempValues allKeys] containsObject:rowAsNum])
				textField.text = [tempValues  objectForKey:rowAsNum];
			else
				textField.text = troubleReport.typeOfRequest;
			break;
		case kLocationOfProblemRowIndex:
			if ([[tempValues allKeys] containsObject:rowAsNum])
				textField.text = [tempValues  objectForKey:rowAsNum];
			else
				textField.text = troubleReport.locationOfProblem;
			break;
		case kDescriptionOfProblemRowIndex:
			if ([[tempValues allKeys] containsObject:rowAsNum])
				textField.text = [tempValues  objectForKey:rowAsNum];
			else
				textField.text = troubleReport.descriptionOfProblem;
			break;
		case kUserNameRowIndex:
			if ([[tempValues allKeys] containsObject:rowAsNum])
				textField.text = [tempValues  objectForKey:rowAsNum];
			else
				textField.text = troubleReport.userName;
			break;
		case kUserEmailRowIndex:
			if ([[tempValues allKeys] containsObject:rowAsNum])
				textField.text = [tempValues  objectForKey:rowAsNum];
			else
				textField.text = troubleReport.userEmail;
			break;
		case kUserPhoneRowIndex:
			if ([[tempValues allKeys] containsObject:rowAsNum])
				textField.text = [tempValues  objectForKey:rowAsNum];
			else
				textField.text = troubleReport.userPhone;
			break;
		default:
			break;
	}
	if (textFieldBeingEdited == textField)
		textFieldBeingEdited = nil;
	textField.tag = row;
	[rowAsNum release];
	return cell;
}
#pragma mark -
#pragma mark Table Delegate Methods
-(NSIndexPath *)tableView:(UITableView *)tableView
willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	return nil;
}
#pragma mark Text Field Delegate Methods
-(void)textFieldDidBeginEditing:(UITextField *)textField {
	self.textFieldBeingEdited = textField;
}
-(void)textFieldDidEndEditing:(UITextField *)textField {
	NSNumber *tagAsNum = [[NSNumber alloc] initWithInt:textField.tag];
	[tempValues setObject:textField.text forKey:tagAsNum];
	[tagAsNum release];
}
@end
