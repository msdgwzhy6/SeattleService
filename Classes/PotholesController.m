//
//  PotholesController.m
//  SeattleService
//
//  Created by JD Wallace on 1/9/10.
//  Copyright 2010 jdwallace.com. All rights reserved.
//

#import "PotholesController.h"


@implementation PotholesController
@synthesize issueTypeField;
@synthesize locationField;
@synthesize emailField;
@synthesize nameField;
@synthesize phoneField;
@synthesize descField;
@synthesize submitButton;

- (IBAction)submitForm:(id)sender {
	//TODO: handle submitting form
}

- (IBAction)backgroundTap:(id)sender {
	[issueTypeField resignFirstResponder];
	[locationField resignFirstResponder];
	[emailField resignFirstResponder];
	[nameField resignFirstResponder];
	[phoneField resignFirstResponder];
	[descField resignFirstResponder];
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
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	self.issueTypeField = nil;
	self.locationField = nil;
	self.emailField = nil;
	self.nameField = nil;
	self.phoneField = nil;
	self.descField = nil;
	self.submitButton = nil;
	[super viewDidUnload];
}


- (void)dealloc {
	[issueTypeField release];
	[locationField release];
	[emailField release];
	[nameField release];
	[phoneField release];
	[descField release];
	[submitButton release];
    [super dealloc];
}


@end
