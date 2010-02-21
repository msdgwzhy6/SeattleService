//
//  Location.m
//  SeattleService
//
//  Created by JD Wallace on 2/20/10.
//  Copyright 2010 jdwallace.com. All rights reserved.
//

#import "Location.h"

@implementation Location

@synthesize isPublicProperty;
@synthesize addressNumber;
@synthesize streetPrefix;
@synthesize streetName;
@synthesize streetType;
@synthesize streetSuffix;
@synthesize intersectionFirst;
@synthesize intersectionSecond;
@synthesize corner;
@synthesize zipCode;

-(void)dealloc {
	[streetName release];
	[intersectionFirst release];
	[intersectionSecond release];
	[zipCode release];
	[super dealloc];
}

#pragma mark -
#pragma mark NSCoding
-(void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeBool:self.isPublicProperty forKey:@"IsPublicProperty"];
	[coder encodeInt:self.addressNumber forKey:@"AddressNumber"];
	[coder encodeInt:self.streetPrefix forKey:@"StreetPrefix"];
	[coder encodeObject:self.streetName forKey:@"StreetName"];
	[coder encodeInt:self.streetType forKey:@"StreetType"];
	[coder encodeInt:self.streetSuffix forKey:@"StreetSuffix"];
	[coder encodeObject:self.intersectionFirst forKey:@"IntersectionFirst"];
	[coder encodeObject:self.intersectionSecond forKey:@"IntersectionSecond"];
	[coder encodeInt:self.corner forKey:@"Corner"];
	[coder encodeObject:self.zipCode forKey:@"ZipCode"];
	
}
-(id)initWithCoder:(NSCoder *)coder {
	if (self = [super init]) {
		self.isPublicProperty = [coder decodeBoolForKey:@"IsPublicProperty"];
		self.addressNumber = [coder decodeIntForKey:@"AddressNumber"];
		self.streetPrefix = [coder decodeIntForKey:@"StreetPrefix"];
		self.streetName = [coder decodeObjectForKey:@"StreetName"];
		self.streetType = [coder decodeIntForKey:@"StreetType"];
		self.streetSuffix = [coder decodeIntForKey:@"StreetSuffix"];
		self.intersectionFirst = [coder decodeObjectForKey:@"IntersectionFirst"];
		self.intersectionSecond = [coder decodeObjectForKey:@"IntersectionSecond"];
		self.corner = [coder decodeIntForKey:@"Corner"];
		self.zipCode = [coder decodeObjectForKey:@"ZipCode"];

	}
	return self;
}


@end
