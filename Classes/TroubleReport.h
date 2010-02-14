//
//  TroubleReport.h
//  SeattleService
//
//  Created by JD Wallace on 2/13/10.
//  Copyright 2010 jdwallace.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TroubleReport : NSObject <NSCoding> {
	NSString	*typeOfRequest;
	NSString	*locationOfProblem;
	NSString	*descriptionOfProblem;
	NSString	*userEmail;
	NSString	*userName;
	NSString	*userPhone;
	NSString	*userAddress;
	NSString	*userZip;

}
@property (nonatomic, retain) NSString	*typeOfRequest;
@property (nonatomic, retain) NSString	*locationOfProblem;
@property (nonatomic, retain) NSString	*descriptionOfProblem;
@property (nonatomic, retain) NSString	*userEmail;
@property (nonatomic, retain) NSString	*userName;
@property (nonatomic, retain) NSString	*userPhone;
@property (nonatomic, retain) NSString	*userAddress;
@property (nonatomic, retain) NSString	*userZip;

@end
