//
//  TroubleReportController.h
//  SeattleService
//
//  Created by JD Wallace on 2/13/10.
//  Copyright 2010 jdwallace.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondLevelViewController.h"

#define kNumberOfEditableRows 6
#define kTypeOfRequestRowIndex 0
#define	kLocationOfProblemRowIndex 1
#define kDescriptionOfProblemRowIndex 2
#define kUserNameRowIndex 3
#define kUserEmailRowIndex 4
#define kUserPhoneRowIndex 5

#define kLabelTag 4096

@class TroubleReport;

@interface TroubleReportController : SecondLevelViewController <UITextFieldDelegate> {
	TroubleReport troubleReport;
	NSArray *fieldLabels;
	NSMutableDictionary *tempValues;
	UITextField *textFieldBeingEdited;
}
@property (nonatomic, retain) TroubleReport *troubleReport;
@property (nonatomic, retain) NSArray *fieldLabels;
@property (nonatomic, retain) NSMutableDictionary *tempValues;
@property (nonatomic, retain) UITextField *textFieldBeingEdited;

-(IBAction)cancel:(id)sender;
-(IBAction)save:(id)sender;
-(IBAction)textFieldDone:(id)sender;
@end
