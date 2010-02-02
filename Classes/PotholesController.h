//
//  PotholesController.h
//  SeattleService
//
//  Created by JD Wallace on 1/9/10.
//  Copyright 2010 jdwallace.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PotholesController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>{
	UIButton *issueTypeButton;
	UITextField *locationField;
	UITextField *emailField;
	UITextField *nameField;
	UITextField *phoneField;
	UITextField *descField;
	UIButton *submitButton;
	NSArray *pickerData;
	UIPickerView *issuePickerView;
}
@property (nonatomic, retain) IBOutlet UIButton *issueTypeButton;
@property (nonatomic, retain) IBOutlet UITextField *locationField;
@property (nonatomic, retain) IBOutlet UITextField *emailField;
@property (nonatomic, retain) IBOutlet UITextField *nameField;
@property (nonatomic, retain) IBOutlet UITextField *phoneField;
@property (nonatomic, retain) IBOutlet UITextField *descField;
@property (nonatomic, retain) IBOutlet UIButton *submitButton;
@property (nonatomic, retain) NSArray *pickerData;
@property (nonatomic, retain) UIPickerView *issuePickerView;
- (IBAction)backgroundTap:(id)sender;
- (IBAction)textFieldDoneEditing:(id)sender;
- (IBAction)submitForm:(id)sender;
- (IBAction)pickIssue: (id)sender;
- (void)dismissPicker:(UIPickerView *)pickerView;
@end
