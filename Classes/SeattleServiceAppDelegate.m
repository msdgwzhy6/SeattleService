//
//  SeattleServiceAppDelegate.m
//  SeattleService
//
//  Created by JD Wallace on 2/13/10.
//  Copyright jdwallace.com 2010. All rights reserved.
//

#import "SeattleServiceAppDelegate.h"

@implementation SeattleServiceAppDelegate

@synthesize window;
@synthesize navController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {
	[window addSubview:navController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
	[navController release];
    [super dealloc];
}


@end
