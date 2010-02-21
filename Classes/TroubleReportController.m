//
//  TroubleReportController.m
//  SeattleService
//
//  Created by JD Wallace on 2/13/10.
//  Copyright 2010 jdwallace.com. All rights reserved.
//

#import "TroubleReportController.h"
#import "SeattleServiceAppDelegate.h"
#import "TroubleReports.h"
#import "PotholeReport.h"

@interface TroubleReportController()
- (int)findGlobalRow:(NSIndexPath *)indexPath;
@end

@implementation TroubleReportController
@synthesize troubleReports;
@synthesize fieldLabels;
@synthesize fieldLookup;
@synthesize tempValues;
//@synthesize textFieldBeingEdited;
@synthesize pickerData;
@synthesize issuePickerView;
@synthesize pickerField;
@synthesize pickerCell;
@synthesize tableDescription;

-(IBAction)cancel:(id)sender {
	[pickerCell setSelected:NO animated:NO];
	[self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)send:(id)sender {
	[pickerCell setSelected:NO animated:NO];
	//submit report
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
	troubleReports = [[TroubleReports alloc]init];
	TypeOfRequest typeOfRequest = [[troubleReports.allReports objectAtIndex:troubleReports.selectedReportIndex] typeOfRequest];
	NSMutableDictionary	*fieldsDict = [[NSMutableDictionary alloc] init];
	NSMutableArray *array;
	switch (typeOfRequest) {
		case kPavingRepair:
		case kDamagedSign:
		case kDamagedSignal:
		case kDamagedSidewalk:
			array = [NSMutableArray arrayWithObjects:@"Type:", @"First Name:", @"Last Name:", @"Email:", @"Phone:", @"Location", @"Detail:", nil];
			PotholeReport *thisReport = (PotholeReport *)[troubleReports.allReports objectAtIndex:troubleReports.selectedReportIndex];
			[fieldsDict setValue:thisReport.requestName forKey:@"Type:"];
			[fieldsDict setObject:[[troubleReports.allReports objectAtIndex:troubleReports.selectedReportIndex] userFirstName]	forKey:@"First Name:"];
			[fieldsDict setObject:[[troubleReports.allReports objectAtIndex:troubleReports.selectedReportIndex] userLastName]	forKey:@"Last Name:"];
			[fieldsDict setObject:[[troubleReports.allReports objectAtIndex:troubleReports.selectedReportIndex] userEmail]	forKey:@"Email:"];
			[fieldsDict setObject:[[troubleReports.allReports objectAtIndex:troubleReports.selectedReportIndex] userPhone]	forKey:@"Phone:"];
			[fieldsDict setObject:[[[troubleReports.allReports objectAtIndex:troubleReports.selectedReportIndex] locationOfProblem]  streetName]	forKey:@"Location:"];
			[fieldsDict setObject:[[troubleReports.allReports objectAtIndex:troubleReports.selectedReportIndex] descriptionOfProblem]	forKey:@"Detail:"];
			tableDescription.NumberOfEditableRows = 7;
			tableDescription.RowsInUserSection = 4;
			tableDescription.RowsInReportSection = 2;
			break;
		case kGraffitiReport:
			//Define Graffiti Table Labels
			break;
		case kStreetLight:
			//Define StreetLight Table Labels
			break;
		default:
			break;
	}
	self.fieldLabels = array;
	[fieldLabels retain];
	self.fieldLookup = fieldsDict;
	[fieldsDict release];

	UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancel:)];
	self.navigationItem.leftBarButtonItem = cancelButton;
	[cancelButton release];
	
	UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]initWithTitle:@"Send" style:UIBarButtonItemStyleDone target:self action:@selector(send:)];
	self.navigationItem.rightBarButtonItem = saveButton;
	[saveButton release];
	
	NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
	self.tempValues = dict;
	[dict release];
	
	NSMutableArray *trArray = [[NSMutableArray alloc]init];
	for (TroubleReport *tR in troubleReports.allReports) {
		[trArray addObject:tR.requestName];
	}
	self.pickerData = trArray;
	[typeOfRequest release];
	[super viewDidLoad];
}
-(void)dealloc {
	//[textFieldBeingEdited release];
	[tempValues release];
	[troubleReports release];
	[fieldLabels release];
	[pickerData release];
	[issuePickerView release];
	[pickerField release];
	[pickerCell release];
	[super dealloc];
}
#pragma mark -
#pragma mark Table Data Source Methods
-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section {
	switch (section) {
		case 0:
			return 1;
			break;
		case 1:
			return tableDescription.RowsInUserSection;
			break;
		case 2:
			return tableDescription.RowsInReportSection;
		default:
			return 1;
			break;
	}
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 3;
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
	int globalRow = [self findGlobalRow:indexPath];
	UILabel *label = (UILabel *)[cell viewWithTag:kLabelTag];
	UITextField *textField = nil;
	for (UIView *oneView in cell.contentView.subviews) {
		if ([oneView isMemberOfClass:[UITextField class]])
			textField = (UITextField *)oneView;
	}
	label.text = [fieldLabels objectAtIndex:globalRow];
	NSNumber *rowAsNum = [[NSNumber alloc] initWithInt:globalRow];
	
	if (globalRow == 0) {
		//pickerField = textField;
		pickerCell = cell;
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		textField.text = [fieldLookup valueForKey:[fieldLabels objectAtIndex:globalRow]];
	} else {
		textField.text = [fieldLookup valueForKey:[fieldLabels objectAtIndex:globalRow]];
	}
	
	textField.tag = globalRow;
	[rowAsNum release];
	return cell;
}
-(int)findGlobalRow:(NSIndexPath *)indexPath {
	int globalRow;
	switch (indexPath.section) {
		case 1:
			globalRow = indexPath.row +1;
			break;
		case 2:
			globalRow = 1 + tableDescription.RowsInUserSection + indexPath.row;
			break;
		default:
			globalRow = indexPath.row;
			break;
	}
	return globalRow;
}
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView: (UIPickerView *)pickerView {
	return 1;
}
- (NSInteger)pickerView: (UIPickerView *)pickerView
numberOfRowsInComponent: (NSInteger)component {
	return [pickerData count];
}
#pragma mark -
#pragma mark Table Delegate Methods
-(NSIndexPath *)tableView:(UITableView *)tableView
willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	int globalRow = [self findGlobalRow:indexPath];
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	if (globalRow == 0 && ![cell isSelected]) {
		[self pickIssue:cell];
		return indexPath;
	}
	else {
		return nil;
	}
}
#pragma mark Text Field Delegate Methods
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
	UITableViewCell *cell = (UITableViewCell*)textField.superview.superview;
	if (textField.tag == 0) {
		if (![cell isSelected]) {
			[cell setSelected:YES animated:NO];
			[self pickIssue:cell];
		}
		return NO;
	}
	else
		return YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField {
}
-(void)textFieldDidEndEditing:(UITextField *)textField {
	NSNumber *tagAsNum = [[NSNumber alloc] initWithInt:textField.tag];
	UILabel *label = nil;
	for (UIView *oneView in textField.superview.subviews) {
		if ([oneView isMemberOfClass:[UILabel class]])
			label = (UILabel *)oneView;
	}
	//TODO: [fieldLookup objectForKey:label.text] = textField.text;
	[tagAsNum release];
}
#pragma mark Picker Delegate Methods
- (NSString *)pickerView: (UIPickerView *)pickerView
			 titleForRow: (NSInteger)row forComponent:(NSInteger)component {
	//return [[troubleReports.allReports objectAtIndex:row] requestName];
	return [pickerData objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView
	  didSelectRow:(NSInteger)row
	   inComponent:(NSInteger)component {
	troubleReports.selectedReportIndex = row;
	pickerField.text = [[troubleReports.allReports objectAtIndex:troubleReports.selectedReportIndex] requestName];
	[pickerCell setSelected:NO animated:NO];
	[self dismissPicker:pickerView];
}

-(void)dismissPicker:(UIPickerView *)pickerView {
	[UIView beginAnimations:@"Picker Out" context:nil];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	[UIView setAnimationDuration:0.30f];
	pickerView.transform = CGAffineTransformMakeTranslation(0, pickerView.frame.size.height);
	[UIView commitAnimations];
}

-(void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
	[issuePickerView removeFromSuperview];
}
- (void)pickIssue:(id)sender {	
	UITableViewCell *cell = sender;
	UIView *controllersView = [self view];
	issuePickerView = [[UIPickerView alloc]init];
	issuePickerView.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
	issuePickerView.delegate = self;
	issuePickerView.dataSource = self;
	issuePickerView.showsSelectionIndicator = YES;
	//[issuePickerView selectRow:[pickerData indexOfObject:pickerField.text] inComponent:0 animated:NO];
	[issuePickerView selectRow:[troubleReports selectedReportIndex] inComponent:0 animated:NO];
	CGRect frame = issuePickerView.frame;
	frame.origin.y = controllersView.frame.size.height;
	issuePickerView.frame = frame;
	[cell.superview.superview addSubview:issuePickerView];
	
	[UIView beginAnimations:@"Picker In" context:nil];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	[UIView setAnimationDuration:0.30f];
	issuePickerView.transform = CGAffineTransformMakeTranslation(0, -(issuePickerView.frame.size.height));
	[UIView commitAnimations];
	
}
@end
