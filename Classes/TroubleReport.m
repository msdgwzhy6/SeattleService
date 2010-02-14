//
//  TroubleReport.m
//  SeattleService
//
//  Created by JD Wallace on 2/13/10.
//  Copyright 2010 jdwallace.com. All rights reserved.
//

#import "TroubleReport.h"


@implementation TroubleReport
@synthesize typeOfRequest;
@synthesize locationOfProblem;
@synthesize descriptionOfProblem;
@synthesize userEmail;
@synthesize userName;
@synthesize userPhone;
@synthesize userAddress;
@synthesize userZip;

-(void)dealloc {
	[locationOfProblem release];
	[descriptionOfProblem release];
	[userEmail release];
	[userPhone release];
	[userAddress release];
	[userZip release];
	[super dealloc];
}

#pragma mark -
#pragma mark NSCoding
-(void)encodeWithCoder:(NSCoder *)coder {
	if (self = [super init]) {
		[coder encodeObject:self.typeOfRequest forKey:@"TypeOfRequest"];
		[coder encodeObject:self.locationOfProblem forKey:@"LocationOfProblem"];
		[coder encodeObject:self.descriptionOfProblem forKey:@"DescriptionOfProblem"];
		[coder encodeObject:self.userEmail forKey:@"UserEmail"];
		[coder encodeObject:self.userName forKey:@"UserName"]; 
		[coder encodeObject:self.userPhone forKey:@"UserPhone"];
		[coder encodeObject:self.userAddress forKey:@"UserAddress"];
		[coder encodeObject:self.userZip forKey:@"UserZip"];
	}
}
-(id)initWithCoder:(NSCoder *)coder {
	if (self = [super init]) {
		self.typeOfRequest = [coder decodeObjectForKey:@"TypeOfRequest"];
		self.descriptionOfProblem = [coder decodeObjectForKey:@"DescriptionOfProblem"];
		self.userEmail = [coder decodeObjectForKey:@"UserEmail"];
		self.userName = [coder decodeObjectForKey:@"UserName"]; 
		self.userPhone = [coder decodeObjectForKey:@"UserPhone"];
		self.userAddress = [coder decodeObjectForKey:@"UserAddress"];
		self.userZip = [coder decodeObjectForKey:@"UserZip"];
	}
	return self;
}

@end
