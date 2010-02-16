//
//  TroubleReportController.h
//  SeattleService
//
//  Created by JD Wallace on 2/13/10.
//  Copyright 2010 jdwallace.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TroubleReport;

#define kNumberOfEditableRows 6
#define kTypeOfRequestRowIndex 0
#define	kLocationOfProblemRowIndex 1
#define kDescriptionOfProblemRowIndex 2
#define kUserNameRowIndex 3
#define kUserEmailRowIndex 4
#define kUserPhoneRowIndex 5

#define kLabelTag 4096

@interface TroubleReportController : UITableViewController <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource> {
	TroubleReport *troubleReport;
	NSArray *fieldLabels;
	NSMutableDictionary *tempValues;
	UITextField *textFieldBeingEdited;
	NSArray *pickerData;
	UIPickerView *issuePickerView;
	UITextField	*pickerField;
	UITableViewCell *pickerCell;
}
@property (nonatomic, retain) TroubleReport *troubleReport;
@property (nonatomic, retain) NSArray *fieldLabels;
@property (nonatomic, retain) NSMutableDictionary *tempValues;
@property (nonatomic, retain) UITextField *textFieldBeingEdited;
@property (nonatomic, retain) NSArray *pickerData;
@property (nonatomic, retain) UIPickerView *issuePickerView;
@property (nonatomic, retain) UITextField *pickerField;
@property (nonatomic, retain) UITableViewCell *pickerCell;

-(IBAction)cancel:(id)sender;
-(IBAction)send:(id)sender;
-(IBAction)textFieldDone:(id)sender;
-(IBAction)pickIssue:(id)sender;
@end
