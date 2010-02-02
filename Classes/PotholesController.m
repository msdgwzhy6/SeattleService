//
//  PotholesController.m
//  SeattleService
//
//  Created by JD Wallace on 1/9/10.
//  Copyright 2010 jdwallace.com. All rights reserved.
//

#import "PotholesController.h"

@implementation PotholesController
@synthesize issueTypeButton;
@synthesize locationField;
@synthesize emailField;
@synthesize nameField;
@synthesize phoneField;
@synthesize descField;
@synthesize submitButton;
@synthesize pickerData;
@synthesize issuePickerView;

- (IBAction)submitForm:(id)sender {
	//TODO: handle submitting form
}

- (void)pickIssue: (id)sender
{	
	UIView *controllersView = [self view];
	 issuePickerView = [[UIPickerView alloc]init];
	//issuePickerView.tag = 101;
	issuePickerView.delegate = self;
	issuePickerView.dataSource = self;
	issuePickerView.showsSelectionIndicator = YES;
	CGRect frame = issuePickerView.frame;
	frame.origin.y = controllersView.frame.size.height;
	issuePickerView.frame = frame;
	[controllersView addSubview:issuePickerView];
	
	[UIView beginAnimations:@"Picker In" context:nil];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	[UIView setAnimationDuration:0.30f];
	issuePickerView.transform = CGAffineTransformMakeTranslation(0, -(issuePickerView.frame.size.height));
	[UIView commitAnimations];
	
}

- (IBAction)backgroundTap:(id)sender {
	[locationField resignFirstResponder];
	[emailField resignFirstResponder];
	[nameField resignFirstResponder];
	[phoneField resignFirstResponder];
	[descField resignFirstResponder];
	[self dismissPicker:issuePickerView];
	
}

- (IBAction)textFieldDoneEditing:(id)sender {
	[sender resignFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	UIImage *buttonImageNormal = [UIImage imageNamed:@"whiteButton.png"];
	UIImage *stretchableButtonImageNormal = [buttonImageNormal stretchableImageWithLeftCapWidth:12 topCapHeight:0];
	[submitButton setBackgroundImage:stretchableButtonImageNormal forState:UIControlStateNormal];
	
	UIImage *buttonImagePressed = [UIImage imageNamed:@"blueButton.png"];
	UIImage *stretchableButtonImagePressed = [buttonImagePressed stretchableImageWithLeftCapWidth:12 topCapHeight:0];
	[submitButton setBackgroundImage:stretchableButtonImagePressed forState:UIControlStateHighlighted];
	
	NSArray *array = [[NSArray alloc] initWithObjects:@"Minor Paving Repairs", @"Street Signs/Traffic Signals", @"Damaged Sidewalks", nil];
	self.pickerData = array;
	[issueTypeButton setTitle:[pickerData objectAtIndex:0]
					 forState:UIControlStateNormal];
	[array release];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)viewDidUnload {
	self.issueTypeButton = nil;
	self.locationField = nil;
	self.emailField = nil;
	self.nameField = nil;
	self.phoneField = nil;
	self.descField = nil;
	self.submitButton = nil;
	self.pickerData = nil;
	self.issuePickerView = nil;
	[super viewDidUnload];
}

- (void)dealloc {
	[issueTypeButton release];
	[locationField release];
	[emailField release];
	[nameField release];
	[phoneField release];
	[descField release];
	[submitButton release];
	[pickerData release];
	[issuePickerView release];
    [super dealloc];
}

#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView: (UIPickerView *)pickerView
{
	return 1;
}

- (NSInteger)pickerView: (UIPickerView *)pickerView
numberOfRowsInComponent: (NSInteger)component
{
	return [pickerData count];
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView: (UIPickerView *)pickerView
			 titleForRow: (NSInteger)row forComponent:(NSInteger)component
{
	return [pickerData objectAtIndex:row];
}
 
- (void)pickerView:(UIPickerView *)pickerView
	  didSelectRow:(NSInteger)row
	   inComponent:(NSInteger)component
{
	[issueTypeButton setTitle:[pickerData objectAtIndex:row]
					 forState:UIControlStateNormal];
	[self dismissPicker:pickerView];
	
}

-(void)dismissPicker:(UIPickerView *)pickerView
{
	[UIView beginAnimations:@"Picker Out" context:nil];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	[UIView setAnimationDuration:0.30f];
	pickerView.transform = CGAffineTransformMakeTranslation(0, pickerView.frame.size.height);
	[UIView commitAnimations];
}

-(void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
	[issuePickerView removeFromSuperview];
}

@end
