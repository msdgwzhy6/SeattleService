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

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	NSLog(@"Potholes View Loaded");
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[issueTypeField release];
	[locationField release];
	[emailField release];
	[nameField release];
	[phoneField release];
	[descField release];
    [super dealloc];
}


@end
