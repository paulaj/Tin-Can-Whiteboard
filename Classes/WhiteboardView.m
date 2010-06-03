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
		letsDraw;
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
			//NSLog(@"found equal point");
		}
		else {
		CGContextMoveToPoint(ctx, lastLocation.x, lastLocation.y);
		CGContextAddLineToPoint (ctx, location.x, location.y);
		
		CGContextStrokePath(ctx);
		CGContextFillPath(ctx);
		}	
	}
	
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	UITouch *touch = [[event allTouches] anyObject];
	lastLocation = [touch locationInView:self];
	[letsDraw addObject:[NSMutableArray array]]; 
	[[letsDraw lastObject] addObject: [NSNumber numberWithFloat: lastLocation.x]];
	[[letsDraw lastObject] addObject: [NSNumber numberWithFloat: lastLocation.y]];
	
	NSLog(@"I got a touch");
	NSLog(@"touch pos= %f,%f,", lastLocation.x, lastLocation.y);
	
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch *touch = [[event allTouches] anyObject];
	location = [touch locationInView:self];
	[[letsDraw lastObject] addObject: [NSNumber numberWithFloat: location.x]];
	[[letsDraw lastObject] addObject: [NSNumber numberWithFloat: location.y]];
	[self setNeedsDisplay];
	NSLog(@"I'm moving");
	
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch *touch = [[event allTouches] anyObject];
    location = [touch locationInView:self];
	[[letsDraw lastObject] addObject:[NSNumber numberWithFloat: location.x]];
	[[letsDraw lastObject] addObject:[NSNumber numberWithFloat: location.y]];
	[self setNeedsDisplay];
	NSLog(@"I've ended");
	

}




- (void)dealloc {
    [super dealloc];
}


@end
