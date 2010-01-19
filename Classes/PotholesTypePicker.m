//
//  PotholesTypePicker.m
//  SeattleService
//
//  Created by JD Wallace on 1/18/10.
//  Copyright 2010 jdwallace.com. All rights reserved.
//

#import "PotholesTypePicker.h"
#define BARBUTTON(TITLE, SELECTOR) 	[[[UIBarButtonItem alloc] initWithTitle:TITLE style:UIBarButtonItemStylePlain target:self action:SELECTOR] autorelease]


@implementation PotholesTypePicker

- (NSInteger)numberOfComponentsInPickerView: (UIPickerView *)pickerView
{
	//Picker has 1 wheel
	return 1;
}

- (NSInteger)pickerView: (UIPickerView *)pickerView
numberOfRowsInComponent: (NSInteger)component
{
	//3 options
	return 3;
}

- (NSString *)pickerView: (UIPickerView *)pickerView
			 titleForRow: (NSInteger)row forComponent:(NSInteger)component
{
	switch (row) {
		case 1:
			return @"Minor Paving Repairs";
			break;
		case 2:
			return @"Street Signs/Traffic Signals";
			break;
		case 3:
			return @"Damaged Sidewalks";
			break;
		default:
			return @"Stop scrolling!";
			break;
	}
}

- (void)actionSheet: (UIActionSheet *)actionSheet
clickedButtonAtIndex: (NSInteger)buttonIndex
{
	//Show the current selection
	UIPickerView *pickerView = (UIPickerView *) [actionSheet viewWithTag:101];
	self.title = [NSString stringWithFormat:@"%@",
				  [pickerView selectedRowInComponent:0]];
	[actionSheet release];
}

- (void)action: (id)sender
{
	NSString *title = UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation) ? @"\n\n\n\n\n\n\n\n\n" : @"\n\n\n\n\n\n\n\n\n\n\n\n" ;
	UIActionSheet *actionSheet = [[UIActionSheet alloc]
		initWithTitle:title delegate:self
		cancelButtonTitle:nil
		destructiveButtonTitle:nil
		otherButtonTitles:@"OK", nil];
	[actionSheet showInView:self.view];	
	
	UIPickerView *pickerView = [[[UIPickerView alloc]init]autorelease];
	pickerView.tag = 101;
	pickerView.delegate = self;
	pickerView.dataSource = self;
	pickerView.showsSelectionIndicator = YES;
	
	[actionSheet addSubview:pickerView];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
	return YES;
}

- (void) viewDidLoad
{
	self.navigationItem.rightBarButtonItem = BARBUTTON(@"Action",
													   @selector(action));
}

@end
