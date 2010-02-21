//
//  PotholeReport.m
//  SeattleService
//
//  Created by JD Wallace on 2/20/10.
//  Copyright 2010 jdwallace.com. All rights reserved.
//

#import "PotholeReport.h"

@implementation PotholeReport

-(id)initWithType:(TypeOfRequest)requestType{
if (self = [super init])
	{
		self.typeOfRequest = requestType;
		switch (requestType) {
			case kPavingRepair:
				self.requestName = @"Minor Paving Repairs";
				break;
			case kDamagedSign:
				self.requestName = @"Street Sign";
				break;
			case kDamagedSignal:
				self.requestName = @"Traffic Signal";
				break;
			case kDamagedSidewalk:
				self.requestName = @"Damaged Sidewalk";
				break;
			default:
				break;
		}
	}
	return self;
}
-(void)dealloc {
	[super dealloc];
}

#pragma mark -
#pragma mark NSCoding
-(void)encodeWithCoder:(NSCoder *)coder {	
}
-(id)initWithCoder:(NSCoder *)coder {
	return self;
}

@end
