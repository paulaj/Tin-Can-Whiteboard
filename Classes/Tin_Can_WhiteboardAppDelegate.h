//
//  Tin_Can_WhiteboardAppDelegate.h
//  Tin-Can-Whiteboard
//
//  Created by Paula Jacobs on 6/1/10.
//  Copyright MIT Media Lab 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Tin_Can_WhiteboardViewController;

@interface Tin_Can_WhiteboardAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Tin_Can_WhiteboardViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Tin_Can_WhiteboardViewController *viewController;

@end

