//
//  Location.h
//  SeattleService
//
//  Created by JD Wallace on 2/20/10.
//  Copyright 2010 jdwallace.com. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
	kEast,
	kNorth,
	kNorthEast,
	kNorthWest,
	kSouth,
	kSouthEast,
	kSouthWest,
	kWest
} CardinalDirection;
typedef enum{
	kAlley,
	kAvenue,
	kBoulevard,
	kCircle,
	kCrest,
	kCourt,
	kDrive,
	kHighway,
	kLane,
	kLoop,
	kParkway,
	kPlace,
	kRamp,
	kRoad,
	kStreet,
	kTerrace,
	kTrail,
	kView,
	kWay,
	kOther
} StreetType;

@interface Location : NSObject <NSCoding> {
	BOOL				isPublicProperty;
	int					addressNumber;
	CardinalDirection	streetPrefix;
	NSString			*streetName;
	StreetType			streetType;
	CardinalDirection	streetSuffix;
	NSString			*intersectionFirst;
	NSString			*intersectionSecond;
	CardinalDirection	corner;
	NSString			*zipCode;
}
@property (nonatomic) BOOL isPublicProperty;
@property (nonatomic) int addressNumber;
@property (nonatomic) CardinalDirection streetPrefix;
@property (nonatomic, retain) NSString *streetName;
@property (nonatomic) StreetType streetType;
@property (nonatomic) CardinalDirection streetSuffix;
@property (nonatomic, retain) NSString *intersectionFirst;
@property (nonatomic, retain) NSString *intersectionSecond;
@property (nonatomic) CardinalDirection corner;
@property (nonatomic, retain) NSString *zipCode;

@end
