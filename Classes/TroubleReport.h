//
//  TroubleReport.h
//  SeattleService
//
//  Created by JD Wallace on 2/13/10.
//  Copyright 2010 jdwallace.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Location.h"

typedef enum {
	kPavingRepair,
	kSignsAndSignals,
	kDamagedSidewalk,
	kGraffitiReport,
	kStreetLight
} TypeOfRequest;

@interface TroubleReport : NSObject <NSCoding> {
	TypeOfRequest	typeOfRequest;
	Location	*locationOfProblem;
	NSString	*descriptionOfProblem;
	NSString	*userEmail;
	NSString	*userFirstName;
	NSString	*userLastName;
	NSString	*userPhone;
	Location	*userAddress;
}
@property (nonatomic) TypeOfRequest	typeOfRequest;
@property (nonatomic, retain) Location	*locationOfProblem;
@property (nonatomic, retain) NSString	*descriptionOfProblem;
@property (nonatomic, retain) NSString	*userEmail;
@property (nonatomic, retain) NSString	*userFirstName;
@property (nonatomic, retain) NSString	*userLastName;
@property (nonatomic, retain) NSString	*userPhone;
@property (nonatomic, retain) Location	*userAddress;

@end
