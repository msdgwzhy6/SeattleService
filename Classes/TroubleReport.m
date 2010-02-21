//
//  TroubleReport.m
//  SeattleService
//
//  Created by JD Wallace on 2/13/10.
//  Copyright 2010 jdwallace.com. All rights reserved.
//

#import "TroubleReport.h"
#import "Location.h"


@implementation TroubleReport

@synthesize typeOfRequest;
@synthesize requestName;
@synthesize locationOfProblem;
@synthesize descriptionOfProblem;
@synthesize userEmail;
@synthesize userFirstName;
@synthesize userLastName;
@synthesize userPhone;
@synthesize userAddress;

-(void)dealloc {
	[locationOfProblem release];
	[requestName release];
	[descriptionOfProblem release];
	[userEmail release];
	[userFirstName release];
	[userLastName release];
	[userPhone release];
	[userAddress release];
	[super dealloc];
}
-(id)init{
	if (self = [super init]) {
		userFirstName = @"";
		userLastName = @"";
		userEmail = @"";
		userPhone = @"";
		locationOfProblem = [[Location alloc]init];
		descriptionOfProblem = @"";
	}	
	return self;
}

#pragma mark -
#pragma mark NSCoding
-(void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeInt:self.typeOfRequest forKey:@"TypeOfRequest"];
	[coder encodeObject:self.requestName forKey:@"RequestName"];
	[coder encodeObject:self.locationOfProblem forKey:@"LocationOfProblem"];
	[coder encodeObject:self.descriptionOfProblem forKey:@"DescriptionOfProblem"];
	[coder encodeObject:self.userEmail forKey:@"UserEmail"];
	[coder encodeObject:self.userFirstName forKey:@"UserFirstName"]; 
	[coder encodeObject:self.userLastName forKey:@"UserLastName"]; 
	[coder encodeObject:self.userPhone forKey:@"UserPhone"];
	[coder encodeObject:self.userAddress forKey:@"UserAddress"];	
}
-(id)initWithCoder:(NSCoder *)coder {
	if (self = [super init]) {
		self.typeOfRequest = [coder decodeIntForKey:@"TypeOfRequest"];
		self.requestName = [coder decodeObjectForKey:@"RequestName"];
		self.descriptionOfProblem = [coder decodeObjectForKey:@"DescriptionOfProblem"];
		self.userEmail = [coder decodeObjectForKey:@"UserEmail"];
		self.userFirstName = [coder decodeObjectForKey:@"UserFirstName"]; 
		self.userLastName = [coder decodeObjectForKey:@"UserLastName"]; 
		self.userPhone = [coder decodeObjectForKey:@"UserPhone"];
		self.userAddress = [coder decodeObjectForKey:@"UserAddress"];
	}
	return self;
}

@end
