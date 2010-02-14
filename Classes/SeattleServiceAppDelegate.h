//
//  SeattleServiceAppDelegate.h
//  SeattleService
//
//  Created by JD Wallace on 2/13/10.
//  Copyright jdwallace.com 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SeattleServiceAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UINavigationController *navController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navController;

@end

