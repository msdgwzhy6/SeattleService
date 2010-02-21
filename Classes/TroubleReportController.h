//
//  TroubleReportController.h
//  SeattleService
//
//  Created by JD Wallace on 2/13/10.
//  Copyright 2010 jdwallace.com. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TroubleReports;

typedef struct{
	int NumberOfEditableRows, RowsInUserSection, RowsInReportSection;
}TableDescription;

#define kLabelTag 4096

@interface TroubleReportController : UITableViewController <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource> {
	TroubleReports *troubleReports;
	NSMutableArray *fieldLabels;
	NSMutableDictionary *tempValues;
	NSMutableDictionary *fieldLookup;
	//UITextField *textFieldBeingEdited;
	NSArray *pickerData;
	UIPickerView *issuePickerView;
	UITextField	*pickerField;
	UITableViewCell *pickerCell;
	TableDescription tableDescription;
}
@property (nonatomic, retain) TroubleReports *troubleReports;
@property (nonatomic, retain) NSMutableArray *fieldLabels;
@property (nonatomic, retain) NSMutableDictionary *fieldLookup;
@property (nonatomic, retain) NSMutableDictionary *tempValues;
//@property (nonatomic, retain) UITextField *textFieldBeingEdited;
@property (nonatomic, retain) NSArray *pickerData;
@property (nonatomic, retain) UIPickerView *issuePickerView;
@property (nonatomic, retain) UITextField *pickerField;
@property (nonatomic, retain) UITableViewCell *pickerCell;
@property (nonatomic) TableDescription tableDescription;

-(IBAction)cancel:(id)sender;
-(IBAction)send:(id)sender;
-(IBAction)textFieldDone:(id)sender;
-(IBAction)pickIssue:(id)sender;
@end
