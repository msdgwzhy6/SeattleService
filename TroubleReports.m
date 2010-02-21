//
//  TroubleReports.m
//  SeattleService
//
//  Created by JD Wallace on 2/20/10.
//  Copyright 2010 jdwallace.com. All rights reserved.
//

#import "TroubleReports.h"
#import "PotholeReport.h"

@implementation TroubleReports

@synthesize allReports;
@synthesize selectedReportIndex;

-(id)init{
	if (self = [super init])
    {
		PotholeReport *pavingRepair = [[[PotholeReport alloc]initWithType:kPavingRepair] retain];
		PotholeReport *damagedSign = [[[PotholeReport alloc]initWithType:kDamagedSign] retain];
		PotholeReport *damagedSignal = [[[PotholeReport alloc]initWithType:kDamagedSignal] retain];
		PotholeReport *damagedSidewalk = [[[PotholeReport alloc]initWithType:kDamagedSidewalk] retain];
		NSArray *reports = [NSArray arrayWithObjects:pavingRepair, damagedSign, damagedSignal, damagedSidewalk, nil];
		allReports = reports;
		
		selectedReportIndex = kPavingRepair;
    }
    return self;
}

@end
