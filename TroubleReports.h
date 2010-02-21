//
//  TroubleReports.h
//  SeattleService
//
//  Created by JD Wallace on 2/20/10.
//  Copyright 2010 jdwallace.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TroubleReports : NSObject {
	NSArray *allReports;
	int selectedReportIndex;
}
@property (nonatomic, retain) NSArray *allReports;
@property (nonatomic) int selectedReportIndex;
@end
