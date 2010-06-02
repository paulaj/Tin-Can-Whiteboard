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
        lastLocation =CGPointMake(0.0, 0.0);
		location =CGPointMake(0.0, 0.0);
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
		
	
		CGContextSetRGBFillColor(ctx, 1.0, 0, 0, 1);
		CGPoint a=CGPointMake(0.0, 0.0);
		if(CGPointEqualToPoint(lastLocation, a)|CGPointEqualToPoint(location, a)) {
			NSLog(@"found equal point");
		}
		else {
//			
//			NSLog(@"painting a new point: %f,%f", lastLocation.x, lastLocation.y);
//			
//		CGContextAddEllipseInRect(ctx, CGRectMake(lastLocation.x-50, lastLocation.y-50, 100, 100));
//		CGContextFillPath(ctx);
//
//		}
		CGContextMoveToPoint(ctx, lastLocation.x, lastLocation.y);
		CGContextAddLineToPoint (ctx, location.x, location.y);
		//CGContextMoveToPoint(ctx, lastLocation.x, lastLocation.y);
		CGContextStrokePath(ctx);
		CGContextFillPath(ctx);
		}	
	}
	//lastLocation =CGPointMake(0.0, 0.0);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"I got a touch");
	UITouch *touch = [[event allTouches] anyObject];
	lastLocation = [touch locationInView:self];
	//CGPointMake(lastLocation.x,lastLocation.y);
	NSLog(@"touch pos= %f,%f,", lastLocation.x, lastLocation.y); 
	
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	//UITouch *touch = [[event allTouches] anyObject];
    //CGPoint location = [touch locationInView:self];
	NSLog(@"I'm moving");
	
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch *touch = [[event allTouches] anyObject];
    location = [touch locationInView:self];
	[self setNeedsDisplay];
	NSLog(@"I've ended");
	

}
- (void)dealloc {
    [super dealloc];
}


@end
