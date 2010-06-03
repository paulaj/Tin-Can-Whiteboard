//
//  WhiteboardView.h
//  Tin-Can-Whiteboard
//
//  Created by Paula Jacobs on 6/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WhiteboardView : UIView {
	CGPoint lastLocation;
	CGPoint location;
	NSMutableArray *myArray;
	Boolean isErasing;
	UIColor *myColor;
	CGFloat myDistance;
}

//@property (nonatomic, assign) CGPoint lastLocation;

@end
