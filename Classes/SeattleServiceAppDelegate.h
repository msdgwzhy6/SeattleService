//
//  SeattleServiceAppDelegate.h
//  SeattleService
//
//  Created by JD Wallace on 1/4/10.
//  Copyright jdwallace.com 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SeattleServiceAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
    UITabBarController *tabBarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
