//
//  WhiteboardView.m
//  Tin-Can-Whiteboard
//
//  Created by Paula Jacobs on 6/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "WhiteboardView.h"


@implementation WhiteboardView
//@synthesize lastLocation;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	
	if(ctx != nil) {
        
		
		CGContextSetRGBFillColor(ctx, 1.0, 0, 0, 1);
		CGContextSetRGBStrokeColor(ctx, 0, 0, 1.0, 1);
		
		CGContextFillRect(ctx, CGRectMake(100, 100, 50, 20));
		
		
		//if(hover)
//            CGContextSetFillColorWithColor(ctx, [self.color colorDarkenedByPercent:0.3].CGColor);
//		else
//			CGContextSetFillColorWithColor(ctx, self.color.CGColor);
//		
//		CGContextAddEllipseInRect(ctx, CGRectMake(-100, -100, 200, 200));
//		CGContextFillPath(ctx);
//		
//		// Now draw the person's name on top of it.
//		CGContextSetRGBFillColor(ctx, 1.0, 1.0, 1.0, 1.0);
//		CGContextSetRGBStrokeColor(ctx, 1.0, 0.0, 0.0, 1.0);
//		
//		
//		// Going to try drawing with the NSString methods + UIFont, to see if it works.
//		// We wants this because NSString and UIFonts know how they're going to be
//		// rendered, but the straight CG approach doesn't have that info. 
//		
//		UIFont *f = [UIFont boldSystemFontOfSize:18];
//		CGSize nameSize = [[self.participant.name uppercaseString] sizeWithFont:f];
//		
//		[[self.participant.name uppercaseString] drawAtPoint:CGPointMake(-nameSize.width/2, -nameSize.height/2-55) withFont:f];
//		
//		CGContextSetFillColorWithColor(ctx, self.color.CGColor);
//		
//		CGContextRotateCTM(ctx, M_PI/10);
//		
//		// Now, draw a circle outside the radius for each todo object.
//		for(int i=0; i<[self.participant.assignedTodos count]; i++) {
//			// Draw a circle at zero e
//			CGContextRotateCTM(ctx, M_PI/10);
//			CGContextAddEllipseInRect(ctx, CGRectMake(-140, 0, 30, 30));
//			CGContextFillPath(ctx);
//		}
	}
	
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"I got a touch");
	UITouch *touch = [[event allTouches] anyObject];
	lastLocation = [touch locationInView:self];
	CGPointMake(lastLocation.x,lastLocation.y);
	(@" pos= %f,%f,", lastLocation.x, lastLocation.y); 
}


- (void)dealloc {
    [super dealloc];
}


@end
