//
//  WhiteboardView.h
//  Tin-Can-Whiteboard
//
//  Created by Paula Jacobs on 6/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Button.h"
#import "EraseAllButton.h"

@class EraseAllButton;

@interface WhiteboardView : UIView {
	CGPoint lastLocation;
	CGPoint location;
	NSMutableArray *strokes;
	
	UIColor *myColor;
	CGFloat myDistance;
	NSInteger mySize;
	CFMutableDictionaryRef activeStrokes;
	Button *button;
	EraseAllButton *eraseButton;
}
- (void)eraseAll;
@property (nonatomic, retain) NSMutableArray *strokes;


@end
