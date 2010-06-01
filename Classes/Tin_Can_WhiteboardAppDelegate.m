//
//  Tin_Can_WhiteboardAppDelegate.m
//  Tin-Can-Whiteboard
//
//  Created by Paula Jacobs on 6/1/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "Tin_Can_WhiteboardAppDelegate.h"
#import "Tin_Can_WhiteboardViewController.h"

@implementation Tin_Can_WhiteboardAppDelegate

@synthesize window;
@synthesize viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];

	return YES;
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
