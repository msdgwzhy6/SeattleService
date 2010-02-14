//
//  TroubleReportController.h
//  SeattleService
//
//  Created by JD Wallace on 2/13/10.
//  Copyright 2010 jdwallace.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondLevelViewController.h"


@interface TroubleReportController : SecondLevelViewController {
	NSArray *list;

}
@property (nonatomic, retain) IBOutlet NSArray *list;
@end
