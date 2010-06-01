//
//  WhiteboardView.m
//  Tin-Can-Whiteboard
//
//  Created by Paula Jacobs on 6/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "WhiteboardView.h"


@implementation WhiteboardView
@synthesize lastLocation;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        self.lastLocation =CGPointMake(0.0, 0.0) ;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	
	if(ctx != nil) {
        
		
		CGContextSetRGBFillColor(ctx, 0, 0, 0, 1);
		CGContextSetRGBStrokeColor(ctx, 0, 0, 1.0, 1);
		
		CGContextFillRect(ctx, CGRectMake(0, 0, 768, 1024));
		
		/*
		if(hover)
            CGContextSetFillColorWithColor(ctx, [self.color colorDarkenedByPercent:0.3].CGColor);
		else
			CGContextSetFillColorWithColor(ctx, self.color.CGColor);
		*/
		CGContextSetRGBFillColor(ctx, 1.0, 0, 0, 1);
		CGPoint a=CGPointMake(0.0, 0.0);
		if(CGPointEqualToPoint(self.lastLocation, a)) {
		}
		else {
		CGContextAddEllipseInRect(ctx, CGRectMake(self.lastLocation.x-50, self.lastLocation.y-50, 100, 100));
		CGContextFillPath(ctx);
        
		//CGContextSetRGBFillColor(ctx, 1.0, 1.0, 1.0, 1.0);
		//CGContextSetRGBStrokeColor(ctx, 1.0, 0.0, 0.0, 1.0);


		//UIFont *f = [UIFont boldSystemFontOfSize:18];
		//CGSize nameSize = [[self.participant.name uppercaseString] sizeWithFont:f];
		
		//[[self.participant.name uppercaseString] drawAtPoint:CGPointMake(-nameSize.width/2, -nameSize.height/2-55) withFont:f];
		
		//CGContextSetFillColorWithColor(ctx, self.color.CGColor);
		
		//CGContextRotateCTM(ctx, M_PI/10);
		
		// Now, draw a circle outside the radius for each todo object.
		//for(int i=0; i<[self.participant.assignedTodos count]; i++) {
			// Draw a circle at zero e
			//CGContextRotateCTM(ctx, M_PI/10);
			//CGContextAddEllipseInRect(ctx, CGRectMake(-140, 0, 30, 30));
			//CGContextFillPath(ctx);
		}
	}
	
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"I got a touch");
	UITouch *touch = [[event allTouches] anyObject];
	self.lastLocation = [touch locationInView:self];
	//CGPointMake(self.lastLocation.x,self.lastLocation.y);
	NSLog(@" pos= %f,%f,", self.lastLocation.x, self.lastLocation.y); 
	[self setNeedsDisplay];
}


- (void)dealloc {
    [super dealloc];
}


@end
