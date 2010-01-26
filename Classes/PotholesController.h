//
//  PotholesController.h
//  SeattleService
//
//  Created by JD Wallace on 1/9/10.
//  Copyright 2010 jdwallace.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PotholesController : UIViewController {
	UITextField *issueTypeField;
	UITextField *locationField;
	UITextField *emailField;
	UITextField *nameField;
	UITextField *phoneField;
	UITextField *descField;
}
@property (nonatomic, retain) IBOutlet UITextField *issueTypeField;
@property (nonatomic, retain) IBOutlet UITextField *locationField;
@property (nonatomic, retain) IBOutlet UITextField *emailField;
@property (nonatomic, retain) IBOutlet UITextField *nameField;
@property (nonatomic, retain) IBOutlet UITextField *phoneField;
@property (nonatomic, retain) IBOutlet UITextField *descField;
- (IBAction)backgroundTap:(id)sender;
- (IBAction)textFieldDoneEditing:(id)sender;
@end
